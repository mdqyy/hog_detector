function [wraped] = normalise_texture(video_path,wraped_shape,original_shape,width,height,startFrame,endFrame)

% disp('..loading the video..')
% vid = VideoReader(video_path);
% disp('..loaded..')

%%% HACK to speed up the reading
vid = video_path;
video_path = vid.name;
data_path = '/vol/bitbucket/ns2212/Eyes';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~exist('startFrame'), startFrame = 1; end
if ~exist('endFrame'), endFrame = vid.NumberOfFrames; end

addpath(genpath('~/Dropbox/Research/Code/AAM/'))

%%%%%%% SPEED UP THIS PART BY LOADING PRE-PROCESSED %%%%
texture_name = [regexp(video_path,'[\w\-]+\d{3}','match','once') '-' num2str(startFrame,'%06d') '-' num2str(endFrame,'%06d')];
mat = dir([data_path '/' texture_name '*.mat']);
if ~isempty(mat), load([data_path '/' mat.name]), else
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% else
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

save([ data_path '/' texture_name '.mat'],'wraped')

%%%%%%%%%%
% SPEED UP END
end
%%%%%%%%%%

end