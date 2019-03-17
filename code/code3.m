path='E:\\ѧϰ����\\����ͼ����\\���Ĵ���ҵ\\��4-����ҵ\\';
img=cell(2,2);
img{1,1}='test3';
img{1,2}=imread('test3_corrupt.pgm');

img{2,2}=imread('test4.tif');
img{2,2}=img{2,2}(:,:,1);
img{2,1}='test4';

for num=1:2
    I=img{num,2};
    f=double(I);
    g=fft2(f);
    g=fftshift(g);
    [N,M]=size(g);
    H = fspecial('gaussian',[M,N],0.7);
    Blurimage = imfilter(I,H,'replicate');
    Iq=imsubtract(I,Blurimage);
    I_um=I+2*Iq;
    figure
    imshow(I_um);title('unsharp masking�����ͼ��')
    saveas(gcf,strcat(img{num,1},'_unsharp masking','.jpg'))
    
    I_sobel=edge(I,'sobel');
    figure
    imshow(I_sobel);title('Sobel edge detector�����ͼ��')
    saveas(gcf,strcat(img{num,1},'_Sobel edge detector','.jpg'))
    
    [m,n]=size(I);
    I_Laplace=I;       
    t=0.2;         
    for j=2:m-1
        for k=2:n-1
            L=abs(4*I(j,k)-I(j-1,k)-I(j+1,k)-I(j,k+1)-I(j,k-1));
            if(L > t)
                I_Laplace(j,k)=255;  %��
            else
                I_Laplace(j,k)=0;    %��
            end
        end
    end
    figure;
    imshow(I_Laplace);title('Laplace edge detection�����ͼ��')
    saveas(gcf,strcat(img{num,1},'_Laplace edge detection','.jpg'));
    
    
    I_canny=edge(I,'canny');
    figure
    imshow(I_canny);title('Canny algorithm�����ͼ��')
    saveas(gcf,strcat(img{num,1},'_Canny algorithm','.jpg'))
end