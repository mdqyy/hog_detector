function [partition] = create_partition(targets,k_folds)

	partition_path = 'partition.mat';

	mat = dir(partition_path);

	if isempty(mat)
		partition = cvpartition(targets,'kfold', k_folds); 
	else
		load(partition_path)
	end

end