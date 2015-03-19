function [Xtr,Ytr,Xts,Yts]= Train_Test_dataset(X,Y,n,m,tr_samples)

% Separate Test and Tran samples from Entire data set
%Inputs -  A : Orignal data set 
%          tr_samples : Number of training samples 
%          n: Total number of samples in Original Dataset
%          m: Total number of features in Original Dataset
%Outputs - Xtr : Training samples 
%          Xts : Test samples 
%          Ytr : class of each Train sample
%          Yts : class of each Test sample

Xtr=zeros(tr_samples,m-1);Ytr=zeros(tr_samples,1);
Xts=zeros(n-tr_samples,m-1);Yts=zeros(n-tr_samples,1);
k=1; j=1;
for i=1:n
    
    if(k<=tr_samples)
        Xtr(i,:)= X(i,:); % Traing Dataset
        Ytr(i,:)= Y(i,:);
    else
       
        Xts(j,:) = X(i,:); % Testing Dataset
        Yts(j,:) = Y(i,:);
        j=j+1;
    end
    k=k+1;
end

end
