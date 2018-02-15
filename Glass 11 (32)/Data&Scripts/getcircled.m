function [res] = getcircled(arr, k)
    [s, ~] = size(arr');
    ind = mod(k, s);
    if ind==0
        ind=s;
    end
    res=arr{ind};
end

