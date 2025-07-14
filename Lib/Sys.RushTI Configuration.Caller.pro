601,100
602,"Sys.RushTI Configuration.Caller"
562,"NULL"
586,
585,
564,
565,"wlJ87sLxY8>b5R`j5c<EbwCa7j=Vk8szzu\o9sI`1nGuwHTyj2UbMjw_]xgmre_6pg>9Q1>:=vyP:sBQJC>2Lq`4bGD_`zVD4Im7U?QONPsDiDP8Rske>C`:IEx>vRQJ\z`htv6r?@@6P>D_kCmQ?OqUJ:0Zgwf_Nxkt_37V?7cPP0OJc;E[Enftod^nI3rWh;OXJ8:H"
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
570,
571,
569,0
592,0
599,1000
560,6
pDoProcessLogging
pDebug
pRushTIID
pParaReplace
pWaitExeCmd
pSleepTime
561,6
2
2
2
2
2
2
590,6
pDoProcessLogging,"1"
pDebug,"0"
pRushTIID,""
pParaReplace,""
pWaitExeCmd,""
pSleepTime,""
637,6
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pRushTIID,"Required"
pParaReplace,"Optional (split by comma, eg. <<pSrcRegionPF>> : WJ-ITA, <<pTgtJOBID>> : T001_20230506_001)"
pWaitExeCmd,"Optional (If blank = 0 = DO NOT WAIT)"
pSleepTime,"Optional (If blank = DO NOT SLEEP/ 1 = 1 second/ 2 = 2 seconds)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,326
#Region - Header
##############################################################################################################
### CWA Std. Model  version 3.04
###
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    Run Processes by 'Sys RushTI Configuration'
# 
# DATA SOURCE:
#
# REMARK:
#     1. Please DO NOT use "=" or " (Double quotes) in your parameter value
#     2. HIGHLY recommended that set 'pWaitExeCmd' = 0 when USER trigger (to avoid deadlock) 
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2023-08-22  Jacky Lai           Creation Process
#   2024-01-31  Jacky Lai           Add 'OPT' mode
#   2024-04-15  Jacky Lai           Change to use 'Parameter Type' @<> '' to generate Parameter (as-is used 'Parameter Value' @<> '')
#   2024-04-26  Jacky Lai           Add 'pSleepTime' to let the user wait a few seconds before RushTI call the task file
#   2025-05-07  Jacky Lai           Lower sInstance & cTaskFile for Linux
#   2025-07-09  Jacky Lai           Add if sInstanceName @= 'Default Instance' then get instance name from cube: 'Sys RushTI Parameter'
#   2025-07-10  Jacky Lai           Add 'Latest Execution ParamValue' (Works when pDebug @>= '1')
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

### Prolog script commences

