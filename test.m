load sx1.mat;
load sx2.mat;
load sx3.mat;
load sx4.mat;
load sx5.mat;
load sx6.mat;
load sx7.mat;
load sx8.mat;
load sx9.mat;
load sx10.mat;
load sy1.mat;
load sy2.mat;
load sy3.mat;
load sy4.mat;
load sy5.mat;
load sy6.mat;
load sy7.mat;
load sy8.mat;
load sy9.mat;
load sy10.mat;
%load TestActiveShape_2016.mat;

s1=[sx1,sy1];
s2=[sx2,sy2];
s3=[sx3,sy3];
s4=[sx4,sy4];
s5=[sx5,sy5];
s6=[sx6,sy6];
s7=[sx7,sy7];
s8=[sx8,sy8];
s9=[sx9,sy9];
s10=[sx10,sy10];

%{
 [R2,T2,data2] = icp3(s1,s2);
 [R3,T3,data3] = icp3(s1,s3);
 [R4,T4,data4] = icp3(s1,s4);
 [R5,T5,data5] = icp3(s1,s5);
 [R6,T6,data6] = icp3(s1,s6);
 [R7,T7,data7] = icp3(s1,s7);
 [R8,T8,data8] = icp3(s1,s8);
 [R9,T9,data9] = icp3(s1,s9);
 [R10,T10,data10] = icp3(s1,s10);
data1=s1';
 Average=(data1+data2+data3+data4+data5+data6+data7+data8+data9+data10)/10;

 for n=1:100
     %Average=Average';
 [R1,T1,data1] = icp3(Average',data1');
 [R2,T2,data2] = icp3(Average',data2');
 [R3,T3,data3] = icp3(Average',data3');
 [R4,T4,data4] = icp3(Average',data4');
 [R5,T5,data5] = icp3(Average',data5');
 [R6,T6,data6] = icp3(Average',data6');
 [R7,T7,data7] = icp3(Average',data7');
 [R8,T8,data8] = icp3(Average',data8');
 [R9,T9,data9] = icp3(Average',data9');
 [R10,T10,data10] = icp3(Average',data10');
  Average=(data1+data2+data3+data4+data5+data6+data7+data8+data9+data10)/10;

 end
%}
s1=s1';
s2=s2';
s3=s3';
s4=s4';
s5=s5';
s6=s6';
s7=s7';
s8=s8';
s9=s9';
s10=s10';

