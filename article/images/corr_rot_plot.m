%%%%%%%%%%%%%%%%%%%
clear all
close all
FONTSIZE=20;
L=24;
MARKERSIZE=12;

%%%%%%%%%%%%%%%%%%%

clear CORRA1 CORRB1 CORRC1 MINANGLE
load('corr_rot_wize16.dat');
X0=[0:L-1];

figure;
plot(X0*MINANGLE,CORRA1(X0+1),'--.','markersize',MARKERSIZE,X0*MINANGLE,CORRB1(X0+1),'--','markersize',MARKERSIZE,X0*MINANGLE,CORRC1(X0+1),'--.','markersize',MARKERSIZE);
xlabel('Angle in degrees');
xlim([min(X0*MINANGLE) max(X0*MINANGLE)])
ylim([0 1])
ylabel('PCC');
grid
legend('PA','PB','PC')
hf1=gcf;


%%%%%%%%%%%%%%%%%%%

clear CORRA1 CORRB1 CORRC1 MINANGLE
load('corr_rot_wize32.dat');
X0=[0:L-1];

figure;
plot(X0*MINANGLE,CORRA1(X0+1),'--.','markersize',MARKERSIZE,X0*MINANGLE,CORRB1(X0+1),'--','markersize',MARKERSIZE,X0*MINANGLE,CORRC1(X0+1),'--.','markersize',MARKERSIZE);
xlabel('Angle in degrees');
xlim([min(X0*MINANGLE) max(X0*MINANGLE)])
ylim([0 1])
ylabel('PCC');
grid
legend('PA','PB','PC')
hf2=gcf;


%%%%%%%%%%%%%%%%%%%

clear CORRA1 CORRB1 CORRC1 MINANGLE
load('corr_rot_wize64.dat');
X0=[0:L-1];

figure;
plot(X0*MINANGLE,CORRA1(X0+1),'--.','markersize',MARKERSIZE,X0*MINANGLE,CORRB1(X0+1),'--','markersize',MARKERSIZE,X0*MINANGLE,CORRC1(X0+1),'--.','markersize',MARKERSIZE);
xlabel('Angle in degrees');
xlim([min(X0*MINANGLE) max(X0*MINANGLE)])
ylim([0 1])
ylabel('PCC');
grid
legend('PA','PB','PC')
hf3=gcf;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print(hf1,'image_rot_plot-16.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf2,'image_rot_plot-32.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf3,'image_rot_plot-64.eps','-deps','-tight',['-F:',int2str(FONTSIZE)]);

