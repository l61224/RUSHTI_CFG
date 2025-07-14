601,100
602,"Sys.RushTI Instance Information.Update"
562,"VIEW"
586,"Sys RushTI Instance Information"
585,"Sys RushTI Instance Information"
564,
565,"nx7bJU<RCzg7Eaa1w\D0GLbprOPZYrI@^z:swcPdNyyhhzv;NBZJ]Rv0`4Ad0l2>f9S<2b\T2bRzYFmIv:YKC79FIIYh9\8w6A^v>e4R7X>H_FPF7EcFSUhXVjj9L=z6yZPr>O9jtbOa8RpZVX`opqpf^LgTWj=L\b8eY5X>:nq?z0yxs07el<rPBt[[chf;=F8E`tcU"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,","
568,""""
570,Default
571,
569,0
592,0
599,1000
560,2
pDoProcessLogging
pDebug
561,2
2
2
590,2
pDoProcessLogging,"1"
pDebug,"0"
637,2
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
577,4
vInstance
vIndex
vMeasure
vValue
578,4
2
2
2
2
579,4
1
2
3
4
580,4
0
0
0
0
581,4
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,164
#Region - Header
##################################################################################################################
# PURPOSE:
#    Update config.ini file for RushTI used
#
# DATA SOURCE:
#     Cube: 'Sys RushTI Instance Information'/ 'Instance Name'
#
# REMARK:
#     This process will:
#         1. Update config.ini
#         2. Update dim: 'Sys RushTI Instance'
#   
# CHANGE HISTORY:
#   DATE          CHANGED BY          COMMENT
#   2025-07-09    Jacky Lai           Create Process
##############################################################################################################
#EndRegion - Header
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
#Region - Initialize Logging

sThisProcName = GetProcessName(); sProcLogParams = '';
### Params
# If you want to explicitly choose yourself which parameters will be logged then set the sProcLogParams variable like in the example below
# sProcLogParams = Expand('pParam1:%pParam1% & pParam2:%pParam2% & pParam3:%pParam3% & pParamN:%pParamN%');
# If you leave the variable blank per the default value then all parameters will be automatically gathered from the system cube and inserted in the log
### Params
If( pDoProcessLogging @= '1' );
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQ Processes',sThisProcName)=0);DimensionElementInsertDirect('}APQ Processes','',sThisProcName,'N');DimensionElementComponentAddDirect('}APQ Processes','Total APQ Processes',sThisProcName,1);EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');nCountTime=nCountTime+1;End;
  If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;

#EndRegion - Initialize Logging
##############################################################################################################

##############################################################################################################
#Region - Declare Constants
# Standard naming convention for source and target cubes/dimensions
cCubSrc         = 'Sys RushTI Instance Information';
cCubTgt         = 'Sys RushTI Instance Information';
cCubSys         = 'Sys Parameter';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';
 
DatasourceASCIIQuoteCharacter='';
 
# String
cInstanceSrc    = 'Default Instance';
cMeasureSrc     = 'Instance Name';

cCfgFilePath    = CellGetS( 'Sys RushTI Parameter', 'RushTI Config.ini Path', 'Text');

#EndRegion - Declare Constants
##############################################################################################################
 
######################
### Log Process Response Message
# DELETE if NOT REQUIRED
If(DimIx('}APQ Clients', sProcessRunBy)=0 & DimIx('}Clients', sProcessRunBy)>0);DimensionElementInsertDirect('}APQ Clients', '', sProcessRunBy, 'N');EndIf;
If(DimIx('}APQ Processes', sThisProcName)=0 & DimIx('}Processes', sThisProcName)>0);DimensionElementInsertDirect('}APQ Processes', '', sThisProcName, 'N');EndIf;
If( DimIx('}APQ Clients', sProcessRunBy)>0 & DimIx('}APQ Processes', sThisProcName)>0);
  cCubRespMsg = '}APQ Process Response Message';
  cDTformat = CellGetS(cCubParam, 'Date Time format', 'String');
  CellPutS(TimSt(nProcessStartTime, cDTformat), cCubRespMsg, sProcessRunBy, sThisProcName, 'Start Time');
  CellPutS(sProcLogParams, cCubRespMsg, sProcessRunBy, sThisProcName, 'Parameters');
  CellPutS('Process running', cCubRespMsg, sProcessRunBy, sThisProcName, 'Status');
EndIf;
 
### End - Log Process Response Message
######################
 
##############################################################################################################
#Region - Create DataSource
sDim01 = 'Sys RushTI Instance';               sElement01 = cInstanceSrc; sMdxCustomize01 = '';
sDim02 = 'Sys RushTI Instance Index';         sElement02 = '';           sMdxCustomize02 = '';
sDim03 = 'M Sys RushTI Instance Information'; sElement03 = cMeasureSrc;  sMdxCustomize03 = '';
If ( ViewExists( cCubSrc, cViewSrc ) > 0 );
    ViewDestroy( cCubSrc, cViewSrc );
Endif;
ViewCreate( cCubSrc, cViewSrc, 1 );
 
sSub   = cSubSrc;
nDims  = 3;
nCount = 1;
While ( nCount <= nDims );
    sDim          = Expand( '%sDim' | NumberToStringEx( nCount, '00', '', '' ) | '%' );
    sElement      = Expand( '%sElement' | NumberToStringEx( nCount, '00', '', '' ) | '%' );
    sMdxCustomize = Expand( '%sMdxCustomize' | NumberToStringEx( nCount, '00', '', '' ) | '%' );
    If ( SubsetExists( sDim, sSub ) > 0 );
        SubsetDestroy( sDim, sSub );
    Endif;
    If ( sMdxCustomize @<> '' );
        sMdx = sMdxCustomize;
    Elseif ( sElement @<> '' );
        sMdx = '{TM1FilterByLevel( {Descendants( {[' | sDim | '].[' | sElement | ']} )}, 0)}';
    Else;
        sMdx = '{TM1FilterByLevel( {TM1SubsetAll( [' | sDim | '] )}, 0)}';
    Endif;
    If ( nDebug = 1 );
        TextOutput( cDebugFile | '_SrcViewMDX Prolog.log', sDim, sElement, sMdx );
    EndIf;
 
    SubsetCreatebyMdx( sSub, sMdx, sDim, 1 );
    nElements = SubsetGetSize( sDim, sSub );
    If ( nElements > 0 );
        #Convert to Static Subset
        sLast = SubsetGetElementName( sDim, sSub, nElements );
        SubsetElementDelete( sDim, sSub, nElements );
        SubsetElementInsert( sDim, sSub, sLast, nElements );
        ViewSubsetAssign( cCubSrc, cViewSrc, sDim, sSub );
    Else;
        SubsetDestroy( sDim, sSub );
        sError = 'Dim:' | sDim | ' has no content in source subset, mdx = "' | sMdx | '"';
        AsciiOutput(sDebugFile, sError);
        If (sErr @<> '');
            sErr = sErr | Char(10) | Char(13);
        Endif;
        sErr = sErr | sError;
        nError = 1;
    Endif;
    nCount = nCount + 1;
End;
 
ViewExtractSkipCalcsSet     (cCubSrc, cViewSrc, 1);
ViewExtractSkipRuleValuesSet(cCubSrc, cViewSrc, 1);
ViewExtractSkipZeroesSet    (cCubSrc, cViewSrc, 1);
 
######################
### Assign data source
DatasourceType          = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;
 
#EndRegion - Create DataSource
##############################################################################################################

573,31
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' );nMetaDataRecordCount = nMetaDataRecordCount + 1;EndIF;
sDebugFile = cDebugFile | '_MetaData.log';
 
######################
#### Data script
 
##############################################################################################################
#Region - Definition
## String
sInstanceName = CellGetS( cCubSrc, vInstance, vIndex, 'Instance Name');

#EndRegion - Definition
##############################################################################################################

##############################################################################################################
# Region - Write Meta Data
If( DimIx( 'Sys RushTI Instance', sInstanceName) = 0);
  DimensionElementInsert( 'Sys RushTI Instance', '', sInstanceName, 'N');
EndIf;

# EndRegion - Write Meta Data
##############################################################################################################
 
######################
### END Meta Data

574,59
#****Begin: Generated Statements***
#****End: Generated Statements****
##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' );nDataRecordCount = nDataRecordCount + 1;EndIF;
sDebugFile = cDebugFile | '_Data.log';
 
######################
#### Data script

##############################################################################################################
#Region - Definition
## String
sInstanceName = CellGetS( cCubSrc, vInstance, vIndex, 'Instance Name');
sEle01 = 'Admin Host';
sEle02 = 'HTTP Port';
sEle03 = 'CAM Namespace';
sEle04 = 'User';
sEle05 = 'Password';
sEle06 = 'SSL';
sEle07 = 'Base64 Decode';
sEle08 = 'tenant_id';
sEle09 = 'client_id';
sEle10 = 'client_secret';
sEle11 = 'path_custom';

#EndRegion - Definition
##############################################################################################################
 
##############################################################################################################
# Region - Write Config File\
## Print Instance Name
TextOutput( cCfgFilePath, '[' | sInstanceName | ']');

## Print Instance Info.
iMaxCount = 7;
iCount    = 1;
While( iCount <= iMaxCount);
  sEle = Expand ( '%' | Expand ( 'sEle'|NumberToStringEx( iCount, '00', '', ''))| '%');
  sColumn = AttrS( 'M Sys RushTI Instance Information', sEle, 'Column Name');
  sColumn = If( sColumn @= '', sEle, sColumn); 
  sValue   = CellGetS( cCubSrc, vInstance, vIndex, sEle);
  TextOutput( cCfgFilePath, '' | sColumn | '=' | sValue);
  iCount = iCount + 1;
End;

# EndRegion - Write Config File
##############################################################################################################
 
##############################################################################################################
# Region - Write Log
sUpdateTime = TimSt( Now(), '\Y-\m-\d, \h:\i:\s');
CellPutS( sUpdateTime, cCubTgt, vInstance, vIndex, 'Last Config File Update Time');

# EndRegion - Write Log
##############################################################################################################
  
######################
### END Data
575,34
#****Begin: Generated Statements***
#****End: Generated Statements****
  
##############################################################################################################
#Region - Finalize Logging
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime=Now();sProcessErrorLogFile=GetProcessErrorFileName;sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessFinishTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessFinishTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessCompletedFlag');
  CellPutN(nMetaDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataRecordCount');CellPutN(nDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataRecordCount');
  CellPutN(PrologMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nPrologMinorErrorCount');CellPutN(MetadataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataMinorErrorCount');
  CellPutN(DataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataMinorErrorCount');CellPutN(ProcessReturnCode,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessReturnCode');
  CellPutS(sProcessErrorLogFile,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sProcessErrorLogFile');nCountTime=nCountTime+1;End;
  If(nDataRecordCount>0);If(cCubTgt@<>'');CellPutN(nProcessFinishTime,sCubLogCube,cCubTgt,'nLastTimeUpdate');CellPutS(sThisProcName,sCubLogCube,cCubTgt,'sProcess');CellPutS(sProcessRunBy,sCubLogCube,cCubTgt,'sProcessRunBy');EndIf;EndIf;
EndIF;
 
######################
### Log Process Response Message
# DELETE if NOT REQUIRED
 
If( DimIx('}APQ Clients', sProcessRunBy)>0 & DimIx('}APQ Processes', sThisProcName)>0);
  CellPutS(TimSt(nProcessFinishTime, cDTformat), cCubRespMsg, sProcessRunBy, sThisProcName, 'Finish Time');
  CellPutS('Process finished', cCubRespMsg, sProcessRunBy, sThisProcName, 'Status');
  CellPutS('Success message', cCubRespMsg, sProcessRunBy, sThisProcName, 'Success Message');
  CellPutS('Failure message', cCubRespMsg, sProcessRunBy, sThisProcName, 'Failure Message');
  CellPutS(sProcessErrorLogFile, cCubRespMsg, sProcessRunBy, sThisProcName, 'TM1ProcessError File');
EndIf;
 
### End - Log Process Response Message
######################
 
#EndRegion - Finalize Logging
##############################################################################################################
### END Epilog
576,
930,0
638,1
804,0
1217,0
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
