name = 'notredame';
im = (imread(strcat(name,'.jpg')));
imshow(im)
title('Mark the 4 source points')
p1 = ginput(4);
close
imshow(im)
title('Mark the 4 destination points')
p2 = ginput(4);
close
H = homat(p1,p2);
figure('units','normalized','outerposition',[0 0 1 1])
homwarp(H,im, 'full')
F = getframe(gcf);
homo = frame2im(F);
% [m, n, o] = size(homo);
close
figure('units','normalized','outerposition',[0 0 1 1])
imshow(homo)
title('Mark the 4 corner points')
p3 = ginput(4);
p3 = round(p3);
pc1 = expandsort(p3,1);
pc2 = expandsort(p3,2);
homonew = homo(max(pc2(1:2,2)):min(pc2(3:4,2)),max(pc1(1:2,1)):min(pc1(3:4,1)),:);
figure('units','normalized','outerposition',[0 0 1 1])
imshow(homonew)
saveas(gcf,strcat(name,'aligned'),'jpg')
pause(5)
close all