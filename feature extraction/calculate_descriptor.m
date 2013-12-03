function [ descriptor ] = calculate_descriptor(texture,target_texture_dimensions,descriptor,options)

	% scale texture 
	[resized_texture] = scale_texture(texture,target_texture_dimensions(1:2));

	% scale shape
	%[resized_eyes_shape] = scale_shape(eyes_shape,[size(texture,2),size(texture,1)],target_texture_dimensions([2,1]));

	% interpolate
	[interp_texture] = interpolate_descriptor(resized_texture,target_texture_dimensions(3));

	disp(size(interp_texture))

	if strcmp(descriptor,'hog')
		addpath('~/Dropbox/Research/Code/HOG/code3/')

		n_bins     = options.n_bins;
		w_cell     = options.w_cell;
		w_block    = options.w_block;
		gamma      = options.gamma;
		sigma      = options.sigma;
		block_step = options.block_step;

		% we assume that texture is a stack of black and white images
		nb_images = size(interp_texture,3);
		for i=1:nb_images

			img = interp_texture(:,:,i);

			hog_feature = standard_HoG_compute(img,[],w_cell,gamma,sigma,n_bins,w_block,block_step);

			hog_stack(i,:) = hog_feature(:);

		end

		%interpolated_hog = interpolate_descriptor(hog_vector,target_stack_size);

		descriptor = hog_stack(:);
		
	end

	

end