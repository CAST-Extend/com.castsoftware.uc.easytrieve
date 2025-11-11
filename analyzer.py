import cast_upgrade_1_6_23
from cast.analysers import ua, log, CustomObject, create_link, Bookmark
from cast.application import open_source_file
import os, traceback
from collections import defaultdict
from symbols import Library, Module


class EaysytrieveExtension(ua.Extension):
    
    def __init__(self):
        self.active = True
        self.extensions = ['.esy', '.mac', '.ezt']
        # main container of symbols
        self.library = Library()
        
    def start_analysis(self):
        try:
            options = cast.analysers.get_ua_options() #@UndefinedVariable
            self.active = False
            if 'Easytrieve' in options:
                self.active = True
                self.extensions = options['Easytrieve'].extensions
            else:
                self.active = False
        except Exception as e:
            pass # unit test
        
    def start_file(self, _file):
        if not self.active:
            return
        filepath = _file.get_path().lower()
        _, ext = os.path.splitext(filepath)
        if ext not in self.extensions:
            # not an easytrieve file
            return

        module = Module(_file.get_path(), _file=_file)
        self.library.add_module(module)
        module.light_parse()

    def end_analysis(self):
        if not self.active:
            return
        
        # second pass
        for module in self.library.get_modules():
            try:
                log.info('Scanning ' + str(module.get_path()))
                module.fully_parse()
                module.resolve()
                module.save()
                module.save_links()
            except:
                log.warning('Issue during scan of ' + str(module.get_path()) + traceback.format_exc())

