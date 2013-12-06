function [mask] = create_mask(dimensions,shape)

	height = dimensions(1);

	width = dimensions(2);

	% convert to double as required by poly2mask
	shape = double(shape);

	% calculate the convex hull for the left eye
	mask = poly2mask( shape(:,1),shape(:,2),height,width) ;
    

 end
