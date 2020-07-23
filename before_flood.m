% Read the pre flood image.
originalImage = imread('C:\Users\Dell\Desktop\ip_project\images\unflood1.jpg');

% Conversion of coloured (3D Image) to Black and White Image(2D image).
I = rgb2gray(originalImage);

% Conversion to double data type
db = uint16(I);

% Creating a Gaussian filter of size 3*3 and sigma = 2
smooth = fspecial('gaussian',[3,3],2);

% Applying that filter onto the image
filt = imfilter(db,smooth,'replicate');

% Increasing the contrast of the image
img1 = imadjust(filt);

% Increasing the contrast of the image using histogram equalisation of
% remaining part
img = histeq(img1);

% Calculating the threshold value
T = graythresh(img);

% Conversion of image in binary form based on the threshold value
S = im2bw(img,T);

% Taking the filter in frequency domain so as to see how filter was made
filtf=fft2(smooth);

% Resizing the filter to visualise it properly
filtf_1=imresize(filtf,[422,759]);

% Plotting of histogram to visualise no. of pixel points vs. intensity
% values.
figure(1);
imhist(I);
title('Histogram of the original image');

% Displaying the filter
figure(2);
imshow(filtf_1);
title('Gaussian Filter');

% Plotting the histogram of output of mask applied on the image
figure(3);
imhist(filt);
axis([-1*(10e4),7*(10e4),0*(10e4),3.5*(10e4)]);
title('Histogram of Gaussian filter applied on the original image');

% Displaying of the histogram of increased contrast image
figure(4);
imhist(img1);
title('Histogram of image after applying imadjust');

% Displaying of the histogram of increased contrast image
figure(5);
imhist(img);
title('Histogram of image after applying histogram equalisation');

% Displaying the results
figure(6);
imshow(I);
title('Original image');
figure(7);
imshow(img1);
title('Image after applying imadjust');
figure(8);
imshow(img);
title('Image after applying Histogram equalisation');
figure(9);
imshow(S);
title('Segmented image');