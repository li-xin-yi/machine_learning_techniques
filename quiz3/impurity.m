function im=impurity(y)
N=length(y);
im=1-(length(find(y==1))/N)^2-(length(find(y==-1))/N)^2;
end