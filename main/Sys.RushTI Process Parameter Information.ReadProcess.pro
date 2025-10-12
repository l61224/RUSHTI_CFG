601,100
602,"Sys.RushTI Process Parameter Information.ReadProcess"
562,"CHARACTERDELIMITED"
586,".\_New_Process_Template.pro"
585,".\_New_Process_Template.pro"
564,
565,"tPlz_<kPdSiTsW]r;TJ?a0ufJU[EOqCuilLKJPK5SqcUcqD\[:YxRO]V7hun`g04s1D=]p4tn5e5Iaa`?nUx4PRj1A<Q\\>?it?p>6FXK0ceD;uWBdX_CI<X?B?rLmjWR>Wkn<`7d@OPxLnZ98[\XawgvQ2FKIoREXIbe?f5<3SaNEmK>TZS9`lB3:9I>S9R=tceFwTK"
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
560,3
pInstance
pProcessPath
pProcess
561,3
2
2
2
590,3
pInstance,""
pProcessPath,""
pProcess,""
637,3
pInstance,"REQUIRED"
pProcessPath,"Full path of .pro file (data directory)"
pProcess,"Process name"
577,3
vLine
vInfo
V3
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,54
#Region - Header
##################################################################################################################
# PURPOSE:
#    Update Cube: 'Sys RushTI Process Parameter Information'
#
# DATA SOURCE:
#     pProcessPath as data source
#
# REMARK:
#   
# CHANGE HISTORY:
#   DATE          CHANGED BY          COMMENT
#   2025-09-14    Jacky Lai           Create Process
##############################################################################################################
#EndRegion - Header
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
#Region - Declare Constants
cCubTgt         = 'Sys RushTI Process Parameter Information';
cDim            = '}Processes';
cDimRushTIProc  = 'Sys RushTI Process';
sThisProcName = GetProcessName();

nCountParameters= 99999;
nCountTypes     = 99999;
nCountPrompts   = 99999;
nTotalLines     = 0;
nLineCount      = 0;

#EndRegion - Declare Constants
##############################################################################################################

##############################################################################################################
#Region - Validation
If( FileExists( pProcessPath ) = 0 );
  DataSourceType = 'NULL';
  ItemReject( 'File does not exist: ' | pProcessPath );
EndIf;

#EndRegion - Validation
##############################################################################################################
 
##############################################################################################################
#Region - Assign data source
DataSourceType              = 'CHARACTERDELIMITED';
DatasourceNameForServer     = pProcessPath;
DatasourceASCIIQuoteCharacter = '"';
DatasourceASCIIDelimiter    = ',';

#EndRegion - Assign data source
##############################################################################################################

573,2
#****Begin: Generated Statements***
#****End: Generated Statements****
574,67
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
#Region - Definition
nLineCount = nLineCount + 1;

#EndRegion - Definition
##############################################################################################################

#############################################################################################################
# Region - Write Data
#~~~~~~~~~~~~~~~~~~~~~~~~
# Populate Type
#~~~~~~~~~~~~~~~~~~~~~~~~
If( nCountTypes <= nTotalLines );
  If( vLine @= '1' );
    sType = 'N';
  Else;
    sType = 'S';
  EndIf;
  CellPutS( sType, cCubTgt, pInstance, pProcess, 'P' | TRIM( STR( nCountTypes, 100, 0 ) ), 'Type' );
  nCountTypes = nCountTypes + 1;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Populate Prompts
#~~~~~~~~~~~~~~~~~~~~~~~~
If( nCountPrompts <= nTotalLines );
  CellPutS( vInfo, cCubTgt, pInstance, pProcess, 'P' | TRIM( STR( nCountPrompts, 100, 0 ) ), 'Prompt' );
  nCountPrompts = nCountPrompts + 1;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Populate Variables
#~~~~~~~~~~~~~~~~~~~~~~~~
If( nCountParameters <= nTotalLines );
  sParam = 'P' | TRIM( STR( nCountParameters,100,0 ) );
  CellPutS( vLine, cCubTgt, pInstance, pProcess, sParam, 'Parameter' );
  CellPutS( vInfo, cCubTgt, pInstance, pProcess, sParam, 'sDefaultValue' );
  nCountParameters = nCountParameters + 1;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Determine when Variables Start
#~~~~~~~~~~~~~~~~~~~~~~~~
If( SUBST( vLine,1,3 ) @= '590' );
  nTotalLines = NUMBR( vInfo );
  nCountParameters = 1;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Determine when Types Start
#~~~~~~~~~~~~~~~~~~~~~~~~
ElseIf( SUBST( vLine, 1, 3 ) @= '561' );
  nTotalLines = NUMBR( vInfo );
  nCountTypes = 1;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Determine when Prompts Start
#~~~~~~~~~~~~~~~~~~~~~~~~
ElseIf( SUBST( vLine, 1, 3 ) @= '637' );
  nTotalLines = NUMBR( vInfo );
  nCountPrompts = 1;
EndIf;

# EndRegion - Write Data
#############################################################################################################
575,2
#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,1
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
