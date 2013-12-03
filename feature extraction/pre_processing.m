function [examples,targets] = pre_processing(aam_path,blinks_data_struct,descriptor,options,target_texture_dimensions,tracker)

% the number of examples is the number of rows of blinks_data_struct
nb_examples = length(blinks_data_struct);

% the feature size can be extracted by calculating the descriptor in a black image
feature_size = size(calculate_descriptor(zeros(target_texture_dimensions),zeros(49,2),target_texture_dimensions,descriptor,options));

% initialisation of our matrices for speed efficiency
examples = zeros([nb_examples,feature_size]);
target   = zeros([nb_examples,1]);

for i=1:nb_examples
	disp(i)

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
	[eyes_texture, eyes_shape] = eyes_localisation(vid,shape_path,tracker,aam_path,start_frame,end_frame);
	
	% calculate features representing the texture 
	examples(i,:) = calculate_descriptor(eyes_texture,eyes_shape,target_texture_dimensions,descriptor,options);

	targets(i,:) = target;

	rest(i) = toc;
	disp(mean(rest))

end

end