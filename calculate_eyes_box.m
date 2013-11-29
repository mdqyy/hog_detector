function [eyes_box] = calculate_eyes_box(shape,eyes_indices)

	mean_eyes_shape = mean(shape(eyes_indices,:,:),3);

	eyes_box(:, 1) = min(mean_eyes_shape)' - 4; 
	eyes_box(:, 2) = max(mean_eyes_shape)' + 4;
	

end