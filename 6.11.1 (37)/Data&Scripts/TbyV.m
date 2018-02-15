function T = TbyV( CT , V)
    % CT is for calibration table
    values=CT(2:end, 2:end);
    values=values';
    
    N=NbyValue(values(:), V);
    x=floor((N-1)/size(values,1))+1;
    y=N-(x-1)*size(values,1);
    T=CT(x+1,1)+CT(1,y+1)';
end

function center=NbyValue(array, V)
    inverted=false;
    nV=length(V);
    if(array(end)<array(1))
        array=flip(array); inverted=true;
    end
    left=ones(nV, 1) ; right=zeros(nV,1)+length(array);
    center=round((right+left)/2);
    prevCenter=zeros(nV,1);
    maxIterations=20;
    for k=1:nV
        iteration=1;
        while center(k)~=prevCenter(k) || iteration<=maxIterations
            if(array(center(k))>V(k))
                right(k)=center(k);
            else
                left(k)=center(k);
            end
            prevCenter(k)=center(k);
            center(k)=round((left(k)+right(k))/2);
            iteration=iteration+1;
        end
    end
    if(inverted); center=length(array)-center+1; end
end