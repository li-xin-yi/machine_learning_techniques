N=length(features_train);
temp=features_train;
count=[0,0,0,0,0];
for n=1:N
   if temp(n,1) ==0
      temp(n,1)=1;
   else
      temp(n,1)=-1;
   end
end
for k=1:10
clear train
clear test
clear acc
shuffle=randperm(N);
for n=1:1000
  test(n,:)=temp(shuffle(1,n),:);
end
for n=1001:N
  train(n,:)=temp(shuffle(1,n),:);
end
clear model
model(1,1)=svmtrain(train(:,1),train(:,2:3),'-t 2 -g 1 -c 0.1 -h 0');
model(1,2)=svmtrain(train(:,1),train(:,2:3),'-t 2 -g 10 -c 0.1 -h 0');
model(1,3)=svmtrain(train(:,1),train(:,2:3),'-t 2 -g 100 -c 0.1 -h 0');
model(1,4)=svmtrain(train(:,1),train(:,2:3),'-t 2 -g 1000 -c 0.1 -h 0');
model(1,5)=svmtrain(train(:,1),train(:,2:3),'-t 2 -g 10000 -c 0.1 -h 0');
for i=1:5
 [~,acc(i,1:3),~]=svmpredict(test(:,1),test(:,2:3),model(1,i));
end
[~,c]=max(acc(:,1));
count(1,c)=count(1,c)+1;
end


