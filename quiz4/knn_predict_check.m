function re=knn_predict_check(train,test,k)
   N1=length(train);
   N2=length(test);
   predict=0;
   for i=1:N2
       distance=0;
       for j=1:N1
           distance(j,1)=norm(train(j,1:9)-test(i,1:9));
           distance(j,2)=j;
       end
       s=0;
       dis=sortrows(distance,1);
       for n=1:k
          s=s+train(dis(n,2),10)*exp(-dis(n,1)^2);
       end        
       predict(i,1)=sign(s);
   end
   re=sum(sign(abs(predict-test(:,10))))/N2;
end