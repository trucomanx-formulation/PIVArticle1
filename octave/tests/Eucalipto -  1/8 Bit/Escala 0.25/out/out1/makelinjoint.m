%
p0=load('Point0-lin.dat');
p1=load('Point1-lin.dat');
p2=load('Point2-lin.dat');

p0(end)
p1(end)
p2(end)

N=length(p0);
t=[0:N-1];

hp1=plot(t,p0,'--.',t,p1,'-',t,p2,'--.');
grid
%grid minor
hl1=legend('Analysis region 0','Analysis region 1','Analysis region 2','location','northwest');
hx1=xlabel('Picture');
hy1=ylabel('Distance (mm)');
xlim([0 N-1]);

hf1=gcf();
ha1=gca();



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FONTSIZE=18;
COLORGRAY=[0.9,0.9,0.9];
MARKSIZE=14;
set (hx1, "fontsize", FONTSIZE);
set (hy1, "fontsize", FONTSIZE);

set(ha1 ,'FontSize',FONTSIZE);
set(hp1 ,'MarkerSize', MARKSIZE);
set(hl1, 'color', COLORGRAY);

refresh(hf1);

print(hf1 ,'numresult1-test-a.eps' ,'-deps','-portrait',['-F:',int2str(FONTSIZE)]);

