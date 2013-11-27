video_path = '';
shape_path = '';
aam_path   = '';

%-------------------- EYE LOCALISATION --------------------

[eyes_box,eyes_shape,l_eye_ind,r_eye_ind] = eyes_localisation(video_path,shape_path,aam_path,[],[]);

%---------------------------------------------------------

%------------------ FEATURES EXTRACTION ------------------

descriptor = calculate_descriptor(,'hog')

%---------------------------------------------------------

%----------------------- DETECTION -----------------------

% calculate blink indices

% calculate blink duration

%---------------------------------------------------------