##############################################################################################################
#Region - Declare Constants
# Standard naming convention for source and target cubes/dimensions
cCubSrc         = 'Sys RushTI Configuration';
cCubParam       = 'Sys Parameter';
cCubRushParam   = 'Sys RushTI Parameter';
cDimRushTIID    = 'Sys RushTI ID';
cDimProcIndex   = 'Sys RushTI Process Index';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrc        = sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClr        = sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cDebugLoc       = CellGetS( cCubParam, 'TM1 Logging Directory', 'Text' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
sDelimDim       = Char(176);
sDelimEleStart  = Char(177);
sDelimEle       = Char(178);
cBedrockTmp     = 1;
nErr            = 0;
sErr            = '';

# Para.
cRushTIID       = pRushTIID;
cParaReplace    = pParaReplace;
cWaitExeCmd     = pWaitExeCmd;
cSleepTime      = pSleepTime;

# String
## RushTI basic config
cRushTIPath     = CellGetS( cCubRushParam, 'RushTI.py Path', 'Text');
cTaskFile       = Lower( CellGetS( cCubRushParam, 'RushTI Task Export Folder', 'Text') | '/' | cRushTIID | '_' | sThisProcName | '_' | sTimeStamp |'.txt');
DatasourceASCIIQuoteCharacter='';

## RushTI config by cRushTIID
cExeMode        = CellGetS( cCubSrc, cRushTIID, '000', 'P0', 'Mode'             );
cMaxThreads     = CellGetS( cCubSrc, cRushTIID, '000', 'P0', 'Max Threads'      );
cRetryTimes     = CellGetS( cCubSrc, cRushTIID, '000', 'P0', 'Retry Times'      );
cResultFile     = CellGetS( cCubSrc, cRushTIID, '000', 'P0', 'Result File Name' );

## Replace Para.
cStartReplaceMark = '<<';
cEndReplaceMark   = '>>';
cDelimParaRelLst  = ',';
cKeepMark         = '#';
cParaReplace      = cParaReplace | If( SubSt( cParaReplace, Long( cParaReplace), 1) @<> cDelimParaRelLst, cDelimParaRelLst, '');

## replace blank in pParaReplace
sBlank = ' ';
While( Scan( sBlank, cParaReplace) > 0);
  sPara = Subst( cParaReplace, 1, Scan( sBlank, cParaReplace)-1);
  cParaReplace = sPara | SubSt( cParaReplace, Scan(sBlank, cParaReplace) + Long(sBlank), Long(cParaReplace) - Long(sBlank));
End;

# Numeric
nTTLProcCount   = CellGetN( cCubSrc, cRushTIID, 'All RushTI Process Indexes', 'P0', 'Process Flag'); 

## replace blank in cResultFile
sBlank   = ' ';
sBlankTo = '_';
While( Scan( sBlank, cResultFile) > 0);
  sPara = Subst( cResultFile, 1, Scan( sBlank, cResultFile)-1);
  cResultFile = sPara | sBlankTo | SubSt( cResultFile, Scan(sBlank, cResultFile) + Long(sBlank), Long(cResultFile) - Long(sBlank));
End;

##############################################################################################################
# Region - Default Para.
## Wait for ExecuteCommand
#=========================================================
If( cWaitExeCmd @= '');
  cWaitExeCmd = '0';
EndIf;
## Execute Mode
#=========================================================
If( cExeMode @= '');
  cExeMode = 'NORM';
EndIf;
## Max RushTI Threads
#=========================================================
If( cMaxThreads @= '');
  cMaxThreads = CellGetS( cCubRushParam, 'Default Maximum RushTI Threads', 'Text');
EndIf;
## Retry Times
#=========================================================
If( cRetryTimes @= '');
  cRetryTimes = '1';
EndIf;

# EndRegion - Default Para.
##############################################################################################################

#EndRegion - Declare Constants
##############################################################################################################

######################
#Region - Debug
IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

#EndRegion - Debug
######################

#############################################################################################################
#Region - Test parameters
# cRushTIID CANNOT be BLANK or NOT EXIST in 'Sys RushTI ID'
IF( cRushTIID @= '' % DimIx( cDimRushTIID, cRushTIID) = 0);
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | cRushTIID | ' in Invalid. Please check.'; 
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process
IF( nErr > 0 );
   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, sErr );
   EndIF;
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;

#EndRegion - Test parameters
##############################################################################################################

