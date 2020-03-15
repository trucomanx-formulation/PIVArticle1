%
p0=load('PCC-Point0-rot.dat');
p1=load('PCC-Point1-rot.dat');
p2=load('PCC-Point2-rot.dat');

N=length(p0);
t=[0:N-1]*0.5;

hp1=plot(t,p0(1:N),'--.',t,p1(1:N),'-',t,p2(1:N),'--.',t,exp(-(t/14).^2),':','linewidth',2);
grid
%grid minor
hl1=legend('Analysis region 0','Analysis region 1','Analysis region 2','exp(-(angle/14)^2)','location','southwest');
hx1=xlabel('Angle (degrees)');
hy1=ylabel('PCC');
xlim([0 (N-1)*0.5]);

hf1=gcf();
ha1=gca();



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FONTSIZE=18;
COLORGRAY=[0.9,0.9,0.9];
MARKSIZE=12;
set (hx1, "fontsize", FONTSIZE);
set (hy1, "fontsize", FONTSIZE);

set(ha1 ,'FontSize',FONTSIZE);
set(hp1 ,'MarkerSize', MARKSIZE);
set(hl1, 'color', COLORGRAY);

refresh(hf1);

print(hf1 ,'numresult1-maketestjoint-rot.eps' ,'-deps','-portrait',['-F:',int2str(FONTSIZE)]);

