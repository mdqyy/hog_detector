function [ descriptor ] = calculate_descriptor(texture,descriptor,options)

	if strcmp(descriptor,'hog')
		addpath('~/Dropbox/Research/Code/HOG/code3/')

		n_bins     = options.n_bins;
		w_cell     = options.w_cell;
		w_block    = options.w_block;
		gamma      = options.gamma;
		sigma      = options.sigma;
		block_step = options.block_step;

		% we assume that texture is a stack of black and white images
		nb_images = size(texture,3);
		for i=1:nb_images

			img = texture(:,:,i);

			hog_feature = standard_HoG_compute(img,[],w_cell,gamma,sigma,n_bins,w_block,block_step);

			hog_stack(i,:) = hog_feature(:);

		end

		%interpolated_hog = interpolate_descriptor(hog_vector,target_stack_size);

		descriptor = hog_stack(:);
		
	end

	

end