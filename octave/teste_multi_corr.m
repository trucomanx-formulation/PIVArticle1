%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Preambulo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear
addpath(genpath(make_absolute_filename('mfiles')));

WSIZE=16

PA1='./tests/PA1/8 Bit/Escala 0.25/8 bit-10000.bmp';
PB1='./tests/PB1/8 Bit/Escala 0.25/8 Bit-10000.bmp';
PC1='./tests/PC1/8 Bit/Escala 0.25/8 Bit-10000.bmp';


img  = imread(PA1);
imshow(img);
[ac0,al0]=ginput(1);
P0=[round(al0-WSIZE/2) round(ac0-WSIZE/2)];
close all
[CORRA1 CA XA] = get_multi_spatial_auto_corr(PA1,P0,WSIZE,64);
disp('CORRA OK');

img  = imread(PB1);
imshow(img);
[ac0,al0]=ginput(1);
P0=[round(al0-WSIZE/2) round(ac0-WSIZE/2)];
close all
[CORRB1 CB XB] = get_multi_spatial_auto_corr(PB1,P0,WSIZE,64);
disp('CORRB OK');


img  = imread(PC1);
imshow(img);
[ac0,al0]=ginput(1);
P0=[round(al0-WSIZE/2) round(ac0-WSIZE/2)];
close all
[CORRC1 CC XC] = get_multi_spatial_auto_corr(PC1,P0,WSIZE,64);
disp('CORRB OK');



hf1=figure;
L=(size(CORRA1,2)+1)/2;
[XX,YY]=meshgrid([-(L-1):(L-1)]);
surf(XX,YY,CORRA1);
xlim([-(L-1) (L-1)]);
ylim([-(L-1) (L-1)]);
xlabel('Distance in pixels');
ylabel('Distance in pixels');
zlim([-0.2 1.0])
zlabel('PCC');

hf2=figure;
L=(size(CORRB1,2)+1)/2;
[XX,YY]=meshgrid([-(L-1):(L-1)]);
surf(XX,YY,CORRB1);
xlim([-(L-1) (L-1)]);
ylim([-(L-1) (L-1)]);
xlabel('Distance in pixels');
ylabel('Distance in pixels');
zlim([-0.2 1.0])
zlabel('PCC');


hf3=figure;
L=(size(CORRC1,2)+1)/2;
[XX,YY]=meshgrid([-(L-1):(L-1)]);
surf(XX,YY,CORRC1);
xlim([-(L-1) (L-1)]);
ylim([-(L-1) (L-1)]);
xlabel('Distance in pixels');
ylabel('Distance in pixels');
zlim([-0.2 1.0])
zlabel('PCC');

hf4=figure;
plot(XA,CA,'-o',XB,CB,'-.',XC,CC,'-')
xlabel('Distance in pixels');
xlim([0 64])
ylim([0 1])
ylabel('PCC');
grid
legend('PA','PB','PC')



save(sprintf('corr_wize%d.dat',WSIZE),'CORRA1','CORRB1','CORRC1','CA','CB','CC','XA','XB','XC');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FONTSIZE=20;
print(hf1,['image_plotA-' int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf2,['image_plotB-' int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf3,['image_plotC-' int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);
print(hf4,['image_plot-'  int2str(WSIZE) '.eps'],'-deps','-tight',['-F:',int2str(FONTSIZE)]);

rmpath(genpath(make_absolute_filename('mfiles')));
