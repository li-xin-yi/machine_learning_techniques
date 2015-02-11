eout=0;
for k=1:100
     predict=0;
for T=1:300
     sample=0;
     sample=randi(100,1,100);
     for n=1:100
     train_set(n,:)=train(sample(1,n),:);
     end
     predict=predict+Dtree_predict(train_set,test);
end
   eout(k,1)=sum(abs(sign(test(:,3)-sign(predict/300))))/1000;
end