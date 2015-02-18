function re=predict_check_nnet(w1,w2,test)
 re=0;
  N=length(test);
     for i=1:N
        predict=tanh(w2'*[1;tanh(w1'*[1,test(i,1:2)]')]);
        re=re+(test(i,3)-predict)^2;
     end
     re=re/N;
end
