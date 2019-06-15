%clear all
clc
close all

% assign the directory paths   uigetdir

TrainDatabasePath = uigetdir('C:\Users\ishitas\Documents\MATLAB\Face Database part1-train');%ENTER                          %THE PATH OF THE TRAIN DATABASE


% Create database in vector form
% Reshapes all 2D images of the training database into 1D column vector

T = Databasecr(TrainDatabasePath);%converts 2-d image to vector
 figure,imshow(T);
 title('Vector database')

 %% Finding mean subtraction, standard deviation%%%   
% [m, A] = EigenfaceCore(T);

[m, A, Eigenfaces] = Eigenfacepca(T);%eigenfaces is the matrix containg all the eigennfaces in the real dimensions
 figure,imshow(Eigenfaces);
 title('Trained feature');


[FileName,PathName] = uigetfile('*.bmp','Select the image file');
TestImage = [PathName FileName];
im = imread(TestImage);
mu=mean2(im);
meansub=im-mu;%subtracting the mean
 figure,imshow(meansub);
 title('mean subtracted image')



[Euc_dist,OutputName,ri] = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

figure,subplot(1 ,2,1),imshow(im)
title('Test Image');
subplot(1,2,2),imshow(SelectedImage);
title('Matched Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
% to identify the person
a=1;
b=5;
    for i=1:10
        if(a<=ri&&ri<=b)
            fv=i;
          
            break
        end
      a=b+1;
      b=b+5;
    
    end
thingSpeakURL = 'http://api.thingspeak.com/';
thingSpeakWriteURL = [thingSpeakURL 'update'];
writeApiKey = '2KT08OCT65BOFJOC'; %enter you api channel key
fieldName = 'field1'; % update your field name 
fieldValue = strcat('person',int2str(i));
response = webwrite(thingSpeakWriteURL,'api_key',writeApiKey,fieldName,fieldValue)
% read from thing speak
channelID = num2str(574431); 
thingSpeakReadURL = [thingSpeakURL 'channels/' channelID '/fields/' fieldName '/last'];
data = webread(thingSpeakReadURL,'api_key',writeApiKey) 



