function [RGBImage] = CreateKColourImage(clusters,MeanValues)
% CreateKColourImage recreates an image which has had its pixels divided
% into k clusters, using the mean RGB colour values of those clusters, in
% order to reduce the number of colours used to create the image
% Inputs:  clusters   = a 2D array (m rows, n columns) containing the final
%                       cluster numbers assigned to each of the pixels in
%                       the image
%          MeanValues = a 3D array (k rows, 1 column, 3 layers) which
%                       contains the final mean RGB values for each of the
%                       k clusters (with the row number corresponding to
%                       the cluster number)
% Outputs: RGBImage   = a 3D array (m rows, n columns, 3 layers) of
%                       unsigned 8 bit integers, representing a RGB image.
%                       Each pixel is coloured using the mean colour values
%                       given in the MeanValues array corresponding to the
%                       cluster that the particular pixel belongs to.
% Author: Sreeniketh Raghavan

SizeOfClusters = size(clusters);
m = SizeOfClusters(1); % number of rows in 'clusters'
n = SizeOfClusters(2); % number of columns 'clusters'

% Preallocating a zeros array of unsigned 8 bit integers for our output
% array 'RGBImage'
RGBImage = zeros(m,n,3, 'uint8');

for i = 1:m % loops through rows
    for j = 1:n % loops through columns
        
        % rounding off to the nearest integer and storing the mean red,
        % green and blue values of the cluster in their respective layers
        RGBImage(i,j,1) = round(MeanValues(clusters(i,j),1,1));
        RGBImage(i,j,2) = round(MeanValues(clusters(i,j),1,2));
        RGBImage(i,j,3) = round(MeanValues(clusters(i,j),1,3));
        
    end
end
end
