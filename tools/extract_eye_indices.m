function [indices] = extract_eye_indices(tracker,which_eye)

	if strcmp(tracker,'cmu')

		if strcmp(which_eye,'left')

			indices = [20:25];

		end
		
		if strcmp(which_eye,'right')

			indices = [26:31];

		end

	end

end