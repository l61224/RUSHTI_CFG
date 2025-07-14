601,100
602,"z.Sys.RushTI Configuration.Initialize"
562,"NULL"
586,
585,
564,
565,"hYI0I5bBa[X23VI;9UXM<56>r4n]Z\C_3F>Za\xkHAueRG1WOEm]ENH]SR_q1DC\zyiViM=l[1Jbkh=7P_T\AJ05lw6dZ=FtQG=b^U8`Y4oT63:7B`wKZxgdhjboyN=lCzhl8sd2m@sw?W_M\FS]b@<CIf9gRgE0]\s?l0xAf_w3_EwYHr5HU^uC[E[x[HFClMnR<<Yf"
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
560,4
pRushTIPath
pTaskPath
pDefaultMaxThread
pDefaultInstance
561,4
2
2
2
2
590,4
pRushTIPath,""
pTaskPath,""
pDefaultMaxThread,""
pDefaultInstance,""
637,4
pRushTIPath,"Where RushTI.pt store, this must >= version 1.4 ( eg. D:\DBs\bms_dev\script\rushti-master\RushTI.py)"
pTaskPath,"Where you want to store rushti task file ( eg. D:\DBs\bms_dev\export\RushTI)"
pDefaultMaxThread,"Default Max thread count for RushTI configuration ( eg. 10)"
pDefaultInstance,"Default Instance name for RushTI configuration ( eg. BMS)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,34
#****Begin: Generated Statements***
#****End: Generated Statements****


# Region - 0. Zero out
#######################################################################################
cViewClr  = 'z.Sys.RushTI Configuration.Initialize';
cSubClr   = cViewClr;

# Manually add line if there are more or less dimension
cCubClr   = 'Sys RushTI Configuration';
If ( ViewExists( cCubClr, cViewClr ) > 0 );
    ViewDestroy( cCubClr, cViewClr );
Endif;
ViewCreate( cCubClr, cViewClr, 1 );
ViewZeroOut( cCubClr, cViewClr);

cCubClr   = 'Sys RushTI Parameter';
If ( ViewExists( cCubClr, cViewClr ) > 0 );
    ViewDestroy( cCubClr, cViewClr );
Endif;
ViewCreate( cCubClr, cViewClr, 1 );
ViewZeroOut( cCubClr, cViewClr);

# EndRegion - 0. Zero out
#######################################################################################

# 1. Update 'Sys RushTI Parameter'
CellPutS(        pRushTIPath, 'Sys RushTI Parameter',                 'RushTI.py Path', 'Text');
CellPutS(          pTaskPath, 'Sys RushTI Parameter',      'RushTI Task Export Folder', 'Text');
CellPutS(  pDefaultMaxThread, 'Sys RushTI Parameter', 'Default Maximum RushTI Threads', 'Text');
CellPutS(   pDefaultInstance, 'Sys RushTI Parameter',           'Default InstanceName', 'Text');


573,2
#****Begin: Generated Statements***
#****End: Generated Statements****
574,2
#****Begin: Generated Statements***
#****End: Generated Statements****
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
