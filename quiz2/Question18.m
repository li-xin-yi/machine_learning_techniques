gamma=[32,2,0.125];
lambda=[0.001,1,1000];
N=length(lssvm_all);

train=lssvm_all(1:400,:);
test=lssvm_all(401:N,:);

for i=1:3
   for n=1:400
       for m=1:400
          K(n,m)=exp(-gamma(1,i)*norm(train(n,1:10)-train(m,1:10))^2);
       end
       for m=1:100
        Kout(m,n)=exp(-gamma(1,i)*norm(train(n,1:10)-test(m,1:10))^2);
       end
   end
   for j=1:3
     beta=inv(lambda(1,j)*eye(400)+K)*train(:,11);
     in=sign(K*beta);
     ein(i,j)=sum(abs(sign(in-train(:,11))))/400;
     out=sign(Kout*beta);
     eout(i,j)=sum(abs(sign(out-test(:,11))))/100;
   end
   end
   


