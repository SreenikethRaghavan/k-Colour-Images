function [Colours] = GetRGBValuesForPoints(ImageArray,WhichPixels)
% GetRGBValuesForPoints outputs the RGB colour values for the chosen pixels
% of an image
% Inputs:  ImageArray  = a 3D image array from which the RGB values will be
%                        read
%          WhichPixels = a 2D array (with k rows and 2 columns) with the
%                        coordinates (or location) of the pixels for which
%                        the colours values need to be extracted
% Outputs: Colours     = a 3D array (k rows, 1 column, 3 layers) which
%                        stores the RGB colour values for each of the k
%                        input points
% Author: Sreeniketh Raghavan

% k is the number of points for which we require the RGB values (each row
% of WhichPixels represents a different point)
SizeOfWhichPixels = size(WhichPixels);
k = SizeOfWhichPixels(1);

% Preallocating a 3D array of zeros for our output 'Colours' which will
% make it easier to store data later
Colours = zeros(k, 1, 3);

% the for loop loops through each of the k points in order to read its RGB
% values
for i = 1:k
    % reads the RGB values of the point from the ImageArray and stores it
    % in the respective layers of 'Colours'
    Colours(i,:,1) = ImageArray(WhichPixels(i,1),WhichPixels(i,2),1);
    Colours(i,:,2) = ImageArray(WhichPixels(i,1),WhichPixels(i,2),2);
    Colours(i,:,3) = ImageArray(WhichPixels(i,1),WhichPixels(i,2),3);
end
end

