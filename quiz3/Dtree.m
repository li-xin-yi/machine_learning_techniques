function r=Dtree(train,order)  %r1->s r2->theta r3->i r4->order
  r(1,4)=order;
  if impurity(train(:,3))==0
      r(1,1)=sign(sum(train(:,3)));
  else
   [N,~]=size(train);
   train1=sortrows(train,1);
   train2=sortrows(train,2);
   theta1=0;
   theta2=0;
for n=1:N-1
    theta1(n,1)=train1(n+1,1)+train1(n,1);
    theta2(n,1)=train2(n+1,2)+train2(n,2);
end
 for n=1:N-1
     imp1(n,1)=impurity(train1(1:n,3));imp1(n,2)=impurity(train1(n+1:N,3));
     b1(n,1)=n*imp1(n,1)+(N-n)*imp1(n,2);
 end
  for n=1:N-1
     imp2(n,1)=impurity(train2(1:n,3));imp2(n,2)=impurity(train2(n+1:N,3));
     b2(n,1)=n*imp2(n,1)+(N-n)*imp2(n,2);
  end
 b=[b1;b2];
 [~,pos]=min(b);
 if pos<N
      r(1,2)=theta1(pos);
      r(1,3)=1;
      r=[r;Dtree(train1(1:pos,:),order*2)];
      r=[r;Dtree(train1(pos+1:N,:),order*2+1)];
 else
       pos=pos-N+1;
       r(1,3)=2;
      r(1,2)=theta2(pos);
      r=[r;Dtree(train2(1:pos,:),order*2)];
      r=[r;Dtree(train2(pos+1:N,:),order*2+1)];
 end
 end
end