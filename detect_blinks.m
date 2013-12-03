video_path = '';
shape_path = '';
aam_path   = '';

%-------------------- EYE LOCALISATION --------------------

[eyes_texture,eyes_shape] = eyes_localisation(video_path,shape_path,aam_path,[],[]);

%---------------------------------------------------------

%------------------ FEATURES EXTRACTION ------------------

descriptor = calculate_descriptor(eyes_texture,eyes_shape,target_texture_dimensions,'hog',options);

%---------------------------------------------------------

%----------------------- DETECTION -----------------------

% calculate blink indices

% calculate blink duration

%---------------------------------------------------------


