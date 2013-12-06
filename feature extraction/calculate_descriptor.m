function [ descriptor ] = calculate_descriptor(texture,shape,target_texture_dimensions,descriptor,options)

	% scale texture 
	[resized_texture] = scale_texture(texture,target_texture_dimensions(1:2));

	% scale shape
	[resized_eyes_shape] = scale_shape(shape,[size(texture,2),size(texture,1)],target_texture_dimensions([2,1]));

	% interpolate
	[interp_texture] = interpolate_descriptor(resized_texture,target_texture_dimensions(3));
    
    % interpolated shape
    [interp_shape] = interpolate_descriptor(resized_eyes_shape,target_texture_dimensions(3));

	% create mask
	options.mask = create_mask( target_texture_dimensions(1:2),resized_eyes_shape );

	disp(size(interp_texture))

	if strcmp(descriptor,'hog')
		% add path to HOG code
		addpath('~/Dropbox/Research/Code/HOG/code3/')

		% collapse the information in a vector
		descriptor = hog_descriptor(interp_texture,options);
		
	end

	if strcmp(descriptor,'texture')

		descriptor = texture_descriptor(texture,options);

    end
    
    if strcmp(descriptor,'shape')
       
        descriptor = interp_shape(:);
        
    end
	
    if strcmp(descriptor,'hof')
       
        descriptor = hof_descriptor(interp_texture,options);
        
    end

end