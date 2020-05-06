function patch4=pointaround(pointCloud,cloud,radius)

radius=radius;

k=1;
    
    limX = [pointCloud(1,1)-radius, pointCloud(1,1)+radius];
    limY = [pointCloud(1,2)-radius, pointCloud(1,2)+radius];
    limZ = [pointCloud(1,3)-radius, pointCloud(1,3)+radius];

    for i=1:size(cloud,1)

    if cloud(i,1)>=limX(1,1)&& cloud(i,1)<=limX(1,2)
    if cloud(i,2)>=limY(1,1)&& cloud(i,2)<=limY(1,2)
    if cloud(i,3)>=limZ(1,1)&& cloud(i,3)<=limZ(1,2)  
         patch4(k,:)= cloud(i,:);
         k=k+1;
         
        
        
    end
    end
    end
    
end
end

