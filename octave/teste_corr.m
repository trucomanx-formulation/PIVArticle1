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

hf1=figure;
[CORRA1 SEA1 MEANA1 STDA1] = get_spatial_auto_corr(PA1,WSIZE,192/WSIZE); %msgbox('PA1: [OK]');

hf2=figure;
[CORRB1 SEB1 MEANB1 STDB1] = get_spatial_auto_corr(PB1,WSIZE,192/WSIZE); %msgbox('PB1: [OK]');

hf3=figure;
[CORRC1 SEC1 MEANC1 STDC1] = get_spatial_auto_corr(PC1,WSIZE,192/WSIZE); %msgbox('PC1: [OK]');

MINN=min(min(length(CORRA1),length(CORRB1)), length(CORRC1));


X0=[0:WSIZE-1];

hf4=figure;
plot(X0,CORRA1(X0+1),'-o',X0,CORRB1(X0+1),'-.',X0,CORRC1(X0+1),'-')
xlabel('Distance in pixels');
xlim([min(X0) max(X0)])
ylabel('PCC');
grid
legend('PA1','PB1','PC1')

PA1_CORR_MEAN=mean(CORRA1(WSIZE:MINN));
PA1_CORR_STD=std(CORRA1(WSIZE:MINN));
PA1_CORR_MAX=PA1_CORR_MEAN+1.5*PA1_CORR_STD

PB1_CORR_MEAN=mean(CORRB1(WSIZE:MINN));
PB1_CORR_STD=std(CORRB1(WSIZE:MINN));
PB1_CORR_MAX=PB1_CORR_MEAN+1.5*PB1_CORR_STD

PC1_CORR_MEAN=mean(CORRC1(WSIZE:MINN));
PC1_CORR_STD=std(CORRC1(WSIZE:MINN));
PC1_CORR_MAX=PC1_CORR_MEAN+1.5*PC1_CORR_STD

X=[WSIZE-1:MINN-1];

hf5=figure;
plot(X,CORRA1(X+1),'-o',X,CORRB1(X+1),'-.',X,CORRC1(X+1),'-')
xlabel('Distance in pixels');
xlim([min(X) max(X)])
ylabel('PCC');
grid
legend('PA1','PB1','PC1')

hf6=figure;
plot(X,STDA1(X+1),'-o',X,STDB1(X+1),'-.',X,STDC1(X+1),'-')
xlabel('Distance in pixels (d)');
xlim([min(X) max(X)])
ylabel('std(A_d) ');
grid
legend('PA1','PB1','PC1')

save(sprintf('corr_wize%d.dat',WSIZE),'CORRA1','CORRB1','CORRC1','SEA1','SEB1','SEC1','MEANA1','MEANB1','MEANC1','STDA1','STDB1','STDC1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FONTSIZE=20;
print(hf1,['image_pa1-'   int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf2,['image_pb1-'   int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf3,['image_pc1-'   int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf4,['image_plot-'  int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf5,['image_plot2-' int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf6,['image_plot3-' int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);

rmpath(genpath(make_absolute_filename('mfiles')));
