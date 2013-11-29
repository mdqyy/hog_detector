function [scaled_shape] = scale_shape(shape,original_dimensions,target_dimensions)

	scale = target_dimensions ./ original_dimensions;

	scaled_shape =  bsxfun(@times,shape,scale);


end