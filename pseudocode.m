
% INPUTS
% blinks dataset path,options,descriptor

% loads blinks dataset
% convert blinks dataset to blinks dataset matrix

%%%%%%%%%%%% PRE PROCESSING %%%%%%%%%%%%%%%%%%%
% INPUT: Blink dataset matrix, descriptor, options

% FOR ALL BLINKS ---

% ------- EYE LOCALIZATION --
% eyes = eye localisation
% ---------------------------

% ------- FEATTURE EXTRACTION --
% features(i,:) = calculate descriptor(eyes,'hog',options)

% targets(i,:) = (binary)blink_or_not(blinks_dataset)
% ------------------------------

% END FOR ---------

% OUTPUT: X , Y matrices representing examples,targets
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% split data into training validation and testing

%%%%%%%%%% 10 FOLD CROSS VALIDATION %%%%%%%%%

% --- MACHINE LEARNING --

%%%%%% wraped up in one function %%%%%%
% pca_projection = pca(features)
% lda_projection = lda(features,targets)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output = machine_learning(training,'lda')

% -----------------------

% ---- VALIDATE --------

% prediction = classify(output,'lda',validation)

% confusion_mat = confusion_mat + calc_confusion_matrix(predictions,validation)

% ----------------------

%%%%%%% END OF 10 FOLD CROSS VALIDATION %%%%

% accuracy = conf_to_accuracy(confusion_mat,'classification-accuracy')

% OUTPUT accuracy


