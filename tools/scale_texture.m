function [scaled_texture] = scale_texture(texture,target_dimensions)

	
	scaled_texture = imresize(texture,target_dimensions);

end