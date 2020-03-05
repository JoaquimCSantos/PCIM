function [ iam ] = getIAM( frame,M,N)

hsv = rgb2hsv(frame);
luminance_frame = hsv(:,:,3);

iam = 0;
iam1 = 0;
iam2 = 0;

for i = 1:(N-1)
    for j = 1:M
        iam1 = iam1 + abs( luminance_frame(i,j) - luminance_frame(i+1,j) ) ;
    end
end
for i = 1:N
    for j = 1:(M-1)
        iam2 = iam2 + abs( luminance_frame(i,j) - luminance_frame(i,j+1) );
    end
end

iam = 1/(N*M)*(iam1-iam2);

end

