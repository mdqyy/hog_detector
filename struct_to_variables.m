function [start_frame,end_frame,video_path,shape_path,target] = struct_to_variables(struct)

	%names = fieldnames(struct);

	%for i=1:length(names)

	%	eval( [ 'var' num2str(i) '=' eval('struct.' names{i} ) ] );

	%end

	start_frame = struct.start_frame;
	end_frame   = struct.end_frame;
	video_path  = struct.video_path;
	shape_path  = struct.shape_path;
	target = struct.target; 

end
