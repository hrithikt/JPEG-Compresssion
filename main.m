clc;
close all;
clear all;

% Read Image
img = imread('peppers.png');
img_size = numel(img); % Number of bytes to store the image
str1 = ['Initial image size = ',num2str(img_size),' bytes'];
disp(str1);
w = size(img,1); 
h = size(img,2); 

% Make number of rows and columns multiple of 8
if(mod(w,8)==0)
    w=w-8;
else
    w=w-(8+mod(w,8));
end
if(mod(h,8)==0)
    h=h-8;
else
    h=h-(8+mod(h,8));
end

% Convert RGB to YCbCr
img_ycbcr = rgb2ycbcr(img);

% Downsample
I_d = img_ycbcr;
I_d(:,2:2:end,2) =I_d(:,1:2:end-1,2);
I_d(2:2:end,:,2) =I_d(1:2:end-1,:,2);
I_d(:,2:2:end,3) =I_d(:,1:2:end-1,3);
I_d(2:2:end,:,3) =I_d(1:2:end-1,:,3);

% DCT compression and Quantization
I_d = double(I_d);
% Quatization Matrix
Q = [16 11 10 16 24 40 51 61 ;
     12 12 14 19 26 28 60 55 ;
     14 13 16 24 40 57 69 56 ;
     14 17 22 29 51 87 80 62 ;
     18 22 37 56 68 109 103 77 ;
     24 35 55 64 81 104 113 92 ;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 quantn_out = zeros(w,h,3);
 iquantn_out = quantn_out; 
 idct_out = quantn_out;
 
 for channel = 1:3
     for j = 1:8:w
         for k = 1:8:h
             block = I_d(j:j+7,k:k+7,channel);
             dct_out = dis_cos(block); % DCT
             block_quantn = round(dct_out./Q); % Quantization
             quantn_out(j:j+7,k:k+7,channel) = block_quantn;
         end
     end
 end

% Encoding
% Zig-Zag and Run length encoding
Z1 = zigzag(quantn_out(:,:,1),w,h);
E1 = rle(Z1);
Z2 = zigzag(quantn_out(:,:,2),w,h);
E2 = rle(Z2);
Z3 = zigzag(quantn_out(:,:,3),w,h);
E3 = rle(Z3);

% Size after Compression 
OpBytes = 8*numel(E1)+8*numel(E2)+8*numel(E3);
space_saved = img_size-OpBytes;
str1 = ['Initial size-Final size = ',num2str(space_saved),' bytes'];
disp(str1);

% Decompression
% Decoding
iZ1 = irle(E1);
iquantn_out(:,:,1) = izigzag(iZ1,w,h);
iZ2 = irle(E2);
iquantn_out(:,:,2) = izigzag(iZ2,w,h);
iZ3 = irle(E3);
iquantn_out(:,:,3) = izigzag(iZ3,w,h);

% Dequantization and Inverse DCT 
for channel = 1:3
    for j = 1:8:w
        for k = 1:8:h
            block = iquantn_out(j:j+7,k:k+7,channel);
            block_dquantn = block.*Q; % Dequantization
            idct_out(j:j+7,k:k+7,channel) = idis_cos(block_dquantn); % IDCT
        end
    end
end

% Results
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(ycbcr2rgb(uint8(idct_out)));
title('Reconstructed Image')
