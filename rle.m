function [out] = rle(array)
% RLE input : 2D matrix output : 1D array
% Convert the matrix in to a 1D array and then run length encode every zeros in the array  
out = [];
array = array';
array = array(:);
oarr = array';
n = length(oarr);
i =1;
while i<=n
    count = 1;
    if oarr(i)==0
    while (i<n-1)&&(oarr(i) == oarr(i+1))
        count = count+1;
        i = i+1;
    end
        out = [out,oarr(i)];
        out = [out,count];
    else
        out = [out,oarr(i)];
    end
    i = i+1;
end
end