function [shifted_shape] = shift_shape(shape,origin)

	zero_ind = find( sum( sum( shape,1),2)==0 );

	shifted_shape = bsxfun(@minus,shape,origin);

	shifted_shape(:,:,zero_ind) = 0;
end