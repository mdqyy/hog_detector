function [wraped_shape] = normalise_shape(shape,AAM_model_path,face_dim)

scale = 1;
load(AAM_model_path)

% CHECK IF WE CAN WRITE THIS FUNCTION VECTORIZED

normalised_shape = zeros(size(shape),'single');
for i=1:size(shape,3)
  
    
	test_shape = double( shape(:,:,i) );

	similarity_eigenvecs = shape_space{scale}.similarity_eigenvecs;
	pose_eigenvecs = shape_space{scale}.eigenvecs(:,1:2);
	mean_shape = data.mean_shape(scale, :, :);

	unshifted_normalized_shape = remove_pose_similarities(test_shape,mean_shape,similarity_eigenvecs,pose_eigenvecs);
	unshifted_normalized_shape = reshape(unshifted_normalized_shape, [], 2);
   

    % store the result
    normalised_shape(:,:,i) = unshifted_normalized_shape;
end

%centered_shape = shift_shape(normalised_shape,mean(normalised_shape,3));
%shifted_shape = shift_shape(centered_shape,min(normalised_shape));
%wraped_shape = scale_shape(shifted_shape,max(normalised_shape),face_dim);
wraped_shape = shift_scale_shape(normalised_shape,face_dim(1),face_dim(2));

end

function [normalized_shape] = new_normalise_shape(shape,AAM_model_path,target_dim)

scale = 1;
load(AAM_model_path)

unshifted_normalized_shape = zeros(size(shape),'single');

test_shape = double( shape );

similarity_eigenvecs = shape_space{scale}.similarity_eigenvecs;
pose_eigenvecs = shape_space{scale}.eigenvecs(:,1:2);
mean_shape = data.mean_shape(scale, :, :);

unshifted_normalized_shape = remove_pose_similarities( shape, mean_shape, similarity_vecs, pose_eigenvecs )


centered_shape = shift_shape(unshifted_normalized_shape,mean(normalised_shape,3));

shifted_shape = shift_shape(centered_shape,min(normalised_shape));

wraped_shape = scale_shape(shifted_shape,max(normalised_shape),target_dim);

end