function [Euc_dist, OutputName,ri] = Recognition(TestImage, m, A, Eigenfaces)
% Recognizing step....
%
% Description: This function compares two faces by projecting the images into facespace and 
% measuring the Euclidean distance between them.
%
% Argument:      TestImage              - Path of the input test image
%
%                m                      - (M*Nx1) Mean of the training
%                                         database, which is output of 'Eigenfacepca' function.
%
%                Eigenfaces             - (M*Nx(P-1)) Eigen vectors of the
%                                         covariance matrix of the training
%                                         database, which is output of 'Eigenfacepca' function.
%
%                A                      - (M*NxP) Matrix of centered image
%                                         vectors, which is output of 'Eigenfacepca' function.
% 
% Returns:       OutputName             - Name of the recognized image in the training database.
%             

%%%%%%%%%%%%%%%%%%%%%%%% Projecting centered image(mean subtracted image) vectors into facespace
% All centered images are projected into facespace by multiplying in
% Eigenface basis's. Projected vector of each face will be its corresponding
% feature vector.

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
display(Train_Number);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i);  % finding the weight of each face in the train set
    ProjectedImages = [ProjectedImages temp];% the matrix of weight vector of each image in the training set
end

% Extracting the PCA features from test image
InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(I nImage)-m; % subtracting the mean ,Centered test image
ProjectedTestImage = Eigenfaces'*Difference; % Test image weight vector
display(ProjectedTestImage)
%%%%%%%%%%%%%%%%%%%%%%%% Calculating Euclidean distances 
% Euclidean distances between the projected test image and the projection
% of all centered training images are calculated. Test image is
% supposed to have minimum distance with its corresponding image in the
% training database.

Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end
% display (Euc_dist);
[Euc_dist_min , Recognized_index] = min(Euc_dist);% recognised_index is the index value of the min euclidean distance 
OutputName = strcat(int2str(Recognized_index),'.bmp');
ri=Recognized_index;
% OutputName = strcat(int2str(Recognized_index),'.jpg');