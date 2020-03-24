function target_loc = findTargetByImageComp(img, me_loc)
  
  target_loc = [];
  
  r_t = me_loc.row+1;
target_i = 1;
while (r_t > me_loc.row-10)
target_i
template = (imread(['t', num2str(target_i),'.png']));
template = template(:,:,1);
target_loc = findImgInImg(template, img);
r_t = target_loc.row;
target_i = target_i+1;
end
  
  end