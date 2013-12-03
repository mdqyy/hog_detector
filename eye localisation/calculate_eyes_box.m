function [eyes_box] = calculate_eyes_box(shape,eyes_indices)

	% we calculate the mean eyes shape
	mean_eyes_shape = mean(shape(eyes_indices,:,:),3);

	% we extract a bounding box containing the eyes
	eyes_box(:, 1) = min(mean_eyes_shape)' - 4; 
	eyes_box(:, 2) = max(mean_eyes_shape)' + 4;

	% rounding because they are indices
	eyes_box = round(eyes_box);
	

end