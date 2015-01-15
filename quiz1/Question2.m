clear;
x=[1,0;0,1;0,-1;-1,0;0,2;0,-2;-2,0];
y=[-1;-1;-1;1;1;1;1];
x1=x(:,1);
x2=x(:,2);
z1=x2.^2-2*x1+3;
z2=x1.^2-2*x2-3; 
%变化到z空间
z=[z1 z2];
clear q;
for n=1:7
    for m=1:7
        q(n,m)=y(n,1)*y(m,1)*z(n,:)*z(m,:)';
    end
end
q=q+ eye(7,7) * 0.00000001; %提升q矩阵的特征值
p=-ones(7,1);
A=[-eye(7,7);y';-y'];
c=zeros(9,1);
alpha=quadprog(q,p,A,c);
w=[0,0];
for n=1:7
   w=w+alpha(n,1)*y(n,1)*z(n,:);
end

for n=1:7
    if alpha(n,1)>0.1
        b(n,1)=y(n,1)-w*z(n,:)';
    end
end
