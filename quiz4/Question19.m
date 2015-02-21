ein=0;
for t=1:500;
    [centers,list]=kmeans_train(k_means_train,2);
    ein(t,1)=kmeans_ein(centers,list,k_means_train);
end