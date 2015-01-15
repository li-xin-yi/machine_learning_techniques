clear;
x=[1,0;0,1;0,-1;-1,0;0,2;0,-2;-2,0];
y=[-1;-1;-1;1;1;1;1];
clear q;
for n=1:7
    for m=1:7
        k=(1+dot(x(m,:),x(n,:)))^2;
        temp=y(n,1)*y(m,1)*k;
        q(n,m)=temp;
    end
end
q=q+ eye(7,7) * 0.00000001; %提升q矩阵的特征值
p=-ones(7,1);
A=[-eye(7,7);y';-y'];
c=zeros(9,1);
alpha=quadprog(q,p,A,c);

temp=0;
for n=1:7
    if alpha(n,1)>0.01
        for m=1:7
        temp=temp+alpha(m,1)*y(m,1)*(1+dot(x(n,:),x(m,:)))^2;
        end
        b=y(n,1)-temp;
        break
    end
end
a=sum(alpha);
%方便化简
alpha=alpha*27;
b=b*27;