X=load('Normalization_letter.txt');
k=100;
Cos=pdist2(X,X,'cosine');
[m,n]=size(X);
[cos,index]=sort(Cos,2,'descend');
Similarity_k=index(:,2:k+1);
for i=1:m
    for j=1:k
        temp(i,j)=Cos(i,Similarity_k(i,j));
    end
end
for i=1:m
    for j=1:k
        A_value(i,j)=Cos(i,Similarity_k(i,j))/sum(temp(i,:),2);
    end
end
A=zeros(m,m);
for i=1:m
    for j=1:k
        A(i,Similarity_k(i,j))=A_value(i,j);
%           A(i,Similarity_k(i,j))=1;
    end
end
temp_eye=eye(m,m);
A=A+temp_eye;
dlmwrite('D:\¶ÅÐñÉý\Detection Algorithm\DuXusheng\GAE0322\CreateGraph\letter_A.txt',A,' ');