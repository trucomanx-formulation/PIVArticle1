%N numero de puntos analizados
%MINANGLE de 0 a 360
function [CORR]=get_rot_auto_corr(filename,P0,WSIZE,N,MINANGLE)

	img  = imread(filename);
    figure;
	imshow(img);
    NLINES=size(img,1);
    NCOLS=size(img,2);

    hold on
    ac0=round(P0(2));	al0=round(P0(1));


    CORR=zeros(1,N);

    SEMI_W=round(WSIZE/2);
    SEMI_MW=round(sqrt(2)*WSIZE/2);

    ac0=ac0+SEMI_W;
    al0=al0+SEMI_W;

    scatter(ac0 , al0,"r");
    rectangle('Position',[ac0-SEMI_W+1 , al0-SEMI_W+1, 2*SEMI_W, 2*SEMI_W], 'LineWidth',1, 'EdgeColor','b');
    rectangle('Position',[ac0-SEMI_MW+1 , al0-SEMI_MW+1, 2*SEMI_MW, 2*SEMI_MW], 'LineWidth',1, 'EdgeColor','g');

    MINLINE=al0-SEMI_MW+1;
    OFFSETLINE=0;
    if(MINLINE<1) 
        OFFSETLINE=1-MINLINE;  
        MINLINE=1;
    end
    MAXLINE=al0+SEMI_MW;
    if(MAXLINE>NLINES)   
        MAXLINE=NLINES;
    end

    MINCOL=ac0-SEMI_MW+1;
    OFFSETCOL=0;
    if(MINCOL<1)  
        OFFSETCOL=1-MINCOL;   
        MINCOL=1;
    end
    MAXCOL=ac0+SEMI_MW;
    if(MAXCOL>NCOLS)   
        MAXCOL=NCOLS;
    end

    LINES   = MINLINE:MAXLINE;
    COLUMNS = MINCOL:MAXCOL;

    MA0=zeros(2*SEMI_MW,SEMI_MW);

    MA0(OFFSETLINE+[1:(MAXLINE-MINLINE+1)],OFFSETCOL+[1:(MAXCOL-MINCOL+1)])=img(LINES,COLUMNS);
    A0 =MA0(SEMI_MW-SEMI_W+[1:WSIZE],SEMI_MW-SEMI_W+[1:WSIZE]);

    for KK=1:N
        MA = imrotate(MA0,(KK-1)*MINANGLE,'bilinear','crop');
        A  = MA(SEMI_MW-SEMI_W+[1:WSIZE],SEMI_MW-SEMI_W+[1:WSIZE]);

        CORR(KK)=corr2(A,A0);
    end
    hold off

end
