function [indices] = extract_patch_indices(patch,tracker)

	if strcmp(patch,'left eye')

		indices = extract_eye_indices(tracker,'left');

	end

end