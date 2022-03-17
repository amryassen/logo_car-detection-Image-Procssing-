close all;
clear all;
I= imread('Testcase1.jpg');
G= rgb2gray(I);
BW = im2bw(G,0.3); 

BWM=medfilt2(BW,[2,2]);

se = strel('square', 1);
BW2 = imdilate(BWM,se);

two_Largest_O= bwareafilt( BWM,2);
three_Largest_O= bwareafilt( BWM,3);

diff =three_Largest_O- two_Largest_O;
figure; imshow(diff)
[L, num] = bwlabel(diff);
State =regionprops(L,'All');
qrimg=uint8(diff).*I;

figure; imshow(qrimg);
for i=1:num
    x=uint64(State(i).BoundingBox(1));
    y=uint64(State(i).BoundingBox(2));
    w=State(i).BoundingBox(3);
    h=State(i).BoundingBox(4);  
    qr=imcrop(qrimg,[x,y,w,h]);
    figure,imshow(qr),title('cropedimg');
end
[Mark]=Classification_1(qr);