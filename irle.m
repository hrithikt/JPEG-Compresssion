function [iZ] = irle(E)
% IRLE input : 1D array output : 2D matrix
% Run length decode every zeros and convert into a 2D matrix
n = length(E);
arr = [];
i = 1;
while i<=n
    if E(i)==0
        for j = 1:E(i+1)
            arr = [arr,0];
        end
        i = i+1;
    else
        arr = [arr,E(i)];
    end
    i = i+1;
end
iZ = arr;
iZ = reshape(iZ,64,[]);
iZ = iZ';
end