function keypoints = isskeys(patch,cloud)


%her nokta etrafindeki noktalara kıyasla en yüksek metriğe sahip ise
%keypoint olabilir.

z = 1; 

co = 5;
for i=1:size(patch,2)
metricThresh1 = max(patch{i}(:,co));

k = size(patch{i},1);

   if cloud(i,5)== metricThresh1
       includeID(z,:) = cloud(i,:);
            z= z+1;
   end
    
end
keypoints = includeID;




