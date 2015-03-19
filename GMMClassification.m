function [] = GMMClassification(A,tr_per,K)

[n ,m] =size(A);
A = A(randperm(size(A,1)),:); % shuffle of Data set
%save shuffle.mat A
load shuffle
[X,Y]= Sep_feaVec_classlabel(A,m);
tr_samples=ceil(n*tr_per); % total number of training samples
ts_samples = n-tr_samples; %total number of testing samples

% Separate Training and Testing, fetures and classes in matix Xtr,Ytr and Xts,Yts respectively from actual Dataset
[Xtr,Ytr,Xts,Yts]= Train_Test_dataset(X,Y,n,m,tr_samples);
[ct ,classes] = hist(Yts,unique(Yts))
class_mat1=zeros(ct(1),m-1);class_mat2=zeros(ct(2),m-1);class_mat3=zeros(ct(3),m-1); j1=1;j2=1;j3=1;
for i=1:tr_samples
   if(Ytr(i)==1) 
       class_mat1(j1,:)=Xtr(i,:);
       j1=j1+1;
   elseif(Ytr(i)==2)
       class_mat2(j2,:)=Xtr(i,:);
       j2=j2+1;
   else
       class_mat3(j3,:)=Xtr(i,:);
       j3=j3+1;
   end
end
tic;
%Training
options = statset('Display','final');
GMModel1 = fitgmdist(class_mat1,K,'CovType','full','Options',options);
GMModel2 = fitgmdist(class_mat2,K,'CovType','full','Options',options);
GMModel3 = fitgmdist(class_mat3,K,'CovType','full','Options',options);

prior_prob = hist(Yts,unique(Yts))/n; %Prior Probabilty

%Testing 
idx = zeros(ts_samples,numel(classes));
idx(:,1) = prior_prob(1)*pdf(GMModel1,Xts);
idx(:,2) = prior_prob(2)*pdf(GMModel2,Xts);
idx(:,3) = prior_prob(3)*pdf(GMModel3,Xts);
[~ ,pred_class] = max(idx,[],2);    
[confusion_mat, Error_mat] = confusionmat_calc(pred_class,Yts,ct,ts_samples);
disp('Confusion Matrix :- ');
disp(confusion_mat);
disp('Error Matrix :- ');
disp(100*Error_mat);

toc



end
