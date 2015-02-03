function Eout=check_predict(train,test)
tree=Dtree(train,1);
N=length(test);
for n=1:N
    t=1;
    p=find(tree(:,4)==t);
    while tree(p,3)~=0
        if tree(p,3)==1
           direct=test(n,1)-tree(p,2);
        else
           direct=test(n,2)-tree(p,2);
        end
        if direct<0
            t=t*2;
        else
            t=t*2+1;
        end
        p=find(tree(:,4)==t);
    end
    predict(n,1)=tree(p,1);
end

Eout=sum(abs(sign(predict-test(:,3))))/N;

end