function [cropped] = crop_texture(normalised_texture,eyes_box)


	cropped = normalised_texture(eyes_box(2,1):eyes_box(2,2),eyes_box(1,1):eyes_box(1,2),:);

end