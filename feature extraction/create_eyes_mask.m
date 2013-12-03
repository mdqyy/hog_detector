function [mask] = create_eyes_mask(height,width,eyes_shape,l_eye_ind,r_eye_ind)

% calculate the convex hull for the left eye
	mask_lefteye = poly2mask(eyes_shape(l_eye_ind,1),eyes_shape(l_eye_ind,2),height,width);
  	
	% calculate the convex hull for the right eye
  	mask_righteye = poly2mask(eyes_shape(r_eye_ind,1),eyes_shape(r_eye_ind,2),height,width);
  	
  	% merge the masks with and or operator 
  	mask = mask_lefteye | mask_righteye;

  end