[new_x2,new_y2]=ICP(s2,s1);
[new_x3,new_y3]=ICP(s3,s1);
[new_x4,new_y4]=ICP(s4,s1);
[new_x5,new_y5]=ICP(s5,s1);
[new_x6,new_y6]=ICP(s6,s1);
[new_x7,new_y7]=ICP(s7,s1);
[new_x8,new_y8]=ICP(s8,s1);
[new_x9,new_y9]=ICP(s9,s1);
[new_x10,new_y10]=ICP(s10,s1);
average_x=(sx1'+new_x2+new_x3+new_x4+new_x5+new_x6+new_x7+new_x8+new_x9+new_x10)/10;
average_y=(sy1'+new_y2+new_y3+new_y4+new_y5+new_y6+new_y7+new_y8+new_y9+new_y10)/10;

average=[average_x;average_y];
new_x1=sx1';
new_y1=sy1';


for n=1:20
 s1=[new_x1;new_y1];
s2=[new_x2;new_y2];
s3=[new_x3;new_y3];
s4=[new_x4;new_y4];
s5=[new_x5;new_y5];
s6=[new_x6;new_y6];
s7=[new_x7;new_y7];
s8=[new_x8;new_y8];
s9=[new_x9;new_y9];
s10=[new_x10;new_y10];

[new_x1,new_y1]=ICP(s1,average);
[new_x2,new_y2]=ICP(s2,average);
[new_x3,new_y3]=ICP(s3,average);
[new_x4,new_y4]=ICP(s4,average);
[new_x5,new_y5]=ICP(s5,average);
[new_x6,new_y6]=ICP(s6,average);
[new_x7,new_y7]=ICP(s7,average);
[new_x8,new_y8]=ICP(s8,average);
[new_x9,new_y9]=ICP(s9,average);
[new_x10,new_y10]=ICP(s10,average);
average_x=(new_x1+new_x2+new_x3+new_x4+new_x5+new_x6+new_x7+new_x8+new_x9+new_x10)/10;
average_y=(new_y1+new_y2+new_y3+new_y4+new_y5+new_y6+new_y7+new_y8+new_y9+new_y10)/10;

average=[average_x;average_y];

end



 figure,
 subplot(2,2,1);
hold on
plot(sx1,sy1,'b*-');
plot(sx2,sy2,'b*-');
plot(sx3,sy3,'b*-');
plot(sx4,sy4,'b*-');
plot(sx5,sy5,'b*-');
plot(sx6,sy6,'b*-');
plot(sx7,sy7,'b*-');
plot(sx8,sy8,'b*-');
plot(sx9,sy9,'b*-');
plot(sx10,sy10,'b*-');
hold off

subplot(2,2,2);
hold on
plot(new_x1,new_y1,'b*-');
plot(new_x2,new_y2,'b*-');
plot(new_x3,new_y3,'b*-');
plot(new_x4,new_y4,'b*-');
plot(new_x5,new_y5,'b*-');
plot(new_x6,new_y6,'b*-');
plot(new_x7,new_y7,'b*-');
plot(new_x8,new_y8,'b*-');
plot(new_x9,new_y9,'b*-');
plot(new_x10,new_y10,'b*-');

subplot(2,2,3);
plot(average_x,average_y,'b*-');

[m,n]=size(new_x1);

a=1;
for i=1:2:2*n
coord_1(i)=new_x1(a);
coord_2(i)=new_x2(a);
coord_3(i)=new_x3(a);
coord_4(i)=new_x4(a);
coord_5(i)=new_x5(a);
coord_6(i)=new_x6(a);
coord_7(i)=new_x7(a);
coord_8(i)=new_x8(a);
coord_9(i)=new_x9(a);
coord_10(i)=new_x10(a);
mean(i)=average_x(a);
a=a+1;
end

a=1
for i=2:2:2*n
coord_1(i)=new_y1(a);
coord_2(i)=new_y2(a);
coord_3(i)=new_y3(a);
coord_4(i)=new_y4(a);
coord_5(i)=new_y5(a);
coord_6(i)=new_y6(a);
coord_7(i)=new_y7(a);
coord_8(i)=new_y8(a);
coord_9(i)=new_y9(a);
coord_10(i)=new_y10(a);
mean(i)=average_y(a);
a=a+1;
end

Cov=((coord_1-mean)'*(coord_1-mean)+(coord_2-mean)'*(coord_2-mean)+(coord_3-mean)'*(coord_3-mean)+(coord_4-mean)'*(coord_4-mean)+(coord_5-mean)'*(coord_5-mean)+(coord_6-mean)'*(coord_6-mean)+(coord_7-mean)'*(coord_7-mean)+(coord_8-mean)'*(coord_8-mean)+(coord_9-mean)'*(coord_9-mean)+(coord_10-mean)'*(coord_10-mean))/10;

[V D]=eig(Cov);
[R C]=size(V);

eig1=V(:,C);
eig2=V(:,C-1);
eig3=V(:,C-2);
eig4=V(:,C-3);
figure,
for b=-100:10:100;
    Eig1=mean'+eig1*b;
      Eig2=mean'+eig2*b;
        Eig3=mean'+eig3*b;
          Eig4=mean'+eig4*b;
     a=1;
     for i=1:2:2*n
         Eig1_x(a)=Eig1(i);
         Eig2_x(a)=Eig2(i);
         Eig3_x(a)=Eig3(i);
         Eig4_x(a)=Eig4(i);
         a=a+1;
     end
     a=1;
       for i=2:2:2*n
         Eig1_y(a)=Eig1(i);
         Eig2_y(a)=Eig2(i);
         Eig3_y(a)=Eig3(i);
         Eig4_y(a)=Eig4(i);
         a=a+1;
     end


subplot(2,2,1);
plot(Eig1_x,Eig1_y,'b-');
pause(0.1);
subplot(2,2,2);
plot(Eig2_x,Eig2_y,'b-');
pause(0.1);
subplot(2,2,3);
plot(Eig3_x,Eig3_y,'b-');
pause(0.1);

subplot(2,2,4);
plot(Eig4_x,Eig4_y,'b-');
pause(0.1);

end

xy_x=xy(:,1)';
xy_y=xy(:,2)';


figure,
hold on
subplot(2,2,1);
hold on
plot(average_x,average_y,'r-');
plot(xy_x,xy_y,'g*');
xy=xy';
mean=mean';
for iter=1:20
    [R T xc]=icp3(xy,average);
    T1=repmat(T,1,length(xy));
    T2=repmat(T,1,length(xc));
    xcm1=xy-T1;
    xcm1=pinv(R)*xcm1;
    ns=createns(xcm1','nsmethod','kdtree');
    [idx,dist]=knnsearch(ns,average','k',1);
    xcm=xcm1(:,idx);
    Eig=[eig1,eig2,eig3,eig4];
    
    xcm_x=xcm(1,:);
    xcm_y=xcm(2,:);
    xcm_new=zeros(2*length(xcm),1);
   a=1;
  for i=1:2:2*length(xcm)
      xcm_new(i)=xcm_x(a);
      a=a+1;
  end
   a=1;
  for i=2:2:2*length(xcm)
      xcm_new(i)=xcm_y(a);
      a=a+1;
  end
  coeff=Eig'*(xcm_new-mean);
  xc_newt=mean+Eig*coeff;
  a=1;
 for i=1:2:length(xc_newt)
      xc_newx(a)=xc_newt(i);
      a=a+1;
 end
   a=1;
 for i=2:2:length(xc_newt)
      xc_newy(a)=xc_newt(i);
      a=a+1;
 end
xc_new21=[xc_newx;xc_newy];
xc_new2=R*xc_new21+T2;
if iter==1
    subplot(2,2,2);
    hold on
    plot(xy_x,xy_y,'g*');
    plot(xc_new2(1,:),xc_new2(2,:),'b-');
end
average=xc_new21;
mean=xc_newt;
end
subplot(2,2,3);
hold on
plot(xy_x,xy_y,'g*');
plot(xc_new2(1,:),xc_new2(2,:),'b-');
hold off
