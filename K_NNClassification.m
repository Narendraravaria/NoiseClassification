function [] = K_NNClassification(A,tr_per,K)

[n ,m] =size(A);
A = A(randperm(size(A,1)),:); % shuffle of Data set
%save shuffle.mat A
load shuffle
[X,Y]= Sep_feaVec_classlabel(A,m);
tr_samples=ceil(n*tr_per);
ts_samples = n-tr_samples;

% Separate Training and Testing, fetures and classes in matix Xtr,Ytr and Xts,Yts respectively from actual Dataset
[Xtr,Ytr,Xts,Yts]= Train_Test_dataset(X,Y,n,m,tr_samples);
tic;
[ct,classes] = hist(Yts,unique(Yts)) % count of number of samples for each category 
%Training of KNN classifier
KNNModels = cell(3,1);

for j = 1:numel(classes)
    indx = (Ytr == repmat(classes(j),[tr_samples,1])); % Create binary classes for each classifier
    KNNModels{j} = fitcknn(Xtr,indx,'ClassNames',[false true],'NumNeighbors',K, 'NSMethod','exhaustive','Distance','cityblock')
 
end

% Testing of KNN classifier
Scores = zeros(ts_samples,numel(classes));

for j = 1:numel(classes);
    [~,score] = predict(KNNModels{j},Xts);
    Scores(:,j) = score(:,2); % Second column contains positive-class scores
end

[~ ,pred_class] = max(Scores,[],2);
[confusion_mat, Error_mat] = confusionmat_calc(pred_class,Yts,ct,ts_samples);

disp('Confusion Matrix = ');
disp(confusion_mat);
disp('Error Matrix = ');
disp(100*Error_mat);
t_count =(ts_samples- nnz(Yts==pred_class));
t_error =(t_count/ts_samples)

toc



end
