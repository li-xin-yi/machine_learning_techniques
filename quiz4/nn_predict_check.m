function re=nn_predict_check(train,test)
   N1=length(train);
   N2=length(test);
   predict=0;
   for i=1:N2
       distance=0;
       for j=1:N1
           distance(j,1)=norm(train(j,1:9)-test(i,1:9));
       end
       [~,pos]=min(distance);
       predict(i,1)=train(pos,10);
   end
   re=sum(sign(abs(predict-test(:,10))))/N2;
end