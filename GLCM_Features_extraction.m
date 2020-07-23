clc; 
clear all; 
close all;

% texture analysis using GLCM and then feature extraction

% folder in which your images exists
location = ('C:\Users\Dell\Desktop\ip_project\images\seg_beforeflood.PNG');

% describing the data and specifying how to read the data from the datastore. 
ds = imageDatastore(location);

% quantifying spatial intensity using one of the parameter of GLCM 
offsets = [0 1; -1 1;-1 0;-1 -1];
 
% defining the empty matrix 
G=[];

% hasdata returns 1 if there is data available to read from the datastore specified by ds . 
while(hasdata(ds))

% read image from datastore 
i = read(ds) ;

% storing the dimensions of our image
[rows, columns, numberOfColorChannels] = size(i);

% checking no of planes in image 
if(numberOfColorChannels)> 1

% Convert it to gray scale by taking only the one channel. 
i = i(:, :, 2);
end


glcm1 = graycomatrix(i,'numlevels',16,'offset',[0 1])

% extracting features using the 2nd order statistical functions like
% dissimilarity,entropyetc is used 
[out] = GLCM_Features1(glcm1);

A=[out.autocout.controut.corrmout.corrpout.cpromout.cshadout.dissiout.energout.entroout.homomout.homopout.maxprout.s osvhout.savghout.svarhout.senthout.dvarhout.denth out.inf1h out.inf2h out.indncout.idmnc];

glcm2 = graycomatrix(i,'numlevels',16,'offset',[-1,1]);

% extracting features using the 2nd order statistical functions like
% dissimilarity,entropyetc is used 
[out1] = GLCM_Features1(glcm2);
B=[out1.autoc out1.contr out1.corrm out1.corrp out1.cprom out1.cshad out1.dissi out1.energ out1.entro out1.homom out1.homop out1.maxpr out1.sosvh out1.savgh out1.svarh out1.senth out1.dvarh out1.denth out1.inf1h out1.inf2h out1.indnc out1.idmnc];

glcm3 = graycomatrix(i,'numlevels',16,'offset',[-1,0]);
% extracting features using the 2nd order statistical functions like
% dissimilarity,entropyetc is used 
[out2] = GLCM_Features1(glcm3);
C=[out2.autoc out2.contr out2.corrm out2.corrp out2.cprom out2.cshad out2.dissi out2.energ out2.entro out2.homom out2.homop out2.maxpr out2.sosvh out2.savgh out2.svarh out2.senth out2.dvarh out2.denth out2.inf1h out2.inf2h out2.indnc out2.idmnc];

glcm4= graycomatrix(i,'numlevels',16,'offset',[-1,0]);
% extracting features using the 2nd order statistical functions like
% dissimilarity,entropyetc is used 
[out3] = GLCM_Features1(glcm4);
D=[out3.autoc out3.contr out3.corrm out3.corrp out3.cprom out3.cshad out3.dissi out3.energ out3.entro out3.homom out3.homop out3.maxpr out3.sosvh out3.savgh out3.svarh out3.senth out3.dvarh out3.denth out3.inf1h out3.inf2h out3.indnc out3.idmnc];
M=[ A ,B,C,D];

% the final matrix formed 
G=[G;M];


end

 
 
 
 
 