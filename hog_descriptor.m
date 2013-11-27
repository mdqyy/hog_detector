function [descriptor] = hog_descriptor(eyes_box,mask,hog_options,start_frame,end_frame)

%This is basically a croping and masking operation so it should be relative fast. No need for saving 
% We also assume that the coordinate frames for start and end frame are according to eyes_box

% initialize start and end frame if they dont exist
if ~exist('start_frame'), start_frame = 1;                end
if ~exist('end_frame')  , end_frame   = size(eyes_box,3); end

% import essential dependencies
disp('Adding paths..')
addpath(genpath('~/Dropbox/Research/Code/'))




end