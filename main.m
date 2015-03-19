%Main
close all
clear all
clc
while (1==1)
    choice=menu('Noise Classifier',.....
                'Neural Network Classifier',...
                'K-nearesr Neighbour Classifier',...
                'Support Vector Machine Classifier',...
                'Gaussian Mixture Model Classifier',...
                'Exit');
    if (choice ==1)
       NNClassifier;
    end
    
    if (choice == 2)
        K_NNClassifier;
    end
    
    if (choice ==3)
        SVMClassifier;
    end
    if (choice == 4)
        GMMClassifier;
    end
   
    if (choice == 5)
        %clear all;
        %clc;
        close all;
        return;
    end    
    
end
