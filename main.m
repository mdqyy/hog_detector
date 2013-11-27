clear all

video_dir = '/vol/hci2/projects/Aaron/DeceptionVideos/CulturalBenchmarks/CAM2';
avi = dir([video_dir '/*.avi']);
video_path = [video_dir '/' avi(10).name];

shape_dir = '/vol/bitbucket/ns2212/Shapes/shapes';
mat = dir([shape_dir '/D*.mat']);
shape_path = [shape_dir '/' mat(10).name];

aam_path = '~/Dropbox/Research/Code/AAM/trainset/trained_precompute_p.mat';

start_frame = 100;
end_frame   = 110;

texture = eyes_localisation(video_path,shape_path,aam_path,start_frame,end_frame);