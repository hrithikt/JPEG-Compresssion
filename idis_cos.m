function [D] = idis_cos(Y)
% IDIS_COS input : 8×8 matrix, output : 8×8 matrix 
% Calculate IDCT of the input and return it's matrix
D=zeros(8,8);
for i=1:8
    for j=1:8
        for x=1:8
            for y=1:8
                if ((x-1)==0)
                    Ci=1/sqrt(8);
                else
                    Ci=sqrt(2/8);
                end
                if ((y-1)==0)
                    Cj=1/sqrt(8);
                else
                    Cj=sqrt(2/8);
                end
                D(i,j)=D(i,j)+Y(x,y)*Ci*Cj*cos((2*(j-1)+1)*(y-1)*pi/16)*cos((2*(i-1)+1)*(x-1)*pi/16);
            end
        end
        D(i,j)=D(i,j);
    end
end
end

