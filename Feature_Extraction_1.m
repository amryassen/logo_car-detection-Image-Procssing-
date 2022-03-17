function [Features] = Feature_Extraction_1()
Features=zeros(4,10);
I=imread('logo1.jpg');
I=rgb2gray(I);
feature1=extractLBPFeatures(I,'upright',false);
Features(1,:)=feature1;

I=imread('logo2.jpg');
I=rgb2gray(I);
feature1=extractLBPFeatures(I,'upright',false);
Features(2,:)=feature1;

I=imread('logo3.jpg');
I=rgb2gray(I);
feature1=extractLBPFeatures(I,'upright',false);
Features(3,:)=feature1;

I=imread('logo4.jpg');
I=rgb2gray(I);
feature1=extractLBPFeatures(I,'upright',false);
Features(4,:)=feature1;
end

