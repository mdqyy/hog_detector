%clear all
addpath(genpath('.'))

video_dir = '/vol/hci2/projects/Aaron/DeceptionVideos/CulturalBenchmarks/CAM2';
avi = dir([video_dir '/*.avi']);
video_path = [video_dir '/' avi(10).name];

shape_dir = '/vol/bitbucket/ns2212/Shapes/shapes';
mat = dir([shape_dir '/D*.mat']);
shape_path = [shape_dir '/' mat(10).name];

aam_path = '~/Dropbox/Research/Code/AAM/trainset/trained_precompute_p.mat';

blink_dataset_path = 'blink_dataset.mat';

start_frame = 1001;
end_frame   = 1010;

database = 'cultural-benchmarks';

% texture = eyes_localisation(video_path,shape_path,aam_path,start_frame,end_frame);
% texture = eyes_localisation(video_path,shape_path,aam_path,2001,2010);
corrupted_videos = [80,87,88,96,102,103,107:110,123,127,131,132,134];

blink_matrix = convert_blink_dataset_to_matrix(blink_dataset_path,video_dir,shape_dir,corrupted_videos,database);

options.n_bins  = 9;
options.w_cell  = 8;
options.w_block = 2;
options.gamma   = 1;
options.sigma   = options.w_cell * options.w_block/2;
options.block_step = options.w_block /2;

descriptor = 'shape';

target_dimensions = [24,40,11];

tracker = 'cmu';

k_fold = 10;

algorithm = 'lda'

ml_options.PCARation = 0.1
tic
experiment(blink_matrix,aam_path,tracker,descriptor,options,target_dimensions,k_fold,algorithm,ml_options)
toc
