function [predictions] = classify(model,test_set,algorithm)

	if strcmp(algorithm,'lda')

		% project the test set in the lda space
		proj_test_set = test_set * model.projection;

		% LOOK if we can eliminate this for loop
		for i=1:length(model.label)

			% construct a matrix with that each column is the difference between the projected
			% test set and the representative of each label
			difference_matrix(:,i) = bsxfun( @minus,proj_test_set,model.representative(i,:) ).^2;

		end

		% find the indices of the minimum distance from the representatives
		[~,ind] = min(difference_matrix,[],2);

		% predictions can be constructed using the indices and the labels vector
		predictions = model.label(ind);

	end




end