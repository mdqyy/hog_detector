function [descriptor]  = texture_descriptor(texture,options)

	%This is basically a croping and masking operation so it should be relative fast. No need for saving 

	% initialise options of texture descriptor
	mask = options.mask;

	% create the descriptor
	descriptor = bsxfun(@times,texture,uint8(mask));


end


