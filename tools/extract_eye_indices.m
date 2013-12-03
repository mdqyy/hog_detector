function [l_eye_ind,r_eye_ind] = extract_eye_indices(tracker)

	if strcmp(tracker,'cmu')

		l_eye_ind = [20:25];
		r_eye_ind = [26:31];

	end

end