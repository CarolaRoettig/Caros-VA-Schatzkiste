cas session1;
caslib _ALL_ assign;
proc casutil;
   droptable casdata="landkreise" incaslib="public" ;
run;
quit;
cas session1 terminate;

%SHPCNTNT(SHAPEFILEPATH=/home/gercar/landkreise-in-germany.shp)

%shpimprt(shapefilepath=/home/gercar/landkreise-in-germany.shp, id=cca_2 , 
outtable=landkreise, cashost=gr10pocps01.vsp.sas.com, 
   casport=5570, caslib='public' , reduce=1);

cas;
caslib _all_ assign;

proc casutil;
load data=landkreise casout="landkreise" outcaslib="public" promote;
quit;

