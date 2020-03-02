function [MeanValues] = UpdateMeans(ImageArray,k,clusters)
% UpdateMeans calculates the mean RGB values of each cluster
% Inputs:  ImageArray = a 3D array (m rows, n columns, 3 layers)
%                       representing a RGB coloured image
%          k          = the number of clusters that are there
%          clusters   = a 2D array (m rows, n columns) containing the
%                       cluster number assigned to each of the pixels in
%                       the image
% Outputs: MeanValues = a 3D array (k rows, 1 column, 3 layers) which
%                       contains the mean RGB colour values for each of the
%                       k clusters (the row number corresponds to the
%                       cluster number)
% Author: Sreeniketh Raghavan

% Preallocating a 3D array of zeros for our output 'MeanValues' which will
% make it easier to store data later
MeanValues = zeros(k,1,3);

% finding the number of rows m and number of columns n in the image
SizeOfImageArray = size(ImageArray);
m = SizeOfImageArray(1);
n = SizeOfImageArray(2);

% variable to help with the position of elements while storing in an array
position = 0;

for a = 1:k % looping through the cluster numbers
    
    % creating 3 empty arrays to store the RGB values of points
    red = [];
    green = [];
    blue = [];
    
    for i = 1:m % looping through rows of clusters array
        for j = 1:n % looping through columns of clusters array
            
            % conditional if statement to ensure that the RGB values for
            % only that particular cluster are stored
            if clusters(i,j) == a
                
                % to move to the next position in the array in order to
                % store the next value
                position = position + 1;
                
                % storing the RGB values for the point
                red(position) = ImageArray(i,j,1);
                green(position) = ImageArray(i,j,2);
                blue(position) = ImageArray(i,j,3);
                
            end
        end
    end
    
    % calculating the mean red, green and blue values for the cluster
    MeanValues(a,1,1) = mean(red);
    MeanValues(a,1,2) = mean(green);
    MeanValues(a,1,3) = mean(blue);
    
    % setting the position back to 0 in order to store the next cluster's
    % RGB values
    position = 0;
    
end
end


