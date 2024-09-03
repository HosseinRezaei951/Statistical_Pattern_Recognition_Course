function lambda = LDA(X, Y)
    Classes=unique(Y)';
    k=numel(Classes);
    n=zeros(k,1);
    C=cell(k,1);
    M=mean(X);
    S=cell(k,1);
    Sw=0;
    Sb=0;
    for j=1:k
        Xj=X(Y==Classes(j),:);
        n(j)=size(Xj,1);
        C{j}=mean(Xj);
        S{j}=0;
        for i=1:n(j)
            S{j}=S{j}+(Xj(i,:)-C{j})'*(Xj(i,:)-C{j});
        end
        Sw=Sw+S{j};
        Sb=Sb+n(j)*(C{j}-M)'*(C{j}-M);
    end
    [~, LAMBDA]=eig(Sb,Sw);
    lambda=diag(LAMBDA);
    [lambda, ~]=sort(lambda,'descend');
    lambda = 1/lambda(1,1);
end