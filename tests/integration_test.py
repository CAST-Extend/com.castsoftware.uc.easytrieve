import unittest
import cast.analysers.test


def get_data_created_by_plugin(analysis):

    projects = analysis.get_objects_by_category('CAST_PluginProject').items()

    this_project = None

    for _, project in projects:
        
        if getattr(project, 'CAST_Scriptable.id') == 'com.castsoftware.uc.easytrieve':
            this_project = project
            break

    ua_projects = analysis.get_objects_by_category('Easyproject').items()

    ua_project = None
    
    for _, project in ua_projects:
        
        ua_project = project
        break

    
    objects_produced = set() 
    
    for _, link in analysis.get_objects_by_category('isInProjectLink').items():
        
        if getattr(link, 'link.callee') in (this_project, ua_project):
            
            _object = getattr(link,'link.caller')
            # skip project itself
            if getattr(_object,'type') != 'CAST_PluginProject':
                
                objects_produced.add(_object)
            
    links_produced = set()
    
    if this_project:
        for _, link in analysis.get_objects_by_property('link.project', this_project, 'link').items():
            links_produced.add(link)

    if ua_project:
        for _, link in analysis.get_objects_by_category('link').items():
            if getattr(link, 'link.callee') in objects_produced or getattr(link, 'link.caller') in objects_produced:
                links_produced.add(link)
    
    print('objects')
    for o in objects_produced:
        
        print('  ', o.type, getattr(o,'identification.fullName'), getattr(o,'identification.name'))
        if hasattr(o,'CAST_Java_Service_DebugInformation.debug'):
            print('  ', '  ', getattr(o,'CAST_Java_Service_DebugInformation.debug'))
            
    
    print('links')
    for o in links_produced:
        
        caller = getattr(o, 'link.caller')
        callee = getattr(o, 'link.callee')
        
        print('  ', caller.type, getattr(caller,'identification.fullName'), '-', o.type, '->', callee.type, getattr(callee,'identification.fullName'))



class TestIntegration(unittest.TestCase):

    def test_procedure_link(self):
        # PERFORM <procedure-name>
        
        analysis = cast.analysers.test.UATestAnalysis('Easytrieve')
        analysis.add_dependency('com.castsoftware.internal.platform')
        analysis.add_dependency('com.castsoftware.wbslinker')
        
        analysis.add_selection('IBM.sample/DEMOESY2.ezt')
#         analysis.set_verbose(True)
        analysis.run()

#         get_data_created_by_plugin(analysis)

        program = analysis.get_object_by_name('DEMOESY2', 'Eztprogram')
        self.assertTrue(program)

        procedure = analysis.get_object_by_name('MOVE-SMYFIL2', 'Easyproc')
        self.assertTrue(procedure)

        self.assertTrue(analysis.get_link_by_caller_callee('callLink', program, procedure))
        
    def test_put_file_link(self):

        analysis = cast.analysers.test.UATestAnalysis('Easytrieve')
        
        analysis.add_dependency('com.castsoftware.internal.platform')
        analysis.add_dependency('com.castsoftware.wbslinker')
        
        analysis.add_selection('IBM.sample/DEMOESY2.ezt')
#         analysis.set_verbose(True)
        analysis.run()

#         get_data_created_by_plugin(analysis)

        procedure = analysis.get_object_by_name('EXTRACT-ROUTINE', 'Easyproc')
        self.assertTrue(procedure)

        file = analysis.get_object_by_name('ME7232', 'Easyfile')
        self.assertTrue(file)

        self.assertTrue(analysis.get_link_by_caller_callee('accessWriteLink', procedure, file))

    def test_create_sql_query(self):

        analysis = cast.analysers.test.UATestAnalysis('Easytrieve')
        
        analysis.add_dependency('com.castsoftware.internal.platform')
        analysis.add_dependency('com.castsoftware.wbslinker')
        
        analysis.add_selection('IBM.sample/DEMODB2B.ezt')
