function [px,py]=points_gen(I)
I4=imread('hand4.tif');
figure,
imshow(I4);
nsample=100;
hold on
x4 = [];
y4 = [];
n =0;
but = 1;
while but == 1
      [s, t, but] = ginput(1);
      n = n + 1;
      x4(n,1) = s;
      y4(n,1) = t;
      plot(x4, y4, 'ro');
end
hold off
m=length(x4);
sx4=x4(1:m-1,:);
sy4=y4(1:m-1,:);
% k=size(x10);
% N=length(x10);
% [sx10,sy10]=conresample(x10,y10,nsample,I10);
% plot(sx10,sy10,'r*');
% plot(sx10,sy10,'b-');
save('sx4.mat','sx4');
save('sy4.mat','sy4');
end