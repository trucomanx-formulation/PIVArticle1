%
close all 

p0=load('PCC-Point0-multi_des_max.dat');
p1=load('PCC-Point1-multi_des_max.dat');
p2=load('PCC-Point2-multi_des_max.dat');


nss=8;

hp1=plot(p0(1,:),p0(2,:),'--.',p1(1,:),p1(2,:),'-',p2(1,:),p2(2,:),'--.');
xlim([0,50])

grid
grid minor
hl1=legend('Analysis region 0','Analysis region 1','Analysis region 2','location','northeast');
hx1=xlabel('Pixels');
hy1=ylabel('PCC');

hf1=gcf();
ha1=gca();



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FONTSIZE=18;
COLORGRAY=[0.9,0.9,0.9];
MARKSIZE=12;
set (hx1, "fontsize", FONTSIZE);
set (hy1, "fontsize", FONTSIZE);

set(ha1,'FontSize',FONTSIZE);
set(hp1,'MarkerSize', MARKSIZE);
set(hl1,'color', COLORGRAY,'interpreter','tex');

refresh(hf1);

print(hf1 ,'numresult1-maketestjoint-multi_des_max.eps' ,'-deps','-portrait',['-F:',int2str(FONTSIZE)]);

