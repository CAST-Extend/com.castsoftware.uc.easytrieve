import cast_upgrade_1_6_23 # @UnusedImport
from cast.application import ApplicationLevelExtension
from logging import info, debug
from cast import Event


class MissingSQLObjects(ApplicationLevelExtension):

    @Event('com.castsoftware.sqlanalyzer', 'create_missing_objects')
    def create_missing_objects(self, service):
        # test
        info(' Start create_missing_objects for Easytrieve  ... ')
        try:
            service.create_missing_objects('Easyproject',
                                           'CAST_SQL_MetricableQuery',
                                           138293,
                                           'Easy_MissingTable_Schema',
                                           'Easy_MissingTable_Table',
                                           'Easy_MissingTable_Procedure',
                                           'Easytrieve')
        except Exception as unexpected_py_exception:
            debug(' Internal exception with  create_missing_objects for Easytrieve (%s)... '
                  % unexpected_py_exception)

        info(' End create_missing_objects for Easytrieve ... ')



