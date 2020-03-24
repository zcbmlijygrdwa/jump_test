function target_loc = findTargetByColor(img)
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


img_d1 = abs(img_d(:,:,1));
img_d1(img_d1<0.15) = 0;
%imshow(img_d1,[]);

img_d2 = abs(img_d(:,:,2));
img_d2(img_d2<0.2) = 0;
%imshow(img_d2,[]);

img_d3 = abs(img_d(:,:,3));
img_d3(img_d3<0.15) = 0;
%imshow(img_d3,[]);

img_dd = img_d1+img_d2+img_d3;
%cut edge
img_dd(1:200,:) = 0;

%imshow(img_dd,[])


img = img_dd;


%find the up most pixel bright
isUpFound = false;
isrightFound = false;
max_right = 0;
for i = 1:size(img,1)
  if isUpFound
    break;
  end
  for j = 1:size(img,2)
    if(img_dd(i,j)>0)
      if ~isUpFound
        isUpFound = true
        upMost.row = i;
        upMost.col = j;
        break;
      end
    end
  end
end

%find the rightMost most pixel bright
rightEdge_prev = -1;
for i = upMost.row:size(img,1)
rightEdge = findRightEdge(i,upMost.col,img_dd);
if(rightEdge_prev<0)
rightEdge_prev = rightEdge;
else
  if(rightEdge_prev<rightEdge)
    rightEdge_prev = rightEdge;
  else
    rightMost.row = i;
    rightMost.col = rightEdge_prev;
    break;
  end
end
end
target_loc.row = rightMost.row;
target_loc.col = upMost.col;

end