

function histograma( video_fullname)
 disp('--- Siga começar Histograma ---');

video=VideoReader(video_fullname);

%Create new scenes video
outputVideo = VideoWriter('scenes_histogram.mp4','MPEG-4'); 
outputVideo.FrameRate = 3;
open(outputVideo);

%Create number of frame file
fid = fopen( 'scenes_histogram.txt', 'wt');
i = 1;
total_scenes = 1;

frame = readFrame(video);
[counts_image1, x1] = imhist(frame,256);
writeVideo(outputVideo,frame);
fprintf( fid, '%d', i);

while hasFrame(video)
    i = i +1;
    %le imagem
    frame2 = readFrame(video);
    [counts_image2, x2] = imhist(frame2,256);
    
    %root mean square error
    rmse = sqrt(mean( (counts_image1-counts_image2).^2 ));
    
    %if greater image not the same
    if rmse > 250
       total_scenes = total_scenes + 1;
       writeVideo(outputVideo,frame2);
       fprintf( fid, ', %d', i);
       %update the image to diferent images
       frame = frame2;
       counts_image1 = counts_image2;
       x1 = x2;
       fprintf('.');
    end
end
    fprintf( fid, '\nTotal scenes: %d', total_scenes);
    fprintf( fid, '\nTotal frames: %d', i);
    fclose(fid);
    close(outputVideo);
    fprintf('\n');
    disp('--- Finito ---');
end

