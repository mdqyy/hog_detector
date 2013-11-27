function [shifted_normalized_shape] = shift_scale_shape(normalized_shape,SIZEX,SIZEY)

% WE CAN SURELY WRITE THIS FUNCTION VECTORIZED

nb_frames = size(normalized_shape,3);
for i=1:nb_frames
 %------------------------------------------------------------------
    %This part shifts the shape so points do not contain negative coordinates
    
    % SIZE OF THE FINAL SHAPE AND IMAGE
    %SIZEX = 160;
    %SIZEY = 160;
    unshifted_normalized_shape = normalized_shape(:,:,i);

    num_of_points = size(unshifted_normalized_shape,1);
    
    
    % center the unshifted_normalized_shape and shift it so it has positive coordinates
    unshifted_normalized_shape = reshape(unshifted_normalized_shape, num_of_points, 2);
    unshifted_normalized_shape = unshifted_normalized_shape - repmat(mean(unshifted_normalized_shape), [num_of_points, 1]);
    mini = min( unshifted_normalized_shape(:, 1) );
    minj = min( unshifted_normalized_shape(:, 2) );
    shifted_shape = unshifted_normalized_shape - repmat([mini, minj], [num_of_points, 1]);
    % ATTENTION, WE DOWNSCALE THE SHAPE HERE!!
    maxi = max( shifted_shape(:, 1) );
    maxj = max( shifted_shape(:, 2) );
    if (maxi==0) maxi=1;end %avoid dividing by zero
    if (maxj==0) maxj=1;end %avoid dividing by zero
    shifted_shape(:, 1) = shifted_shape(:, 1) /maxi * SIZEX;
    shifted_shape(:, 2) = shifted_shape(:, 2) /maxj * SIZEY;

    %-----------------------------------------------------------------------------

    shifted_normalized_shape(:,:,i) = shifted_shape;
end

