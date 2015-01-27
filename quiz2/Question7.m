for i=1:1000
x=rand(1,2);
y=x.^2;
p(i,:)=polyfit(x,y,1);
end

coef=mean(p);