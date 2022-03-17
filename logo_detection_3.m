I= imread('Testcase3.jpg');
G= rgb2gray(I);
BW = im2bw(G,0.5);
BWM=medfilt2(BW,[2,2]);
se = strel('square', 2);
BW2 = imdilate(BWM,se);
two_Largest_O= bwareafilt( BW2,6);
three_Largest_O= bwareafilt( BW2,7);
diff =three_Largest_O- two_Largest_O;
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
 [Mark]=Classification_3(qr);