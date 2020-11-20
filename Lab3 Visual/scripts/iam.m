function [ output_args ] = iam( video_fullname )

disp('--- Siga começar IAM ---');

video=VideoReader(video_fullname);

%Create new scenes video
outputVideo = VideoWriter('scenes_iam.mp4','MPEG-4'); 
outputVideo.FrameRate = 3;
open(outputVideo);

%Create number of frame file
fid = fopen( 'scenes_iam.txt', 'wt');
i = 1;
total_scenes = 1;

M = video.width;
N = video.height;

frame = readFrame(video);
old_iam = getIAM(frame,M,N);
writeVideo(outputVideo,frame);
fprintf( fid, '%d', i);

while hasFrame(video)
    i = i +1;
    
    frame2 = readFrame(video);
    new_iam = getIAM(frame2,M,N);
    
    u = [old_iam;new_iam];
    distance = pdist(u)
     
    if distance > 0.005
        
        total_scenes = total_scenes + 1;
        
        writeVideo(outputVideo,frame2);
        old_iam = new_iam;
        fprintf( fid, ', %d', i);
        
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

