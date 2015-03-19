function [confusion_mat Error_mat] = confusionmat_calcNN(label,Yts,ct,ts_samples)

%Calculation of Confusion Matrix ,Error for each Class, and Total Error
%Inputs -  label : Class name to which test samples are assigned by classifier 
%          Yts : my*1 matrix contains class name of all the samples in test data set  
%          ct: 1*3 marix with each entry corresponds to number of samples belong to say class 1,2or 3
%          ts_samples : Total number of sample in Test data set
%Outputs - confusion_mat : 3*3 confusion Matrix, c(i,j) represents ith
%                          class is classsified as jth class
%          Error_mat : 1*4 error matrix, each row contains error value of say class 1, 2, or 3 with last row contains total error  
Error_mat = zeros(1,4);
confusion_mat = zeros(3,3);

for i=1:ts_samples
        
    if(label(i)<=1.5000)
        temp=1;
    elseif((1.5000<label(i))&&(label(i)<=2.5000))
        temp=2;
    elseif((2.5000<label(i))&&(label(i)<=max(label)))
        temp=3;
    else
         i
        temp=4;
    end
    if ((temp~= Yts(i))&& (temp==1))
       
        if Yts(i)==2
            confusion_mat(1,2) = confusion_mat(1,2) + 1;
        else
            confusion_mat(1,3) = confusion_mat(1,3) + 1;
        end
    elseif ((temp~= Yts(i))&& (temp==2))
         if Yts(i)==1
            confusion_mat(2,1) = confusion_mat(2,1) + 1;
        else
            confusion_mat(2,3) = confusion_mat(2,3) + 1;
        end
    elseif ((temp~= Yts(i))&& (temp==3))
        if Yts(i)==1
            confusion_mat(3,1) = confusion_mat(3,1) + 1;
        else
            confusion_mat(3,2) = confusion_mat(3,2) + 1;
        end
    end 
end
confusion_mat(1,1)= ct(1)-(confusion_mat(1,2)+confusion_mat(1,3));
confusion_mat(2,2)= ct(2)-(confusion_mat(2,1)+confusion_mat(2,3));
confusion_mat(3,3)= ct(3)-(confusion_mat(3,1)+confusion_mat(3,2));
%Error Calculation 
Error_mat(1) = (confusion_mat(1,2)+confusion_mat(1,3))/ct(1); 
Error_mat(2) = (confusion_mat(2,1)+confusion_mat(2,3))/ct(2);
Error_mat(3) = (confusion_mat(3,1)+confusion_mat(3,2))/ct(3);
Error_mat(4) = ((confusion_mat(1,2)+confusion_mat(1,3))+(confusion_mat(2,1)+confusion_mat(2,3))+(confusion_mat(3,1)+confusion_mat(3,2)))/ts_samples;
confusion_mat(1,:) = 100*(confusion_mat(1,:)/ct(1));
confusion_mat(2,:) = 100*(confusion_mat(2,:)/ct(2));
confusion_mat(3,:) = 100*(confusion_mat(3,:)/ct(3));
end



