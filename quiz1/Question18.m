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
   violation=[0,0,0,0,0];
   model(1,1)=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 100 -c 0.001');
   model(1,2)=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 100 -c 0.01');
   model(1,3)=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 100 -c 0.1');
   model(1,4)=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 100 -c 1');
   model(1,5)=svmtrain(temp(:,1),temp(:,2:3),'-t 2 -g 100 -c 10');
   c=[0.001,0.01,0.1,1,10];
   for i=1:5
       [~,acc(i,1:3),~]=svmpredict(test(:,1),test(:,2:3),model(1,i));
       number_of_svs(1,i)=model(1,i).totalSV;
       w=0;
       for n=1:model(1,i).totalSV
           for m=1:model(1,i).totalSV
               w(n,m)=model(1,i).sv_coef(n,1)*model(1,i).sv_coef(m,1)*exp(-100*norm(model(1,i).SVs(n,1:2)-model(1,i).SVs(m,1:2))^2);
           end
       end
       distance(1,i)=sum(sum(w));
   for n=1:model(1,i).totalSV
       if abs(model(1,i).sv_coef(n,1))==c(1,i);
           wz=0;
           for m=1:model(1,i).totalSV
               wz=wz+model(1,i).sv_coef(m,1)*exp(-100*norm(model(1,i).SVs(n,1:2)-model(1,i).SVs(m,1:2))^2);
           end
           s=1-sign(model(1,i).sv_coef(n,1))*(wz+model(1,i).rho);
           violation(n,i)=s;
       end
   end
   v(1,i)=sum(violation(:,i))
   end

