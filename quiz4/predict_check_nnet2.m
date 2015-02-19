function re=predict_check_nnet2(w1,w2,w3,test)
 re=0;
  N=length(test);
     for i=1:N
        predict(i,1)=sign(tanh(w3'*[1;tanh(w2'*[1;tanh(w1'*[1,test(i,1:2)]')])]));
     end
     re=sum(sign(abs(predict-test(:,3))))/N;
end