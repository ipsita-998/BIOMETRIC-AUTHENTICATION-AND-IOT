function [m, A, Eigenfaces] = Eigenfacepca(T)
% Use Principle Component Analysis (PCA) to determine the most 
% discriminating features between images of faces.
%
% Description: This function gets a 2D matrix, containing all training image vectors
% and returns 3 outputs which are extracted from training database.
%
% Argument:      T                      - A 2D matrix, containing all 1D image vectors.
%                                         Suppose all P images in the training database 
%                                         have the same size of MxN. So the length of 1D 
%                                         column vectors is M*N and 'T' will be a MNxP 2D matrix.
% 
% Returns:       m                      - (M*Nx1) Mean of the training database
%                Eigenfaces             - (M*Nx(P-1)) Eigen vectors of the covariance matrix of the training database
%                A                      - (M*NxP)  mean subtracted image also known as the centered image
%       
%              

%%%%%%%%%%%%%%%%%%%%%%%% Calculating the mean image 
m = mean(T,2); % Computing the average face image m = (1/P)*sum(Tj's)    (j = 1 : P) column vector containing the mean of each row
Train_Number = size(T,2);% find the size of the second dimension 
display(Train_Number);
%%%%%%%%%%%%%%%%%%%%%%%% Calculating the mean subtraction from the database image
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m; % Computing the difference image for each image in the training set Ai = Ti - m
    A = [A temp]; % Merging all centered images
    display(i);
end

%%%%%%%%%%%%%%%%%%%%%%%% Snapshot method of Eigenface methos
% We know from linear algebra theory that for a PxQ matrix, the maximum
% number of non-zero eigenvalues that the matrix can have is min(P-1,Q-1).
% Since the number of training images (P) is usually less than the number
% of pixels (M*N), the most non-zero eigenvalues that can be found are equal
% to P-1. So we can calculate eigenvalues of A'*A (a PxP matrix) instead of
% A*A' (a M*NxM*N matrix). It is clear that the dimensions of A*A' is much
% larger that A'*A. So the dimensionality will decrease.

L = A'*A; % L is the surrogate of covariance matrix C=A*A' with less dimensions.
[V D] = eig(L); % Diagonal elements of D are the eigenvalues for both L=A'*A and C=A*A'and V is the right eigen vector of the matrix L(20*20) A*V=V*D.
%A*V is the eigenfaces matrix
%%%%%%%%%%%%%%%%%%%%%%%% Sorting and eliminating eigenvalues
% All eigenvalues of covariance matrix L are sorted and those who are less than a
% specified threshold, are eliminated. So the number of non-zero
% eigenvectors may be less than (P-1).

L_eig_vec = [];
for i = 1 : size(V,2) 
%     if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
%     end
end

%%%%%%%%%%%%%%%%%%%%%%%% Calculating the eigenvectors of covariance matrix 'C'
% Eigenvectors of covariance matrix C (or so-called "Eigenfaces")
Eigenfaces = A * L_eig_vec; % A: centered image vectors

display(size(Eigenfaces));
