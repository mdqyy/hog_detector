function [shape] = facial_feature_extraction(shape_path,video_path,start_frame,end_frame)

	if ~isempty(shape_path)
		load(shape_path) 
	else
		% we use supervised descent algorithm to track our points
		result = run_CMU_tracker(video_path); 
    end
    
	shape = convert_cmu_cell_to_matrix(result,start_frame,end_frame);
end

function [matrix] = convert_cmu_cell_to_matrix(cell_struct,start_frame,end_frame)

	%nb_frames = length(cell_struct);
	shape_dimensions = size(cell_struct{find(~cellfun('isempty',cell_struct),1)}.pred);

	matrix = zeros([shape_dimensions , end_frame - start_frame + 1],'single');

	for i=start_frame:end_frame

		if ~isempty(cell_struct{i})
			matrix(:,:,i-start_frame+1) = cell_struct{i}.pred;
		end

	end

end