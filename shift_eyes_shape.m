function [final_eyes_shape,eye_index] = shift_eyes_shape(shape,eye_index,eye_box,old_width,old_height)

	eyes_shape = shape(eye_index,:,:);

	untrackedFrames = find(sum(sum(shape,1),2)==0);

	new_width  = (eye_box(1,2) - eye_box(1,1));
	new_height = (eye_box(2,2) - eye_box(2,1));

	origin = [eye_box(1,1) eye_box(2,1)];
	scale  = [new_width / old_width, new_height / old_height];

	shift_eyes_shape = bsxfun(@minus,eyes_shape,origin);
	final_eyes_shape = bsxfun(@times,shift_eyes_shape,scale);

	final_eyes_shape(:,:,untrackedFrames) = 0;

	eye_index = [1:length(eye_index)];

end