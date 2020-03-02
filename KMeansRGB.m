function [clusters,means] = KMeansRGB(ImageArray,SeedMean,MaxIterations)
% KMeansRGB divides the points in an image into k clusters, using the
% k-means algorithm, in order to reduce the number of colours used to
% recreate the image
% Inputs:  ImageArray    = a 3D array (m rows, n columns, 3 layers)
%                          representing a RGB coloured image
%          SeedMean      = a 3D array (k rows, 1 column, 3 layers) which
%                          contains the RGB values for each of the
%                          initially assigned k means
%          MaxIterations = the maximum number of iterations to perform
%                          before stopping
% Outputs: clusters      = a 2D array (m rows, n columns) containing the
%                          cluster number assigned to each of the pixels in
%                          the image based on which mean it is closest to
%          means         = a 3D array (k rows, 1 column, 3 layers) which
%                          contains the mean RGB colour values for each of
%                          the k clusters (the row number corresponds to
%                          the cluster number)
% Author: Sreeniketh Raghavan

% k is the number of clusters/means/colours we want to recreate the image
% with
SizeOfSeedMean = size(SeedMean);
k = SizeOfSeedMean(1);

% carrying out the assigning and the updating steps once as the variable
% name for the input of the AssignToClusters function changes from
% 'SeedMean'to 'means' after these 2 steps because AssignToClusters takes
% the output of UpdateMeans as its input
clusters = AssignToClusters(ImageArray,SeedMean);
means = UpdateMeans(ImageArray,k,clusters);
% to count the number of iterations after each loop is complete (it is
% starting at 1 as one iteration has already been carried out above)
Iterations = 1;

% Preallocating a zeros array to store the value of the array 'means'
% before an iteration to help compare it to the value of 'means' after the
% iteration has been performed in order to check whether convergence is
% is achieved or not
StoreMeanValue = zeros(SizeOfSeedMean);

% only if convergence is not achieved and the maximum number of
% iterations is not reached will the loop go into the next iteration
while (~isequal(StoreMeanValue,means)) && (Iterations < MaxIterations) == 1
    
    % storing the array 'means' before it changes value
    StoreMeanValue = means;
    
    % carrying out the assigning and updating of means steps once
    clusters = AssignToClusters(ImageArray,means);
    means = UpdateMeans(ImageArray,k,clusters);
    
    Iterations = Iterations + 1;
    
end

% The loop will stop when either convergence is achieved or the maximum
% number of iterations is reached. If its due to the latter then the
% message below is displayed.
if Iterations == MaxIterations
    disp('Maximum number of iterations reached before convergence was achieved.')
end

end


