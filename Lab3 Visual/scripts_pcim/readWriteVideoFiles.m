% fun??o de teste para permitir trabalhar com ficheiros video com
% formato mpeg, avi e yuv
% exemplifica como se pode importar para o matlab esse tipo de sequ?ncias v?deo
% como extrair/isolar imagens dessas sequ?ncias e como criar novas sequ?ncias 
% v?deo e grav?-las como ficheiros avi

function im=readWriteVideoFiles()

close all;

disp('start by selecting an mpeg or avi video file');
[filename, pathname] = uigetfile('*.*', 'open video');
   
fullname=fullfile(pathname,filename);
    
video=VideoReader(fullname);

nFrames=video.NumberOfFrames;
width=video.width;
height=video.height;

promptMessage = sprintf('Do you want to watch the full movie?');
	button = questdlg(promptMessage, 'Watch full video?', 'Yes', 'No', 'Yes');

if strcmp(button, 'Yes')
    axis off
    implay(fullname), title('input video sequence');
end

pause
close all

for i=1:nFrames
    
    % leitura imagem a imagem e convers?o de RGB para Grayscale
    frame=read(video, i); 
    frameGray(:,:,i)=rgb2gray(frame);
    
end

% create an avi movie with some gray frames only and save it to a disk file, 
% indicating a lower frame rate
outputVideo = VideoWriter('grayImages.avi'); % create AVI file to store images
outputVideo.FrameRate = 10; % slow frame rate because it has less images
open(outputVideo)
for i=1 : nFrames/2
    %writeVideo(outputVideo,read(video,2*i));
    writeVideo(outputVideo,frameGray(:,:,2*i));
end
close(outputVideo)

close all
promptMessage = sprintf('Do you want to watch the new gray movie?');
	button = questdlg(promptMessage, 'Watch gray video?', 'Yes', 'No', 'Yes');

if strcmp(button, 'Yes')
    axis off
    implay('grayImages.avi'), title('gray video sequence');
end

pause

close all;

disp('now select an uncompressed (yuv) video sequence')
[filename, pathname] = uigetfile('*.yuv', 'open video');
disp('get the spatial and temporal dimensions of sequence')
w=input('width?')
h=input('height?')
l=input('number of images?')
   
fullname=fullfile(pathname,filename);

[mov,imgRGB]=loadFileYuv(fullname,w,h,1:l);

promptMessage = sprintf('Do you want to watch the full sequence YUV?');
	button = questdlg(promptMessage, 'Watch full YUV?', 'Yes', 'No', 'Yes');

if strcmp(button, 'Yes')
    axis off
    movie(mov), title('input uncompressed video sequence');
end

pause

disp('indicate the image index and the number of images to extract')
indexImage=input('index?')
numberImages=input('how many images?')
j=1;

for i=indexImage : indexImage+numberImages
    [mov,imgRGB]=loadFileYuv(fullname,w,h,i);
    extractedImages(:,:,:,j)=imgRGB;
    j=j+1;
end

im=imgRGB;

% show some of the extracted images
figure(1)
subplot(2,2,1), imshow(extractedImages(:,:,:,1));
subplot(2,2,2), imshow(extractedImages(:,:,:,1+(numberImages)));

%create a sequence with the extracted images
outputVideo = VideoWriter('extractedImages.avi'); % create AVI file to store the key frames
%outputVideo.FrameRate = 2; % slow frame rate because it is only the key frames
open(outputVideo)
for i=1 : j-1
    [mov,extractedFrame]=loadFileYuv(fullname,w,h,i);
    writeVideo(outputVideo,extractedFrame);
end
close(outputVideo);

promptMessage = sprintf('Do you want to watch the extracted sequence?');
	button = questdlg(promptMessage, 'Watch extracted video?', 'Yes', 'No', 'Yes');

if strcmp(button, 'Yes')
    axis off
    subplot(2,2,3), implay('extractedImages.avi'), title('extracted video sequence');
end

end
