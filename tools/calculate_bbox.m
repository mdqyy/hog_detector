function [bbox] = calculate_bbox(shape,indices)

	% we calculate the mean shape
	first_shape = shape(indices,:,1);

	% we extract a bounding box containing the patch
	bbox(:, 1) = min(first_shape)' - 4;
	bbox(:, 2) = max(first_shape)' + 4;

	% rounding because they are indices
	bbox = round(bbox);
    
    % making sure that the indices are greater than zero
    bbox(:, 1) = max( bbox(:, 1), [1;1]);
	

end