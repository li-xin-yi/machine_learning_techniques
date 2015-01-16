
N=length(features_train);
temp=features_train;
for n=1:N
   if features_train(n,1)~=0
      temp(n,1)=-1;
   else
       temp(n,1)=1;
   end
end

model=svmtrain(temp(:,1),temp(:,2:3),'-t 0 -c 0.01');
w=model.SVs' * model.sv_coef;
