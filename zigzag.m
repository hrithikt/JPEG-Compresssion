function [Z] = zigzag(z,w,h)
% ZIGZAG input : a matrix(w×h),number of rows,number of columns output : matrix of size (w×h/64)×64
% zigzag sequence each 8×8 block of input matrix 
Z=zeros(w*h/64,64);
x=0;
for i=1:8:w
    for j=1:8:h
        x=x+1;
        A=z(i:i+7,j:j+7);
        Z(x,:)=[A(1,1),A(1,2),A(2,1),A(3,1),A(2,2),A(1,3),A(1,4),A(2,3),A(3,2),A(4,1),A(5,1),A(4,2),A(3,3),A(2,4),A(1,5),A(1,6),A(2,5),A(3,4),A(4,3),A(5,2),A(6,1),A(7,1),A(6,2),A(5,3),A(4,4),A(3,5),A(2,6),A(1,7),A(1,8),A(2,7),A(3,6),A(4,5),A(5,4),A(6,3),A(7,2),A(8,1),A(8,2),A(7,3),A(6,4),A(5,5),A(4,6),A(3,7),A(2,8),A(3,8),A(4,7),A(5,6),A(6,5),A(7,4),A(8,3),A(8,4),A(7,5),A(6,6),A(5,7),A(4,8),A(5,8),A(6,7),A(7,6),A(8,5),A(8,6),A(7,7),A(6,8),A(7,8),A(8,7),A(8,8)];
    end
end
end

