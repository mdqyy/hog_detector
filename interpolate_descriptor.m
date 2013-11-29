function [interpolated_descriptor] = interpolate_descriptor(stack_of_descriptor,target_stack_size)

% This function interpolates a stack of descriptor of uknown length
% to a fixed a length. This is extremely useful for machine learning
% purposes where all your training examples must be the same size.
%
% *-------------INPUT----------
% -stack of descriptor is a 4 dimensional matrix. The 4th dimension
%  has to do with th length
% -target stack size is the target length of the descriptor
%
% *-------------OUTPUT--------
% -intepolated_descriptor is the same descriptor with the new target size
%
% This function was written with the help of Jean KOSSAIFI

sizex = size(stack_of_descriptor,1);
sizey = size(stack_of_descriptor,2);
sizez = size(stack_of_descriptor,3);

s = size(stack_of_descriptor);
stack_size  = s( length(s) );

t_interval = linspace(1,target_stack_size,stack_size);

if sizez==1
   [x t] = ndgrid(1:sizex,t_interval);
   [dx dt] = ndgrid(1:sizex,1:target_stack_size);
   interpolated_descriptor = interp2(x',t',stack_of_descriptor',dx',dt');

else if length(s)==3
   [x y t] = ndgrid(1:sizex,1:sizey,t_interval);
   [dx dy dt] = ndgrid(1:sizex,1:sizey,1:target_stack_size);
   interpolated_descriptor = interp3(y,x,t,single(squeeze(stack_of_descriptor)),dy,dx,dt);
else
   [x y z t] = ndgrid(1:sizex,1:sizey,1:sizez,t_interval);
   [dx dy dz dt] = ndgrid(1:sizex,1:sizey,1:sizez,1:target_stack_size);
   interpolated_descriptor = interpn(x,y,z,t,stack_of_descriptor,dx,dy,dz,dt);
end


end