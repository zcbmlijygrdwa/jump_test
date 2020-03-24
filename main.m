close all;

while 1
clear all;
tic_all = tic;
system('sh capscreen.sh')

img = (imread('screen.png'));
img_origin = img;

%img = rgb2gray(img);

me = (imread('me.png'));
%me = rgb2gray(me);



%find location of character, target
tic
me_loc = findMeByImageComp(me, img);
time_me = toc

%target_loc = findTargetByImageComp(img, me_loc);
tic
target_loc = findTargetByColor(img);
time_target = toc
img2 = rgb2gray(img_origin);

distance = norm(double([target_loc.row, target_loc.col] - [me_loc.row, me_loc.col]))
press_time = 2.1353*distance
if(press_time>1000 || press_time<340)
break;
end
jump(int32(press_time))

img2(me_loc.row-5:me_loc.row+5, me_loc.col-5:me_loc.col+5) = ones(11,11);
img2(target_loc.row-5:target_loc.row+5, target_loc.col-5:target_loc.col+5) = zeros(11,11);
imshow(img2)





pause(3)
a = 1
toc_all = toc(tic_all)
end