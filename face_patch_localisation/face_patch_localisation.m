function [patch_texture,patch_shape] = face_patch_localisation(video_path,shape_path,aam_path,tracker,face_dim,patch,start_frame,end_frame)

%
width  = face_dim(1);
height = face_dim(2);

% facial features points extraction
disp('facial feature extraction..')
shape = facial_feature_extraction(shape_path,video_path,tracker,start_frame, end_frame);

% normalise shape
disp('normalising the shape..')
normalised_shape = normalise_shape(shape,aam_path,face_dim);

% wrap the texture in the wraped shape
disp('normalising the texture..')
normalised_texture = normalise_texture(video_path,normalised_shape,shape,width,height,start_frame,end_frame);

% indices about path. this has to do with the tracker we use and the patch area
[patch_ind] = extract_patch_indices(patch,tracker);

% bounding box
disp('calculating bbox..')
bbox = calculate_bbox(normalised_shape,patch_ind)

% crop texture box
patch_texture = crop_texture(normalised_texture, bbox); 

% calculate final shape
patch_shape   = shift_shape(normalised_shape(patch_ind,:,:),bbox(:,1)');



end