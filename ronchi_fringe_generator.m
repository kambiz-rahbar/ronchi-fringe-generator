clc
clear
close all

image_width = 300;    % millimetre
image_hight = 200;    % millimetre
image_dpi = 640;      % pixel or dot per inch
fringe_freq = 1/0.16; % hertz, 1 cycle per meter

fringe_freq = fringe_freq / 1000; % meter to millimetre
image_dpi = image_dpi / 25.4;     % inch to millimetre

space = meshgrid(1:image_width * image_dpi, 1:image_hight * image_dpi);

sin_fringe = sin(2 * pi * fringe_freq * space);
sin_fringe = 128 * (sin_fringe + 1);

bar_fringe = sin_fringe > 127.5;
bar_fringe = 255*bar_fringe;

sin_fringe = uint8(sin_fringe);
bar_fringe = uint8(bar_fringe);

figure(1);
subplot(1,2,1); imshow(sin_fringe); title('sin fringe');
subplot(1,2,2); imshow(bar_fringe); title('bar fringe');

imwrite(sin_fringe,'sin_fringe.tif');
imwrite(bar_fringe,'bar_fringe.tif');
