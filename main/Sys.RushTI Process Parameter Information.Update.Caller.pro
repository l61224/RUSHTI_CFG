601,100
602,"Sys.RushTI Process Parameter Information.Update.Caller"
562,"VIEW"
586,"Sys RushTI Instance Information"
585,"Sys RushTI Instance Information"
564,
565,"f\>GF<aFJOrN\4UL>whAOm9utoa<1aNIEiyl5Y=[CMko6Ldh<h3auOpPs0wSUzlu59U9IY[KrlrsGt`x>t`sZrv3[SOphgPSuT6i5Wr?[:GwPa2^FZnwXh5>g2ZAEV5c=DBBKjAE@UWaWy\uKNL@PM@5[54@xo9B@?PD?F<\;oGghox19CJ0;x<@eJY7H4P_?zy:VPhl"
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
560,0
561,0
590,0
637,0
577,4
vSysRushTIInstance
vSysRushTIInstanceIndex
vMSysRushTIInstanceInformation
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
572,109
#Region - Header
##################################################################################################################
# PURPOSE:
#    Call 'Sys.RushTI Process Parameter Information.Update'
#
# DATA SOURCE:
#     Cube: 'Sys RushTI Instance Information'/ 'Data Folder Path'
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
# Standard naming convention for source and target cubes/dimensions
cCubSrc         = 'Sys RushTI Instance Information';
cCubTgt         = 'Sys RushTI Process Parameter Information';
cDimInstance    = 'Sys RushTI Instance';
sThisProcName   = GetProcessName();
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrc        = sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClr        = sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
sErr            = ''; 
 
# String
cInstanceSrc    = 'Default Instance';
cMeasureSrc     = 'Data Folder Path';

#EndRegion - Declare Constants
##############################################################################################################
 
##############################################################################################################
#Region - Data Clear
CubeClearData(cCubTgt);

#EndRegion - Data Clear
##############################################################################################################
 
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
        
        If (sErr @<> '');
            sErr = sErr | Char(10) | Char(13);
        Endif;
        sErr = sErr | sError;
        nError = 1;
    Endif;
    nCount = nCount + 1;
End;
 
ViewExtractSkipCalcsSet     (cCubSrc, cViewSrc, 1);
ViewExtractSkipRuleValuesSet(cCubSrc, cViewSrc, 0);
ViewExtractSkipZeroesSet    (cCubSrc, cViewSrc, 1);
 
######################
### Assign data source
DatasourceType          = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;
 
#EndRegion - Create DataSource
##############################################################################################################

573,2
#****Begin: Generated Statements***
#****End: Generated Statements****
574,21
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
#Region - Definition
## String
sInstanceName = CellGetS( cCubSrc, vSysRushTIInstance, vSysRushTIInstanceIndex, 'Instance Name');
sLineItem     = vSysRushTIInstanceIndex;

#EndRegion - Definition
##############################################################################################################

#############################################################################################################
# Region - Call Sub TI
ExecuteProcess('Sys.RushTI Process Parameter Information.Update',
                'pInstance', sInstanceName,
                'pLineItem', sLineItem
               );

# EndRegion - Call Sub TI
##############################################################################################################
575,2
#****Begin: Generated Statements***
#****End: Generated Statements****
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
