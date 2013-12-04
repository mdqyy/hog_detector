function [accuracy] = experiment(blink_matrix,aam_path,tracker,descriptor,options,target_dimensions,k_fold,algorithm,ml_options)

% this produces the the matrix X which represents examples and Y which represents targets
[X,Y] = pre_processing(aam_path,blink_matrix,descriptor,options,target_dimensions,tracker);

% we validate the parameters here by doing machine learning and k fold cross-validation
confusion_matrix = cross_validation(X,Y,k_fold,algorithm,ml_options);

% we tranform confusion matrix to an accuracy measure
accuracy = confusion_to_accuracy(confusion_matrix);

end