#         analysis.set_verbose()
        analysis.run()

#         get_data_created_by_plugin(analysis)
                
        program = analysis.get_object_by_name('DEMODB2B', 'Eztprogram')
        self.assertTrue(program)

        query = analysis.get_object_by_name('INCLUDE (CUST_ID, CUST_ACCT_PRDCT_CD CUST_ACCT_ID)', 'EasySQLQuery')
        self.assertTrue(query)

        self.assertTrue(analysis.get_link_by_caller_callee('callLink', program, query))
        self.assertTrue(analysis.get_link_by_caller_callee('parentLink', query, program))

        self.assertEqual(''' INCLUDE
          (CUST_ID, CUST_ACCT_PRDCT_CD CUST_ACCT_ID)
       LOCATION *
       NULLABLE
       FROM CUST_TB''', getattr(query, 'CAST_SQL_MetricableQuery.sqlQuery'))

    def test_get_file_link(self):

        analysis = cast.analysers.test.UATestAnalysis('Easytrieve')
        
        analysis.add_dependency('com.castsoftware.internal.platform')
        analysis.add_dependency('com.castsoftware.wbslinker')
        
        analysis.add_selection('IBM.sample/DEMOESY2.ezt')
#         analysis.set_verbose(True)
        analysis.run()

#         get_data_created_by_plugin(analysis)

        procedure = analysis.get_object_by_name('TEST-TRANS', 'Easyproc')
        self.assertTrue(procedure)

        file = analysis.get_object_by_name('M8134D', 'Easyfile')
        self.assertTrue(file)

        self.assertTrue(analysis.get_link_by_caller_callee('accessReadLink', procedure, file))

    def test_job_input_file_link(self):

        analysis = cast.analysers.test.UATestAnalysis('Easytrieve')
        
        analysis.add_dependency('com.castsoftware.internal.platform')
        analysis.add_dependency('com.castsoftware.wbslinker')
        
        analysis.add_selection('IBM.sample/DEMODB2B.ezt')
#         analysis.set_verbose(True)
        analysis.run()

#         get_data_created_by_plugin(analysis)

        procedure = analysis.get_object_by_name('DEMODB2B', 'Eztprogram')
        self.assertTrue(procedure)

        file = analysis.get_object_by_name('FILEIN1', 'Easyfile')
        self.assertTrue(file)

        self.assertTrue(analysis.get_link_by_caller_callee('accessReadLink', procedure, file))

    def test_print_report(self):

        analysis = cast.analysers.test.UATestAnalysis('Easytrieve')
        
        analysis.add_dependency('com.castsoftware.internal.platform')
        analysis.add_dependency('com.castsoftware.wbslinker')
        
        analysis.add_selection('IBM.sample/DEMODB2A.ezt')
#         analysis.set_verbose(True)
        analysis.run()

#         get_data_created_by_plugin(analysis)

        procedure = analysis.get_object_by_name('DEMODB2A', 'Eztprogram')
        self.assertTrue(procedure)

        file = analysis.get_object_by_name('REPORT1', 'Easyreport')
        self.assertTrue(file)

        self.assertTrue(analysis.get_link_by_caller_callee('accessReadLink', procedure, file))

    def test_sort_link(self):

        analysis = cast.analysers.test.UATestAnalysis('Easytrieve')
        
        analysis.add_dependency('com.castsoftware.internal.platform')
        analysis.add_dependency('com.castsoftware.wbslinker')
        
        analysis.add_selection('sample1/SAMPLE.esy')
#         analysis.set_verbose(True)
        analysis.run()

#         get_data_created_by_plugin(analysis)

        procedure = analysis.get_object_by_name('SAMPLE', 'Eztprogram')
        self.assertTrue(procedure)

        file = analysis.get_object_by_name('PERSNL', 'Easyfile')
        self.assertTrue(file)

        self.assertTrue(analysis.get_links_by_caller_callee('accessReadLink', procedure, file))


if __name__ == "__main__":
    unittest.main()
