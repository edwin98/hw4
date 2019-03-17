path='E:\\学习资料\\数字图像处理\\第四次作业\\第4-次作业\\';
img=cell(2,2);
img{1,1}='test1';
img{1,2}=imread('test1.pgm');
img{2,2}=imread('test2.tif');
img{2,1}='test2';
for num= 1:2
    disp(img{num,1}) %打印文件路径
    I=img{num,2};
    for scale=3:2:7
        w = fspecial('gaussian',[scale,scale],1.5);
        I1 = imfilter(I,w,'replicate');
        figure
        word_scale=num2str(scale);
        subplot(1,2,1)
        imshow(I);title('原图像');
        subplot(1,2,2)
        imshow(I1);title('matlab高斯滤波后的图像');
        suptitle(strcat('高斯滤波 ',word_scale,'×',word_scale))
        saveas(gcf,strcat(img{num,1},'_高斯滤波',word_scale,'×',word_scale,'.jpg'))
        
        I1= medfilt2(I,[scale,scale]);
        figure
        subplot(1,2,1)
        imshow(I);title('原图像');
        subplot(1,2,2)
        imshow(I1);title('matlab中值滤波后的图像');
        suptitle(strcat('中值滤波 ',word_scale,'×',word_scale))
        saveas(gcf,strcat(img{num,1},'_中值',word_scale,'×',word_scale,'.jpg'))
    end
end