function [] = NNClassification(A,tr_per);

[n ,m] =size(A);
A = A(randperm(size(A,1)),:); % shuffle of Data set
save shuffle.mat A
load shuffle
[X,Y]= Sep_feaVec_classlabel(A,m);
tr_samples=ceil(n*tr_per);
ts_samples = n-tr_samples;

% Separate Training and Testing, fetures and classes in matix Xtr,Ytr and Xts,Yts respectively from actual Dataset
[Xtr,Ytr,Xts,Yts]= Train_Test_dataset(X,Y,n,m,tr_samples);
[ct ,classes] = hist(Yts,unique(Yts)); % count of number of samples for each category 

tic;
%Traning of Neural Network
net = feedforwardnet(30,'trainlm');
[net,tr] = train(net,Xtr',Ytr','useParallel','yes','showResources','yes');

%Testing of dataset 
label=net(Xts');

[confusion_mat ,Error_mat] = confusionmat_calcNN(label,Yts,ct,ts_samples)

disp('Confusion Matrix = ');
disp(confusion_mat);
disp('Error Matrix = ');
disp(100*Error_mat);
toc

end
