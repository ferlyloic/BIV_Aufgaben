x=[ 1 2 3 4 ];
r = x';
r;
r = x*x';
r;
r = x.*x;
r;
r = [x x];
r;
M=[x;2*x];
M=[M;M];
M;
M(2,3)
M(2,:) % hier bedeutet der ":" alle Spalten
M(:,3) % hier bedeutet der ":" alle Zeilen
M(2:4,1:2) % "2:4" bedeutet "2 bis 4"
r = M>3; % vergleichen Sie die Ausgabe mit der Ausgabe der nächsten Zeile
r;
M(M>3)
M(M>3)=17;
M;



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

moewe2_binary = ((moewe2_red < 0.4) + (moewe2_green < 0.2) + (moewe2_blue < 0.3)) > 0;
moewe2_binary_inversed = ((moewe2_red < 0.4) + (moewe2_green < 0.2) + (moewe2_blue < 0.3)) == 0;
figure
imshow(moewe2_binary)
moewe_muster = repmat(uint8(moewe2_binary), [1 1 3]);
moewe_only = moewe .* moewe_muster;
moewe_muster2 = repmat(uint8(moewe2_binary_inversed), [1 1 3]);
background = bryce .* moewe_muster2;
figure
imshow(moewe_only)
imshow(background)
figure
final = imadd(moewe_only,bryce);
imshow(final)
