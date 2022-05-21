function [z, out]=FeatureSelectionCost(s,data)


        KNN_res = Knn_Classifier(data.x, data.t', data.x, s, 1);
        
        temp = size(find((KNN_res-data.t')~= 0),1);
    
        if temp == 0
            z = rand;
        else
            z = temp / size(data.t,2); 
        end
%     
% 
% 
%     % Read Data Elements
%     x=data.x;
%     t=data.t;
%     
%     % Selected Features
%     S=find(s~=0);
% 
%     % Number of Selected Features
%     nf=numel(S);
%     
%     
%     
%     % Ratio of Selected Features
%     rf=nf/numel(s);
%     
%     % Selecting Features
%     xs=x(S,:);
%     
%     
%     % Weights of Train and Test Errors
%     wTrain=0.8;
%     wTest=1-wTrain;
% 
%     % Number of Runs
%     nRun=1;
%     EE=zeros(1,nRun);
%     for r=1:nRun
%         % Create and Train ANN
%         results=CreateAndTrainANN(xs,t);
% 
%         % Calculate Overall Error
%         EE(r) = wTrain*results.TrainData.E + wTest*results.TestData.E;
%     end
%     
%     E=mean(EE);
%     %if isinf(E)
%     %    E=1e10;
%     %end
%     
%     % Calculate Final Cost
%     beta=0.52;
%     z=E*(1+beta*rf);

    % Set Outputs
    out.S=1;
    out.nf=1;
    out.rf=1;
    out.E=1;
    out.z=1;
    %out.net=results.net;
    %out.Data=results.Data;
    %out.TrainData=results.TrainData;
    %out.TestData=results.TestData;
    
end