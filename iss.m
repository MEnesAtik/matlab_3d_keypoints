function keypoints=iss(pointcloud,radius)

for i=1:size(pointcloud,1)              
    patch{i}=pointaround_iss(pointcloud(i,:),pointcloud,radius);
end

for j= 1:size(patch,2)
    weight(j)=1/size(patch{j},1);
    patch{j}(:,4)=weight(j);
end

pointcloud(:,4)=weight;

bb=1;
for i=1:size(pointcloud,1)
    sum=0;
    wj=0;
    for k=1:size(patch{i},1)
      sum=sum+(patch{i}(k,4)*((transpose(patch{i}(k,1:3)-pointcloud(i,1:3)))*(patch{i}(k,1:3)-pointcloud(i,1:3))));
      wj=wj+patch{i}(k,4);
    end
    ww=wj-pointcloud(i,4);
    cov{i}=sum/ww;
    
    if any(cov{i})==0
    cov{i}=[];

else 
    pointcloud_new(bb,:)=pointcloud(i,:);
    bb=bb+1;
end
   
end


cov_new=cov(~cellfun('isempty',cov));

 
 for h=1:size(cov_new,2)
eigenvalues{h}= eig(cov_new{h});
 end
sira = cellfun(@sort,eigenvalues,'un',0); %sýralama



 for e=1:size(sira,2)
     pointcloud_new(e,5)=sira{e}(1);
     pointcloud_new(e,6)=sira{e}(2);
     pointcloud_new(e,7)=sira{e}(3);
 end
     

 
 Th12 =0.975;
 Th23 =0.975;
     gg=1;
for t=1:size(pointcloud_new,1)
    a= pointcloud_new(t,6)/pointcloud_new(t,7);
    b= pointcloud_new(t,5)/pointcloud_new(t,6);
if a<Th12 &&  b<Th23
    remainpoints(gg,:)= pointcloud_new(t,:);
    gg=gg+1;
    
end

end
     
 for z=1:size(remainpoints,1)
    patch2{z}=pointaround_iss(remainpoints(z,1:3),remainpoints,radius);
    
 end

 keypoints = isskeys(patch2,remainpoints);
 keypoints=keypoints(:,1:3);
 

end

