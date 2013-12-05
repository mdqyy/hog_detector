function [eye_texture,eye_shape] = eyes_localisation(video_path,shape_path,aam_path,tracker,start_frame,end_frame)

face_dim = [160,160];

patch = 'left eye';

[eye_texture, eye_shape] = face_patch_localisation(video_path,shape_path,aam_path,tracker,face_dim,patch,start_frame,end_frame);

end