#################################################################################################################
#Region - Loop by Line Items
nProcCount = 1;
While( nProcCount <= nTTLProcCount);
  sLineItem       = NumbertoStringEx( nProcCount, '000', '', '');
  sProcName       = CellGetS( cCubSrc, cRushTIID, sLineItem, 'P0', 'ProcessName');
  sInstName       = CellGetS( cCubSrc, cRushTIID, sLineItem, 'P0', 'InstanceName');
  sPreDecessors   = CellGetS( cCubSrc, cRushTIID, sLineItem, 'P0', 'Predecessors');
  sReqSuccess     = CellGetS( cCubSrc, cRushTIID, sLineItem, 'P0', 'Require Predecessor Success');
  If( sInstName @= '' % sInstName @= 'Default Instnace'); sInstName = CellGetS( cCubRushParam, 'Default InstanceName', 'Text'); EndIf;
  nTTLParamCount  = CellGetN( cCubSrc, cRushTIID, sLineItem, 'All RushTI Process Parameters', 'Parameter Flag');
  
  If( sProcName @= 'WAIT');
    # Skip WAIT if it's last line
    If( nProcCount = nTTLProcCount); Break; EndIf;
    TextOutput(cTaskFile, 'WAIT');
  Else;
    
    nParamCount = 1;
    While( nParamCount <= nTTLParamCount);
      sParamItem    = 'P' | If( nParamCount < 10, NumbertoStringEx( nParamCount, '0', '', ''), NumbertoStringEx( nParamCount, '00', '', ''));
      sParamName    = CellGetS( cCubSrc, cRushTIID, sLineItem, sParamItem, 'ParamName');
      sParamType    = CellGetS( cCubSrc, cRushTIID, sLineItem, sParamItem, 'ParamType');
      sParamValue   = CellGetS( cCubSrc, cRushTIID, sLineItem, sParamItem, 'ParamValue');
      
      #################################################################################################################
      # Region - Replace <<pPara>> for sParamValue
      ## sParamValue
      iParamLoopingCount = 1;
      While( Scan( cStartReplaceMark, sParamValue) > 0 & Scan( cEndReplaceMark, sParamValue) > 0 );
        nParStartPosition = Scan( cStartReplaceMark, sParamValue);
        nParEndPosition   = Scan( cEndReplaceMark, sParamValue) + Long( cEndReplaceMark);
        nTTLMdxLegnth     = Long(sParamValue);
        sTgtPara          = Subst( sParamValue, nParStartPosition,  nParEndPosition - nParStartPosition);
        nTTLParaLenth     = Long( sTgtPara);
        ## If <<pPara>> in pParaReplace, replace it
        If( Scan( sTgtPara, cParaReplace) > 0);
          sTempParaReplaceLst = Subst( cParaReplace, Scan( sTgtPara, cParaReplace) + Long( sTgtPara) + 1, Long( cParaReplace));
          sParaResult     = SubSt( sTempParaReplaceLst, 1, Scan( cDelimParaRelLst, sTempParaReplaceLst) - 1);
          sParamValue     = SubSt( sParamValue, 1, nParStartPosition - 1) | sParaResult |  SubSt( sParamValue, nParEndPosition, nTTLMdxLegnth - nParEndPosition + 1);
        EndIf;
        
        ### Count 100 times to avoid endless looping
        iParamLoopingCount = iParamLoopingCount + 1;
        If( iParamLoopingCount >= 100); Break; EndIf;
      End;
      
      # EndRegion - Replace <<pPara>> for sParamValue
      #################################################################################################################
      
      If( nParamCount = 1);
        
        #################################################################################################################
        # Region - Generate task file by OPT / NORM Mode
        #################################################################################################################
        ### OPT Mode 
        #=========================================================
        If( cExeMode @= 'OPT');
          ## ID
          sID = If(     sLineItem @<> '', AttrS( cDimProcIndex,     sLineItem, 'Label'), '');
          ## Predecessors
          If( Scan( ',', sPreDecessors) > 0);
            sPreDecessorsLst = '';
            sOriPreDecessors = sPreDecessors | ',';
            While( Scan( ',', sOriPreDecessors) > 0);
              sPreDecessors     = AttrS( cDimProcIndex, SubSt( sOriPreDecessors, 1, Scan( ',', sOriPreDecessors) - 1), 'Label');
              sPreDecessorsLst  = sPreDecessorsLst | If( sPreDecessorsLst @= '', '', ',') | sPreDecessors;
              sOriPreDecessors  = SubSt( sOriPreDecessors, Scan( ',', sOriPreDecessors) + 1, Long( sOriPreDecessors) - Scan( ',', sOriPreDecessors));
            End;
          Else;
            sPreDecessorsLst = If( sPreDecessors @<> '', AttrS( cDimProcIndex, sPreDecessors, 'Label'), '');
          EndIf;
          ## Require_Predecessor_Success
          If( Scan( ',', sReqSuccess) > 0);
            sReqSuccessLst = '';
            sOriReqSuccess = sReqSuccess | ',';
            While( Scan( ',', sOriReqSuccess) > 0);
              sReqSuccess     = AttrS( cDimProcIndex, SubSt( sOriReqSuccess, 1, Scan( ',', sOriReqSuccess) - 1), 'Label');
              sReqSuccessLst  = sReqSuccessLst | If( sReqSuccessLst @= '', '', ',') | sReqSuccess;
              sOriReqSuccess  = SubSt( sOriReqSuccess, Scan( ',', sOriReqSuccess) + 1, Long( sOriReqSuccess) - Scan( ',', sOriReqSuccess));
            End;
            
          Else;
            sReqSuccessLst   = If(   sReqSuccess @<> '', AttrS( cDimProcIndex,   sReqSuccess, 'Label'), '');
          EndIf;
          
          sTask = 'id="'                          | sID               | '" ' |
                  'predecessors="'                | sPreDecessorsLst  | '" ' |
                  'require_predecessor_success="' | sReqSuccessLst    | '" ' |
                  'instance="'                    | sInstName         | '" ' |  
                  'process="'                     | sProcName         | '" ' ;
        
        ### NORM Mode 
        #=========================================================
        Else;
          sTask = 'instance="'                    | sInstName         | '" '  |  
                  'process="'                     | sProcName         | '" '  ;
        EndIf;
        #################################################################################################################
        # EndRegion - Generate task file by OPT / NORM Mode
        #################################################################################################################
        
      EndIf;
      
      If( sParamType @<> '');
        If( sParamType @= '' % sParamType @= 'Value');
          sTask = sTask | sParamName | '="' | sParamValue | '" ';
        ElseIf( sParamType @= 'MDX');
          sTask = sTask | sParamName | '*=*"' | sParamValue | '" ';
        EndIf;
        
        ## Record Latest ParamValue
        If( pDebug @>= '1');
          sExeTime = TimSt( Now(), '\Y-\m-\d, \h:\i:\s');
          CellPutS( sParamValue | '  ( @' | sExeTime | ')', cCubSrc, cRushTIID, sLineItem, sParamItem, 'Latest Execution ParamValue');
        EndIf;
      EndIf;
      nParamCount = nParamCount + 1;
    End;
    TextOutput(cTaskFile, sTask);
  EndIf;
  nProcCount = nProcCount + 1;
