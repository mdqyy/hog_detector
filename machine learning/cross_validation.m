function [confusion_matrix] = cross_validation(examples,targets,k_folds,algorithm,options)

confusion_matrix = zeros( length( unique( targets )));

partition = cvpartition(targets,'kfold', k_folds);
%partition = create_partition(targets, k_folds);

for i=1:k_folds

	[trainInd,valInd,~] = dividerand( partition.TrainSize(i), 0.8, 0.2, 0);

	model = machine_learning(examples(trainInd,:),targets(trainInd),algorithm,options);
	
	predictions = classify(model,examples(valInd,:),algorithm);
	
	confusion_matrix = confusion_matrix + create_confusion_matrix(predictions, targets(valInd) );

end




end