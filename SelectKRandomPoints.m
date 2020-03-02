function [points] = SelectKRandomPoints(ImageArray,k)
% SelectKRandomPoints produces a list of k randomly selected unique pixels
% (points) from an image
% Inputs:  ImageArray = a 3D image array from which the points will be
%                       selected
%          k          = the number of unique points to be randomly selected
% Outputs: points     = a 2D array with k rows and 2 columns which stores
%                       the positions of the generated points
% Author: Sreeniketh Raghavan

% Finding the number of rows, columns and layers that are present in
% the image array
ImageArrayDimentions = size(ImageArray);

% Preallocating a 2D array of zeros for our output 'points' which will make
% it easier to store data later
points = zeros(k,2);

for i = 1:k % to generate a point k times
    
    % the row number of each point will randomly be chosen between 1
    % and total number of rows in the image array
    RandRow = randi([1 ImageArrayDimentions(1)],1,1);
    % the column number of each point will randomly be chosen between 1
    % and total number of columns in the image array
    RandCol = randi([1 ImageArrayDimentions(2)],1,1);
    
    % the randomly generated row and column number of the points will
    % be stored in the points array for each iteration of the for loop
    points(i,1) = RandRow;
    points(i,2) = RandCol;
    
end

% ensuring only unique points are stored and any duplicates are deleted
points = unique(points,'rows');

% the number of rows (unique points) in the 'points' array will be less
% than k if any duplicate points were deleted in the previous step

while size(points,1) < k % to generate new points if any duplicates were deleted
    
    % to generate new points after the existing points in the array till we
    % have k points in total
    for j = (size(points,1)+1):k
        
        % the row number of each point will randomly be chosen between 1
        % and total number of rows in the image array
        RandRow = randi([1 ImageArrayDimentions(1)],1,1);
        % the column number of each point will randomly be chosen between 1
        % and total number of columns in the image array
        RandCol = randi([1 ImageArrayDimentions(2)],1,1);
        
        % the randomly generated row and column number of the points will
        % be stored in the points array for each iteration of the for loop
        points(j,1) = RandRow;
        points(j,2) = RandCol;
        
    end
    
    % deleting any duplicate points and sorting the points by row and
    % column numbers
    points = unique(points,'rows');
    
end

end
