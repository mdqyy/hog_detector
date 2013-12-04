function [bbox] = calculate_bbox(shape,indices)

	% we calculate the mean shape
	mean_shape = mean(shape(indices,:,:),3);

	% we extract a bounding box containing the patch
	bbox(:, 1) = min(mean_shape)' - 4;
	bbox(:, 2) = max(mean_shape)' + 4;

	% rounding because they are indices
	bbox = round(bbox);
	

end