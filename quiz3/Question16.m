eout=0;
for k=1:100
for T=1:300
   for N=100
     sample=0;
     sample=randi(100,1,100);
     for n=1:100
     train_set(n,:)=train(sample(1,n),:);
     end
     eout((k-1)*300+T)=check_predict(train_set,test);
   end
end
end