function H = homat(p1, p2)
% Simplest Calculation of Homography Matrix using SVD
% Hazoor Ahmad 
% PhD Electrical Engineering
% Information technology University
% Lahore, Pakistan
% It is the simplest implementation of Homography in Matlab using SVD.
% Usage: 
% 1. Input p1 = Provide 4 or more source (image) points.
% 2. Input p2 = Provide 4 or more destination (image) points.
if nargin ~= 2
    error('You Must provide two point sets from same or different image');
elseif length(p1)~= length(p2)
    error('Number of poits in each point set must be same');
elseif length(p1) < 4
    error('There must larger than 4 points in each point set');
elseif width(p1) ~= 2
    error('There must be 2D points in each point set');
end
% Solve equations using SVD
col_1_3 = zeros(2*length(p1),3);
col_4_6 = zeros(2*length(p1),3);
col_7_9 = zeros(2*length(p1),3);
col_1_3(2:2:2*length(p1),:) = [p1(:,1) p1(:,2) ones(size(p1(:,1)))];
col_4_6(1:2:2*length(p1),:) = -[p1(:,1) p1(:,2) ones(size(p1(:,1)))];
col_7_9(1:2:2*length(p1),:) = [p2(:,2).*p1(:,1) p2(:,2).*p1(:,2) p2(:,2).*ones(size(p1(:,1)))];
col_7_9(2:2:2*length(p1),:) = -[p2(:,1).*p1(:,1) p2(:,1).*p1(:,2) p2(:,1).*ones(size(p1(:,1)))];
A = [col_1_3 col_4_6 col_7_9];
if length(p1) == 4
    [~, ~, V] = svd(A);
else
    [~, ~, V] = svd(A, 'econ');
end
phi = V(:,9);
H = reshape(phi, 3, 3);
H = H'/H(9);
end

