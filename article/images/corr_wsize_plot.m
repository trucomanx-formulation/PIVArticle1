%%%%%%%%%%%%%%%%%%%
clear all
close all
FONTSIZE=20;
L=24;
MARKERSIZE=12;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear XA CA XB CB XC CC
load('corr_wize16.dat');

figure;
plot(XA,CA,'--.','markersize',MARKERSIZE,XB,CB,'--','markersize',MARKERSIZE,XC,CC,'--.','markersize',MARKERSIZE);
xlabel('d');
xlim([0 63])
ylim([-0.2 1.0])
ylabel('PCC');
grid
legend('PA','PB','PC')
hf1=gcf;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear XA CA XB CB XC CC
load('corr_wize32.dat');

figure;
plot(XA,CA,'--.','markersize',MARKERSIZE,XB,CB,'--','markersize',MARKERSIZE,XC,CC,'--.','markersize',MARKERSIZE);
xlabel('d');
xlim([0 63])
ylim([-0.2 1.0])
ylabel('PCC');
grid
legend('PA','PB','PC')
hf2=gcf;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear XA CA XB CB XC CC
load('corr_wize64.dat');

figure;
plot(XA,CA,'--.','markersize',MARKERSIZE,XB,CB,'--','markersize',MARKERSIZE,XC,CC,'--.','markersize',MARKERSIZE);
xlabel('d');
xlim([0 63])
ylim([-0.2 1.0])
ylabel('PCC');
grid
legend('PA','PB','PC')
hf3=gcf;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear XA CA XB CB XC CC

load('corr_wize32.dat');

figure;
plot(XA,CA,'--.','markersize',MARKERSIZE,XB,CB,'--','markersize',MARKERSIZE,XC,CC,'--.','markersize',MARKERSIZE,[0:7],0.67*ones(1,8),'-s','markersize',MARKERSIZE);
xlabel('d');
xlim([0 7])
ylim([-0.2 1.0])
ylabel('PCC');
grid
legend('PA','PB','PC','T=0.67','location','southwest')
hf4=gcf;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print(hf1,'image_plot-16.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf2,'image_plot-32.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf3,'image_plot-64.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);

print(hf4,'image_plot-32zoom.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);
