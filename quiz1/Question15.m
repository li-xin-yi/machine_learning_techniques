N=length(features_train);
% '0' versus non'0'
% for n=1:N
%    if features_train(n,1)~=0
%       features_train(n,1)=1;
%    end
% end
k=1;
for i=[0,2,4,6,8]
   temp=features_train;
   for n=1:N
    if temp(n,1) == i
        temp(n,1)=1;
    else
        temp(n,1)=-1;
    end
   end
   model=svmtrain(temp(:,1),temp(:,2:3),'-t 1 -d 2 -r 1 -c 0.01');
   alaph(k,1)=i;
   alaph(k,2)=sum(abs(model.sv_coef));
   [predict,accuracy(k,1:3),value]=svmpredict(temp(:,1),temp(:,2:3),model);
   accuracy(k,4)=i;
   k=k+1;
end
   

      
    