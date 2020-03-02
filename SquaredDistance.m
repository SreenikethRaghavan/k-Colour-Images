function [squaredDistance] = SquaredDistance(Point1,Point2)
% SquaredDistance calculates the square of the distance between two points
% in 3D space
% Inputs:  Point1          = a 1D array with 3 elements representing the
%                            first point in 3D space
%          Point2          = a 1D array with 3 elements representing the
%                            second point in 3D space
% Outputs: squaredDistance = the square of the distance between the two
%                            points calculated using the distance formula
% Author: Sreeniketh Raghavan

% The distance formula for calculating the distance between 2 points P(P1,P2,P3) and Q(Q1,Q2,Q3) is
% Distance = sqrt[(P1 - Q1)^2 + (P2 - Q2)^2 +(P3 - Q3)^2]
squaredDistance = (Point1(1) - Point2(1))^2 + (Point1(2) - Point2(2))^2  + (Point1(3) - Point2(3))^2 ;

end