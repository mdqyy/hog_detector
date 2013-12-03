function [model] = machine_learning(training,labels,algorithm,options)

	if strcmp(algorithm,'lda')
		addpath('~/Dropbox/Research/Code/Machine Learning/')

		%options = [];
		%option.PCARatio = 0.9;

		[eigvec eigcval] = LDA(labels,options,training);

		model.projection = eigvec;

		unique_labels = unique(labels);
		for i=1:length(unique_labels)

			model.representative(i,:) = mean( training( find( labels==unique_labels(i) ),:) * eigvec );
			
			model.label(i,:)          = unique_labels(i);

		end

	end

end