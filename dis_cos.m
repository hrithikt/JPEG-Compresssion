function [D] = dis_cos(Y)
% DIS_COS input : 8×8 matrix, output : 8×8 matrix 
% Calculate DCT of the input and return it's DCT matrix
D = zeros(8,8);
for i = 1:8
    for j = 1:8
        for x = 1:8
            for y = 1:8
                D(i,j) = D(i,j)+Y(x,y)*cos((2*(y-1)+1)*(j-1)*pi/16)*cos((2*(x-1)+1)*(i-1)*pi/16);
            end
        end
        if ((i-1)==0)
            Ci = 1/sqrt(8);
        else
            Ci = sqrt(2/8);
        end
        if ((j-1)==0)
            Cj = 1/sqrt(8);
        else
            Cj = sqrt(2/8);
        end
        D(i,j) = D(i,j)*Ci*Cj;
    end
end
end