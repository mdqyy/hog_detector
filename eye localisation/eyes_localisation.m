function [l_eyes_texture,l_eyes_shape,l_eye_ind] = eyes_localisation(video_path,shape_path,tracker,aam_path,start_frame,end_frame)

% add dependencies
% addpath('../tools/')

%
width  = 160;
height = 160;

% facial features points extraction or loading
disp('facial feature extraction..')
shape = facial_feature_extraction(shape_path ,video_path, start_frame, end_frame);

% indices about eyes. this has to do with the tracker we use
[l_eye_ind,r_eye_ind] = extract_eye_indices(tracker);

% normalise shape
disp('normalising the shape..')
normalised_shape = normalise_shape(shape,aam_path);

% scale the shape and shift it so it has no negative coord
%wraped_shape = shift_scale_shape(normalised_shape,width,height);
centered_shape = shift_shape(normalised_shape,mean(normalised_shape,3));
shifted_shape = shift_shape(normalised_shape,min(normalised_shape));
wraped_shape = scale_shape(shifted_shape,max(normalised_shape),[width height]);

% wrap the texture in the wraped shape
disp('normalising the texture..')
normalised_texture = normalise_texture(video_path,wraped_shape,shape,width,height,start_frame,end_frame);

% eyes bounding box
disp('crop the eyes..')
l_eyes_box = calculate_eyes_box(wraped_shape,l_eye_ind);
%r_eyes_box = calculate_eyes_box(wraped_shape,l_eye_ind);

% crop eyes box
l_eyes_texture = crop_texture(normalised_texture, l_eyes_box); 
%r_eyes_texture = crop_texture(normalised_texture, r_eyes_box);

% calculate eyes shape
%[l_eyes_shape,l_eye_ind] = shift_eyes_shape(wraped_shape,l_eye_ind,l_eyes_box,width,height);
temp_shape   = shift_shape(wraped_shape(l_eye_ind,:,:),l_eyes_box(:,1)');
l_eyes_shape = scale_shape(temp_shape,[width height],[l_eyes_box * [-1 1]']');

end