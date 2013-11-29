function [wraped] = normalise_texture(video_path,wraped_shape,original_shape,width,height,startFrame,endFrame)

disp('..loading the video..')
% hack to speed up the reading
vid = video_path;%VideoReader(video_path);

if ~exist('startFrame'), startFrame = 1; end
if ~exist('endFrame'), endFrame = vid.NumberOfFrames; end

addpath(genpath('~/Dropbox/Research/Code/AAM/'))

disp('..loaded..')
tic
wraped = zeros(height,width,endFrame-startFrame+1,'uint8');

for i=startFrame:endFrame
    
    if (mod(i,1000)==1), disp(i), end;
	    
    test_img = rgb2gray(read(vid,i)); 
    
    source_shape = double(original_shape(:,:,i -startFrame +1) );
    
    target_shape = double(wraped_shape(:,:,i -startFrame +1) );

	if sum(source_shape(:))==0
	   wraped(:,:,i-startFrame+1) = imresize(uint8(test_img),[height width]);
	else
        wraped(:,:,i-startFrame+1) = imresize(uint8(new_warp_image(target_shape(:), source_shape(:), test_img ) ),[height width]);  
	end
        
end

%disp(toc)


end