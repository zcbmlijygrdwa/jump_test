function me_loc = findMeByImageComp(me, img)
  
%% by using corr2 
 if 0
me_loc = findImgInImg(me, img);
me_loc.row = me_loc.row + 50;
me_loc.col = me_loc.col + 8;
end


if 1
  
%by comparing pixel-wise
diff_sum_min = 10000000;
me = double(me);
img = double(img);
 
loc_min = [];
%for i = 1 : size(img,1) - size(me,1)
for i = 600 : 650
for j = 120 : 560
 
diff =  abs(img(i:i+size(me,1)-1 , j:j+size(me,2)-1,:) - me);
  diff_sum = sum(sum(sum(diff)));
  
  if(diff_sum < diff_sum_min)
  loc_min.row = i;
  loc_min.col = j;
  diff_sum_min = diff_sum;
  end
  
end

end
me_loc = loc_min;
me_loc.row = me_loc.row + 75;
me_loc.col = me_loc.col + 22;

end
end