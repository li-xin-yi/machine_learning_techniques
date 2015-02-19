eout=0;
r=0.1;
E=[0.001,0.01,0.1,1,10];
m=3;
d=2;
T=50000;
N=length(nnet_train);
for p=1:100
    k=1;
for eta=E
    w1=2*rand(d+1,m)*r-r;
    w2=2*rand(m+1,1)*r-r;
    for t=1:T
        n=randi(N);
        s1=w1'*[1,nnet_train(n,1:2)]';
        x1=tanh(s1);
        s2=w2'*[1;x1];
        x2=tanh(s2);
        delta2=-2*(nnet_train(n,3)-x2)*(1-tanh(s2)^2);
        delta1=delta2*w2(2:m+1,:).*(1-tanh(s1).^2);
        w2=w2-eta*[1;x1]*delta2;
        w1=w1-eta*[1,nnet_train(n,1:2)]'*delta1';
    end
    eout(p,k)=predict_check_nnet(w1,w2,nnet_test);
    k=k+1;
end
end