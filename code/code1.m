path='E:\\ѧϰ����\\����ͼ����\\���Ĵ���ҵ\\��4-����ҵ\\';
img=cell(2,2);
img{1,1}='test1';
img{1,2}=imread('test1.pgm');
img{2,2}=imread('test2.tif');
img{2,1}='test2';
for num= 1:2
    disp(img{num,1}) %��ӡ�ļ�·��
    I=img{num,2};
    for scale=3:2:7
        w = fspecial('gaussian',[scale,scale],1.5);
        I1 = imfilter(I,w,'replicate');
        figure
        word_scale=num2str(scale);
        subplot(1,2,1)
        imshow(I);title('ԭͼ��');
        subplot(1,2,2)
        imshow(I1);title('matlab��˹�˲����ͼ��');
        suptitle(strcat('��˹�˲� ',word_scale,'��',word_scale))
        saveas(gcf,strcat(img{num,1},'_��˹�˲�',word_scale,'��',word_scale,'.jpg'))
        
        I1= medfilt2(I,[scale,scale]);
        figure
        subplot(1,2,1)
        imshow(I);title('ԭͼ��');
        subplot(1,2,2)
        imshow(I1);title('matlab��ֵ�˲����ͼ��');
        suptitle(strcat('��ֵ�˲� ',word_scale,'��',word_scale))
        saveas(gcf,strcat(img{num,1},'_��ֵ',word_scale,'��',word_scale,'.jpg'))
    end
end