close all;
clear all;
%system('sh capscreen.sh')
img = (imread('screen.png'));
img_origin = img;


img_hsv=rgb2hsv(img);
%imshow(img_hsv(:,:,1))

offset = 2;

i = offset;
j = offset;
p1_hsv = [img_hsv(i,j,1), img_hsv(i,j,2), img_hsv(i,j,3)];

%i = size(img_hsv,1) - offset;
%j = offset;
i = offset;
j = offset;
p2_hsv = [img_hsv(i,j,1), img_hsv(i,j,2), img_hsv(i,j,3)];

i = offset;
j = size(img_hsv,2) - offset;
p3_hsv = [img_hsv(i,j,1), img_hsv(i,j,2), img_hsv(i,j,3)];

%i = size(img_hsv,1) - offset;
%j = size(img_hsv,2) - offset;
i = offset;
j = offset;
p4_hsv = [img_hsv(i,j,1), img_hsv(i,j,2), img_hsv(i,j,3)];

h_vec = [p1_hsv(1), p2_hsv(1), p3_hsv(1), p4_hsv(1)];
s_vec = [p1_hsv(2), p2_hsv(2), p3_hsv(2), p4_hsv(2)];
v_vec = [p1_hsv(3), p2_hsv(3), p3_hsv(3), p4_hsv(3)];

h_var = var(h_vec);

h_min = min(h_vec);
h_max = max(h_vec);
h = mean(h_vec);

s_min = min(s_vec);
s_max = max(s_vec);
s = mean(s_vec);

v_min = min(v_vec);
v_max = max(v_vec);
v = mean(v_vec);

img_d = double(img_hsv);
img_d(:,:,1) = img_d(:,:,1) - ones(size(img_d,1),size(img_d,2))*h;
img_d(:,:,2) = img_d(:,:,2) - ones(size(img_d,1),size(img_d,2))*s;
img_d(:,:,3) = img_d(:,:,3) - ones(size(img_d,1),size(img_d,2))*v;

close
img_d1 = abs(img_d(:,:,1));
img_d1(img_d1<0.2) = 0;
imshow(img_d1,[]);


close
img_d3 = abs(img_d(:,:,3));
img_d3(img_d3<0.15) = 0;
imshow(img_d3,[]);

img_dd = img_d1+img_d2+img_d3;
%cut edge
img_dd(1:200,:) = 0;

imshow(img_dd,[])