function predict=pruned_Dtree_predict(train,test)
[theta,i,s]=pruned_Dtree(train);
N=length(test);
for n=1:N
    predict(n,1)=s*sign(test(n,i)-theta);
end
end