function [flag] = identify_corruption(video_name,corrupted_videos)

	% regular expression that extracts the id as it is in corrupted videos
	% this is the functions that you should change for different video datasets
	video_number = str2num(regexp(video_name,'\d*','match','once'));

	% boolean that returns whether our video is corrupted
	flag         = ismember(video_number,corrupted_videos);

end