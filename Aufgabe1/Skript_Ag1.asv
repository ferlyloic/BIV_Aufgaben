
moewe=imread('moewex.jpg');
bryce = imread('bryce.jpg');
moewe_red = moewe(:,:,1);
moewe_green = moewe(:,:,2);
moewe_blue = moewe(:,:,3);
figure
imshow(moewe)
size(moewe)
showQuadView(moewe,moewe_red,moewe_green,moewe_blue)

moewe2 = rgb2hsi(moewe);
moewe2_red = moewe2(:,:,1);
moewe2_green = moewe2(:,:,2);
moewe2_blue = moewe2(:,:,3);
showQuadView(moewe2,moewe2_red,moewe2_green,moewe2_blue)

moewe2bin = ((moewe2_red < 0.5) + (moewe2_green < 0.3) + (moewe2_blue < 0.4)) > 0;
figure
imshow(moewe2bin)
moewe_muster = repmat(uint8(moewe2bin), [1 1 3]);
moewe_only = moewe .* moewe_muster;
figure
imshow(moewe_only)

