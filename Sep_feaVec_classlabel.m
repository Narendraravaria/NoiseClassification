function [fea_vec, classlabel] = Sep_feaVec_classlabel(A,m)

% Separate Feature Vector and Class Label 
%Inputs -  B : Test or Train data set 
%          m: Total number of columns in Original Dataset
%Outputs - fea_vec : Feature Vectors  
%          classlabel : Class Labels

i=1:m-1;
fea_vec(:,i)= A(:,i);
classlabel= A(:,m);

end