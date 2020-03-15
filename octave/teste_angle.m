%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Preambulo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear
addpath(genpath(make_absolute_filename('mfiles')));

WSIZE=64;

PA1='./tests/test1/PA1/8 Bit/Escala 0.25/8 bit-10000.bmp';
PB1='./tests/test1/PB1/8 Bit/Escala 0.25/8 Bit-10000.bmp';
PC1='./tests/test1/PC1/8 Bit/Escala 0.25/8 Bit-10000.bmp';

N=90;
MINANGLE=0.5;

hf1=figure;
CORRA1=get_rot_auto_corr(PA1,WSIZE,N,MINANGLE); %msgbox('PA1: [OK]');

hf2=figure;
CORRB1=get_rot_auto_corr(PB1,WSIZE,N,MINANGLE); %msgbox('PB1: [OK]');

hf3=figure;
CORRC1=get_rot_auto_corr(PC1,WSIZE,N,MINANGLE); %msgbox('PC1: [OK]');


X=[0:N-1];

hf4=figure;
plot(X*MINANGLE,CORRA1(X+1),'-o',X*MINANGLE,CORRB1(X+1),'-.',X*MINANGLE,CORRC1(X+1),'-')
xlabel('Angle in degrees');
ylabel('PCC');
xlim([min(X*MINANGLE) max(X*MINANGLE)]);
grid
legend('PA1','PB1','PC1')


save(sprintf('corr_rot_wize%d.dat',WSIZE),'CORRA1','CORRB1','CORRC1','MINANGLE');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FONTSIZE=20;
print(hf1,['image_rot_pa1-'   int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf2,['image_rot_pb1-'   int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf3,['image_rot_pc1-'   int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf4,['image_rot_plot-'  int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);


rmpath(genpath(make_absolute_filename('mfiles')));
