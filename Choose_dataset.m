function [A]=Choose_dataset()

while (1==1)
    choice=menu('Choose Dataset',...
                  ' NormalizedFeaturesSet1',...
                  ' NormalizedFeaturesSet2',...
                  ' SubSetNormalizedFeaturesSet1',...
                  ' SubSetNormalizedFeaturesSet2',...
                  ' Exit');
    if (choice ==1)
        [A] = NormaFeaturesSet1;
        disp(A);
    end
    if (choice == 2)
        [A] = NormaFeaturesSet2;
    end
    if (choice ==3)
        [A] = SubSetNormFeaturesSet1;
    end
    if (choice == 4)
        [A] = SubSetNormaFeaturesSet2;
    end    
    if (choice == 5)
        cd ..;
        %clc;
        close all;
        return;
    end    
end
end