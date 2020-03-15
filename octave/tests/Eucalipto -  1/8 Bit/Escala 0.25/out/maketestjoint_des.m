%
p0=load('PCC-Point0-des.dat');
p1=load('PCC-Point1-des.dat');
p2=load('PCC-Point2-des.dat');

N=50;
t=[0:N-1];

nss=8;

hp1=plot(t,p0(1:N),'-<',t,p1(1:N),'-o',t,p2(1:N),'-s',2.8284*ones(1,nss),linspace(0,1,nss),'--.');
grid
%grid minor
hl1=legend('Analysis region 0','Analysis region 1','Analysis region 2','Measure error:2.8284','location','northeast');
hx1=xlabel('Pixels');
hy1=ylabel('PCC');
xlim([0 N-1]);

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

print(hf1 ,'numresult1-maketestjoint-des.eps' ,'-deps','-portrait',['-F:',int2str(FONTSIZE)]);

