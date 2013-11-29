function [examples,targets] = pre_processing(aam_path,blinks_data_struct,descriptor,options,target_texture_dimensions)


for i=1:length(blinks_data_struct)

	% unpacks struct information into variables
	[start_frame,end_frame,video_path,shape_path,target] = struct_to_variables(blinks_data_struct{i});

	%%%%%%%%%%%% HACK to speed up the compuration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	old_video_path = '';
	if i>1, [~,~,old_video_path] = struct_to_variables(blinks_data_struct{i-1}); end
	if strcmp(old_video_path,video_path), disp('..video already loaded..')
	else, disp('..loading..'); vid = VideoReader(video_path); disp('..loaded..'); end
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	tic	
	% Locate eyes and extract the texture
	[eyes_texture, eyes_shape] = eyes_localisation(vid,shape_path,aam_path,start_frame,end_frame);

	% scale texture 
	[resized_eyes_texture] = scale_texture(eyes_texture,target_texture_dimensions(1:2));

	% scale shape
	[resized_eyes_shape] = scale_shape(eyes_shape,[size(eyes_texture,2),size(eyes_texture,1)],target_texture_dimensions([2,1]));

	% interpolate
	[interp_eyes_texture] = interpolate_descriptor(resized_eyes_texture,target_texture_dimensions(3));

	disp(size(interp_eyes_texture))
	% calculate features representing the texture 
	features(i,:) = calculate_descriptor(interp_eyes_texture,descriptor,options);

	target(i,:) = target;
	

	rest(i) = toc;
	disp(mean(rest))
end

end