function []=GMMClassifier
%cd TrainDatabase;
while (1==1)
    choice=menu('Gaussian Mixture Model Classifier',...
                  ' 1.Choose Dataset',...
                  ' 2.Percentage of Training data',...
                  ' 3.Classify',...
                  ' Exit');
    if (choice ==1)
        [A] = Choose_dataset;
    end
    if (choice == 2)
        tr_per = input('Enter number of samples for traning in the form "x%=x/100" = ');
    end
    if (choice == 3)
        K = input('Enter number of components')
        GMMClassification(A,tr_per,K);
    end
    if (choice == 4)
       
        %clc;
        %close all;
        return;
    end    
end
end