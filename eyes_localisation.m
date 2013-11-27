function [l_eyes_texture,l_eyes_shape,l_eye_ind] = eyes_localisation(video_path,shape_path,aam_path,start_frame,end_frame)

% i have to add start and end frame at some point

%
width  = 160;
height = 160;

% facial features points extraction or loading
shape = facial_features_extraction(shape_path ,video_path, start_frame, end_frame);

% indices about eyes. this has to do with the tracker we use
l_eye_ind = [1:6];
r_eye_ind = [7:12];

% normalise shape
normalised_shape = normalise_shape(shape,aam_path,start_frame,end_frame);

% scale the shape and shift it so it has no negative coord
wraped_shape = shift_scale_shape(normalised_shape,width,height);

% wrap the texture in the wraped shape
normalised_texture = normalise_texture(video_path,wraped_shape,shape,width,height,start_frame,end_frame);

% eyes bounding box
l_eyes_box = calculate_eyes_box(wraped_shape,l_eye_ind);
r_eyes_box = calculate_eyes_box(wraped_shape,l_eye_ind);

% crop eyes box
l_eyes_texture = crop_texture(normalised_texture, l_eyes_box); 
r_eyes_texture = crop_texture(normalised_texture, r_eyes_box);

% calculate eyes shape
[l_eyes_shape,l_eye_ind] = shift_eyes_shape(wraped_shape,l_eye_ind,l_eyes_box,width,height);

end