End;
#EndRegion - Loop by Line Items
#################################################################################################################



#EndRegion - Create RushTi task List by PL Item Priority
##################################################################################################################

######################
### END Prolog

573,17
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK TURBOINTEGRATOR TEMPLATE
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Logging - common script
IF( pDoProcessLogging @= '1' );nMetadataRecordCount = nMetadataRecordCount + 1;EndIF;
sDebugFile = cDebugFile | '_Metadata.log';

######################
### Metadata script

######################
### END Metadata
574,17
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK TURBOINTEGRATOR TEMPLATE
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Logging - common script
IF( pDoProcessLogging @= '1' );nDataRecordCount = nDataRecordCount + 1;EndIF;
sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

######################
### END Data
575,70
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK TURBOINTEGRATOR TEMPLATE
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Epilog script
sDebugFile = cDebugFile | '_Epilog.log';

#################################################################################################################
# Region - Replace <<pPara>> for cResultFile
## cResultFile
If( Scan( cStartReplaceMark, cResultFile) > 0 & Scan( cEndReplaceMark, cResultFile) > 0);
  nParStartPosition = Scan( cStartReplaceMark, cResultFile);
  nParEndPosition   = Scan( cEndReplaceMark, cResultFile) + Long( cEndReplaceMark);
  nTTLMdxLegnth = Long(cResultFile);
  sTgtPara = Subst( cResultFile, nParStartPosition,  nParEndPosition - nParStartPosition);
  nTTLParaLenth  = Long( sTgtPara);
  ## If <<pPara>> in pParaReplace, replace it
  If( Scan( sTgtPara, cParaReplace) > 0);
    sTempParaReplaceLst = Subst( cParaReplace, Scan( sTgtPara, cParaReplace) + Long( sTgtPara) + 1, Long( cParaReplace));
    sParaResult = SubSt( sTempParaReplaceLst, 1, Scan( cDelimParaRelLst, sTempParaReplaceLst) - 1);
    cResultFile = SubSt( cResultFile, 1, nParStartPosition - 1) | sParaResult |  SubSt( cResultFile, nParEndPosition, nTTLMdxLegnth - nParEndPosition + 1);
  EndIf;
EndIf;
# EndRegion - Replace <<pPara>> for cResultFile
#################################################################################################################

##################################################################################################################
#Region - Execute RushTI
nWaitExeCmd = StringToNumber( cWaitExeCmd);

sCmd  = 'python "' | cRushTIPath | '" "' | cTaskFile | '" ' | cMaxThreads | ' ' | cExeMode | ' ' | cRetryTimes | ' ' | cResultFile;
If( pDebug @>= '1');
  TextOutput(sDebugFile, 'RushTI ExecuteCommand: ' | sCmd);
EndIf;
If( nErr = 0);
  ExecuteCommand( sCmd, nWaitExeCmd);
EndIf;
#EndRegion - Execute RushTI
##################################################################################################################

##################################################################################################################
#Region - Sleep
If( cSleepTime @<> '');
  nSleepTime = Numbr( cSleepTime) * 1000;
  Sleep( nSleepTime);
EndIf;

#EndRegion -Sleepxecute RushTI
##################################################################################################################

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
920,0
921,""
922,""
923,0
924,""
925,""
926,""
927,""
