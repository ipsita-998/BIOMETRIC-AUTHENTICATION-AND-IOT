function T = Databasecr(TrainDatabasePath)
% Align a set of face images (the training set T1, T2, ... , TM )
%
% Description: This function reshapes all 2D images of the training database
% into 1D column vectors. Then, it puts these 1D column vectors in a row to 
% construct 2D matrix 'T'.
%  
% 
% Argument:     TrainDatabasePath      - Path of the training database
%
% Returns:      T                      - A 2D matrix, containing all 1D image vectors.
%                                        Suppose all P images in the training database 
%                                        have the same size of MxN. So the length of 1D 
%                
TrainFiles = dir(TrainDatabasePath);%dir name lists the files and folders that match the string name. When name is a folder, dir lists the contents of the folder. Specify name using absolute or relative path names. You can use wildcards (*).
Train_Number = 0;

for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end
% display(Train_Number);
%%%%%%%%%%%%%%%%%%%%%%%% Construction of 1D image vectors
T = [];
for i = 1 : Train_Number
    
    % I have chosen the name of each image in databases as a corresponding
    % number. However, it is not mandatory!
    str = int2str(i);
%     str = strcat('\',str,'.jpg');
    str = strcat('\',str,'.bmp');
    str = strcat(TrainDatabasePath,str);
    display (str);
    img1 = imread(str);
%     figure,imshow(img);
%     title('input RGB image');
    img = rgb2gray(img1);
%     figure,imshow(img);
%     title('grayscale image');
% figure,subplot(1,2,1),imshow(img1)
% title('input RGB image');
% subplot(1,2,2),imshow(img);
% title('Equivalent Image');
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    T = [T temp]; % 'T' grows after each turn                    
end