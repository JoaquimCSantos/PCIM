function [ output_args ] = tss( video_fullname )

disp('--- Siga começar 3SS ---');

video=VideoReader(video_fullname);
video2=VideoReader(video_fullname);

numberFrames = video2.NumberOfFrames;


p = 7;
block = 16;
PSNR = 1:floor(0.5+numberFrames/2);
i = 1;

while hasFrame(video)
    
    if hasFrame(video)
        frame = double(rgb2gray(readFrame(video)));
    else
        break;
    end
    
    if hasFrame(video)
        frame2 = double(rgb2gray(readFrame(video)));
    else
        break;
    end
    
    motion = getMotionVectorTSS(frame2,frame,block,p);

    compensatedImage = computeCompensatedImage(frame, motion, block);
    
    [peaksnr, snr] = psnr(frame2,compensatedImage);

    PSNR(i) = peaksnr;
    
    if mod(i,10) == 0
        fprintf('.');
    end

    i = i +1;
end

[peakValues, indexes] = findpeaks(-PSNR,'MinPeakDistance',18);
figure;plot(indexes,peakValues);
figure;plot(1:floor(0.5+numberFrames/2),PSNR);

%Create new scenes video
outputVideo = VideoWriter('scenes_3ss.mp4','MPEG-4'); 
outputVideo.FrameRate = 3;
open(outputVideo);

%Create number of frame file
fid = fopen( 'scenes_3ss.txt', 'wt');

for i=1:numel(indexes)
    video.CurrentTime = indexes(i)*2*(1/video.FrameRate);
    scene = readFrame(video);
    fprintf( fid, '%d, ', indexes(i)*2 );
    writeVideo(outputVideo,scene);
end
    fprintf( fid, '\nTotal scenes: %d', i);
    fprintf( fid, '\nTotal frames: %d', numberFrames);
    fclose(fid);
    fprintf('\n');
disp(' --- Finito ---');
end




