function eout=kmeans_ein(centers,list,train)
 N=length(list);
 [k,~]=size(centers);
   err=0;
 for i=1:k
     for j=1:N
         if list(j,1)==i
             err=err+norm(centers(i,:)-train(j,:))^2;
         end
     end
     eout=err/N;
end