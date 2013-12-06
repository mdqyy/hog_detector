function [descriptor] = hof_descriptor(texture,options,start_frame,end_frame)

	%This is basically a croping and masking operation so it should be relative fast. No need for saving 

	% import essential dependencies
	addpath('~/Dropbox/Research/Code/HOG/code3/')

	% initialise options of hof descriptor
	n_bins     = options.n_bins;
	w_cell     = options.w_cell;
	w_block    = options.w_block;
	gamma      = options.gamma;
	sigma      = options.sigma;
	block_step = options.block_step;
	mask       = options.mask;

	% we assume that texture is a stack of black and white images
	nb_images = size(texture,3);
	for i=1:nb_images-1

		% pick two images from the stack
		img1 = texture(:,:,i);
        img2 = texture(:,:,i+1);

		% calculate hog for this image
		hof_feature = standard_HoF_compute(img1,img2,mask,w_cell,gamma,sigma,n_bins,w_block,block_step);

		% save the result in a matrix where each row contains info about an image
		hof_stack(i,:) = hof_feature(:);

	end

	% collapse the information in a vector
	descriptor = hof_stack(:);


end