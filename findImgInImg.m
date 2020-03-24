function location = findImgInImg(target,img)
  
  
  cc_r = normxcorr2 (target(:,:,1), img(:,:,1));
  cc_g = normxcorr2 (target(:,:,2), img(:,:,2));
  cc_b = normxcorr2 (target(:,:,3), img(:,:,3));
  
  
  
cc_m = normxcorr2 (target, img);
cc_m = cc_m(:,:,1)+cc_m(:,:,2)+cc_m(:,:,3)+cc_m(:,:,4)+cc_m(:,:,5);
[r_m, c_m] = find (cc_m == max (cc_m(:)));
r_m = r_m-int32(size(target,1)/2);
c_m = c_m-int32(size(target,2)/2);

location.row = r_m;
location.col = c_m;

end