# BIOMETRIC AUTHENTICATION AND IOT 

## INTRODUCTION

This project involves the implementation of identification of an individual by facial recognition 
using PCA technique and then sending an alert to the user in his/her respective twitter account. 
The tool used for implementing PCA technique is Matlab and  the IOT platform thingspeak 
was used for communicating the information to the user. 
NOTE : that this project doesn't support the real time feed from a video camera.
The dataset is split into training and testing set from, and the image of the person to be tested is taken from the 
testing database.

## DEPENDENCIES

- MATLAB
- THINGSPEAK ACCOUNT
- TWITTER ACCOUNT
- FACIAL DATABASE

## LINKS

### TO INSTALL MATLAB

-  https://in.mathworks.com/products/get-matlab.html?s_tid=gn_getml
### CREATING A THINGSPEAK ACCOUNT

- https://thingspeak.com
#### GETTING STARTED WITH THING SPEAK

Refer to the tutorials given in the following link which will help you :
 - Create your own channel
 - Generate api keys
 - Analyze the data collected
 -Act on your data using ThingTweet
 
 https://in.mathworks.com/help/thingspeak/getting-started-with-thingspeak.html
 
 ## CREATING THE FACIAL DATABASE
    
- Collect rgb facial images of atleast 10 persons.
- Each person must have atleast 7 images captured at different angles.
- Split the dataset into testing and training set.
    - The testing set must contain two images of each person.
    - The training set must contain the rest of the five images of the persons.
- Number the images of the testing and the training set serially .
- else you can use the following database
    - train set
    https://drive.google.com/file/d/0B95dRrWoLj1JeDNKVkVQV1VocEQ2QktUNS1VeTdRc1BiaUJB/view?usp=sharing
    - test set
     https://drive.google.com/file/d/0B95dRrWoLj1JRFNzYl9IdWhnS05XRDhUUmI1aHRCTEwteTdr/view?usp=sharing


## EXECUTION
- open all the code files present in the MATLAB folder in matlab environment.
- Set the correct path of the training and testing dataset 
- Enter the api key generated of the channel you created.
- Run the matlab file "main" and  select an image from the testing dataset.
