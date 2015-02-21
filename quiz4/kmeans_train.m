function [centers,temp]=kmeans_train(train,k)
   centers=[];
   N=length(train);
   temp=zeros(N,1);
   flag=0;
   cl=randperm(N);
   cl=cl(1,1:k);
     for n=1:k
         centers(n,:)=train(cl(1,n),:);
     end
   while flag==0
    flag=1;
    for i=1:N
        distance=0;
        for j=1:k
        distance(j,1)=norm(train(i,:)-centers(j,:));
        end
        [~,mark]=min(distance);
        if temp(i,1)~=mark
            flag=0;
            temp(i,1)=mark;
        end
    end
    for i=1:k
        vectors=[];
        for j=1:N
            if temp(j,1)==i
                vectors=[vectors;train(j,:)];
            end
        end
        c=mean(vectors);
        if centers(i,:)~=c
            flag=0;
            centers(i,:)=c;
        end
    end
   end
end