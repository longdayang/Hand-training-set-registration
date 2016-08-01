function [pointsx,pointsy]=ICP(vo,v)
% load('RegistParamTest2.mat');
% J=zeros(256);
% image(J);
% hold on
% [x,y]=conresample(xc,yc,nsample,J);
% x=x+randn(size(x),'like',x);
% y=y+randn(size(y),'like',y);
% plot(x,y,'r.');
% v=[x';y'];
n1=length(vo);
n2=length(v);
x_centroid=128;
y_centroid=128;
center1=repmat([x_centroid;y_centroid],1,n1);
center2=repmat([x_centroid;y_centroid],1,n2);
% Rot1=[cos(theta),-sin(theta);sin(theta),cos(theta)];
% T=repmat([shiftx;shifty],1,n);
% s=v-center;
% so=Rot1*s;
% vo=so+center;
% vo=vo+T;
% x_rotated=vo(1,:);
% y_rotated=vo(2,:);
% plot(x_rotated,y_rotated,'b.');
org_points=v;
points=vo;
[r,c]=size(points);
 mean_org=sum(org_points,2)/c;
 de_mean_org=org_points-center2;
 de_mean_org=de_mean_org(1:2,:);
 mean_org=mean_org(1:2,:);
 ns=createns(de_mean_org','nsmethod','kdtree'); 
 for i=1:100
     [r,c]=size(points);
     mean_obj=sum(points,2)/c;
     de_mean_obj=points-center1;
     mean_obj=mean_obj(1:2,:);
     de_mean_obj=de_mean_obj(1:2,:);
     [idx,dist]=knnsearch(ns,de_mean_obj','k',1);
     N=de_mean_obj*de_mean_org(:,idx)';
     [U,~,V] = svd(N);
     R = V*transpose(U);
     T=mean_org-R*mean_obj;
     T=repmat(T,1,c);
     points=R*points+T;
     pointsx=points(1,:);
     pointsy=points(2,:);
%      hold on
%      plot(pointsx,pointsy,'r-');
%      pause(0.1);
 end

end
% hold on
% plot(x,y,'b-');
% plot(pointsx,pointsy,'r.');
% hold off
    
