%计算不同gamma值下的Eout
N=length(features_train);
temp=features_train;
test=features_test;
for n=1:N
   if temp(n,1) ==0
      temp(n,1)=1;
   else
      temp(n,1)=-1;
   end
end

for n=1:length(test)
   if test(n,1) ==0
      test(n,1)=1;
   else
      test(n,1)=-1;
   end
end

   model=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 1 -c 0.1');
   [~,acc(1,1:3),~]=svmpredict(test(:,1),test(:,2:3),model);
   
   model=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 10 -c 0.1');
   [~,acc(2,1:3),~]=svmpredict(test(:,1),test(:,2:3),model);
   
      model=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 100 -c 0.1');
   [~,acc(3,1:3),~]=svmpredict(test(:,1),test(:,2:3),model);
   
      model=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 1000 -c 0.1');
   [~,acc(4,1:3),~]=svmpredict(test(:,1),test(:,2:3),model);
   
      model=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 10000 -c 0.1');
   [~,acc(5,1:3),~]=svmpredict(test(:,1),test(:,2:3),model);