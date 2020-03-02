function [clusters] = AssignToClusters(ImageArray, Means)
% AssignToClusters assigns each pixel (point) in the image to a cluster
% based on which cluster mean it is closest to (in terms of distance)
% Inputs:  ImageArray = a 3D array (m rows, n columns, 3 layers)
%                       representing a RGB coloured image
%          Means      = a 3D array (k rows, 1 column, 3 layers) containing
%                       the RGB colour data of the k means
% Outputs: clusters   = a 2D array (m rows, n columns) containing the
%                       cluster number assigned to each of the pixels in
%                       the image
% Author: Sreeniketh Raghavan

% k is the number of means that are present in the Means array
SizeOfMeans = size(Means);
k = SizeOfMeans(1);

% m is the number of rows and n is the number of columns in the image
SizeOfImageArray = size(ImageArray);
m = SizeOfImageArray(1);
n = SizeOfImageArray(2);

% Preallocating a 2D array of zeros for our output 'clusters' which will
% make it easier to store data later
clusters = zeros(m,n);

for i = 1:m % looping through rows
    for j = 1:n % looping through columns
        
        % storing RGB data of the point in a 1D array as [r,g,b]
        Point = [ImageArray(i,j,1), ImageArray(i,j,2), ImageArray(i,j,3)];
        
        for p = 1:k % loops through each of the k means
            
            % storing the squared distance between the point and each of the means in a 1D array
            squaredDistance(p) = SquaredDistance(Point,[Means(p,1,1),Means(p,1,2),Means(p,1,3)]);
            
        end
        
        % finding the value and the position of the least squared distance
        % in the squaredDistance array
        [Value,Index] = min(squaredDistance);
        % the Index (position) of the least squared distance in the array
        % is the same as which mean that point is the closest to and hence,
        % the point is assigned this mean number as its cluster number
        clusters(i,j) = Index;
        
    end
end
end



