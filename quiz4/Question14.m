eout=0;
r=0.1;
eta=0.01;
m1=8;
m2=3;
d=2;
T=50000;
N=length(nnet_train);
for p=1:50
    k=1;
    w1=2*rand(d+1,m1)*r-r;
    w2=2*rand(m1+1,m2)*r-r;
    w3=2*rand(m2+1,1)*r-r;
    for t=1:T
        n=randi(N);
        s1=w1'*[1,nnet_train(n,1:2)]';
        x1=tanh(s1);
        s2=w2'*[1;x1];
        x2=tanh(s2);
        s3=w3'*[1;x2];
        x3=tanh(s3);
        delta3=-2*(nnet_train(n,3)-x3)*(1-tanh(s3)^2);
        delta2=delta3*w3(2:m2+1,:).*(1-tanh(s2).^2);
        delta1=zeros(m1,1);
            for j=1:m1
                for i=1:m2
               delta1(j,1)=delta1(j,1)+delta2(i,1)*w2(j+1,i)*(1-tanh(s1(j,1))^2);
                end
            end
        w3=w3-eta*[1;x2]*delta3;
        w2=w2-eta*[1;x1]*delta2';
        w1=w1-eta*[1,nnet_train(n,1:2)]'*delta1';
    end
    eout(p,1)=predict_check_nnet2(w1,w2,w3,nnet_test);
    k=k+1;
end