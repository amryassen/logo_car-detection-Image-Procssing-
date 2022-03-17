function [Mark]=Classification_1(image)
% calculate features of new image
% I=imread(image);
Gimg =rgb2gray(image);
New_Image_features = extractLBP+ Features(Gimg,'Upright' ,false);
[Features] = Feature_Extraction_1();
% calculate the euclidean distance between features of new image and features' dataset
car_mark = ["opel","kia","Hyundai","Hyundai"];
EDistance= zeros(1,4);
   for i = 1 :4
       sum =0;
       for j = 1 : 10
           d = (New_Image_features(j)- Features(i,j))^2;
           sum = sum + d;      
       end
       EDistance(i) = sqrt(sum);
   end
   [~,col] = min(EDistance);
   Mark= car_mark{1,col};  
   display (Mark);
end