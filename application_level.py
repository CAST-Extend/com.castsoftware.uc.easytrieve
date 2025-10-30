import cast_upgrade_1_6_23 # @UnusedImport
from cast.application import ApplicationLevelExtension, create_link
import logging
from builtins import len
import cast.application



class JCLtoEasytrieve(ApplicationLevelExtension):

    def end_application(self, application):
         
        logging.info("Running code at the end of an application")
        
        logging.info("****** Searching for CAST_COBOL_ProgramPrototype")
        cobol_unknown_list = []
        
        logging.info("****** Searching for Easytrieve Programs****")
        ezt_pgm = []
        self.ctlLinks = []

        
        for ezt in application.objects().has_type('Eztprogram'):
            ezt_pgm.append(ezt)
        logging.info("****** Number of Easytrive Programs {}".format(str(len(ezt_pgm))))


        ## Cobol to Easytrieve Calls. This also covers JCL to Easytrieve Calls        
        for cobol_unknown in application.objects().has_type('CAST_COBOL_ProgramPrototype'):
            logging.debug ("Cobol CAST_COBOL_ProgramPrototype found: {}".format(cobol_unknown.get_name()))
            cobol_unknown_list.append(cobol_unknown)

        logging.info("****** Number of CAST_COBOL_ProgramPrototype {}".format(str(len(cobol_unknown_list))))
         
        for link in application.links().has_callee(application.objects().has_type(['CAST_COBOL_UtilityProgram'])).has_caller(application.objects().has_type('CAST_JCL_Step')):
            caller_id = 0
            cbl_pgm_callee = None
            eztpa00_caller = None
            eztpa00_caller_id = None
            found_unknown_cbl_pgm = False
            stepBookmark = None
            if link.get_callee().name == 'EZTPA00':
                eztpa00_caller = link.get_caller()
                eztpa00_caller_id = link.get_caller().id
                for l in application.links().has_callee(application.objects().has_type(['CAST_COBOL_ProgramPrototype'])).has_caller(application.objects().has_type('CAST_JCL_Step')):
                    if l.get_caller().id == eztpa00_caller_id and l.get_callee().name != 'EZTPA00':
                        cbl_pgm_callee = l.get_callee()
                        found_unknown_cbl_pgm = True
                        break
            
            if found_unknown_cbl_pgm:
                for ezt in ezt_pgm:
                    if ezt.name == cbl_pgm_callee.name:
                        create_link('callLink', eztpa00_caller, ezt, bookmark=None)
                        break

        for esy_pgm in ezt_pgm:
            for cobol_unknown in cobol_unknown_list:
                if cobol_unknown.get_name() == esy_pgm.get_name():
                    # we have a match
                    link = ('matchLink', cobol_unknown, esy_pgm)
                    create_link(*link)
        
        
        for link2 in  application.links().load_positions().has_caller(application.objects().has_type("CAST_JCL_Step")).has_callee(application.objects().has_type(['CAST_JCL_Dataset','CAST_JCL_ResolvedDataset'])):
            sysin_dataset_name = link2.get_callee().get_name()
            jcl_step_caller =  link2.get_caller()
            if len(link2.get_positions()) > 0:
                bookmark_pos = link2.get_positions()[0]
                jcldataset = link2.get_callee()
                if "(" in sysin_dataset_name:
                    member_name = sysin_dataset_name.split("(")[1].split(")")[0]
                    if not member_name.isnumeric() and '+' not in member_name and '-' not in member_name and '&' not in member_name:
                        try:
                            for obj in ezt_pgm:
                                if obj.get_name() == member_name:
                                    link_to_create = ["accessLink", jcldataset, obj,bookmark_pos]
                                    self.ctlLinks.append(link_to_create)
                        except KeyError:
                            pass


        self.step_link_created = 0
        
        for link in self.ctlLinks:
            try:
                create_link(*link)
                self.step_link_created += 1
            except:
                pass 

        logging.info(" Number of links created between JCL Step and Easytrieve Program " + str(self.step_link_created))
        