function Knn_Result = Knn_Classifier(TrainingSample, TrainingLable, TestingSample, Position,flag)


%     P = 0.3;
%     [Train, Test] = crossvalind('HoldOut',TrainingLable, P);
% 
%     Samples = TrainingSample(:,Train);
%     Lables = TrainingLable(Train,1);
%     TestSample = TrainingSample(:,Test);
%     TestLable = TrainingLable(Test,1);

     if flag == 1
        Sample = TrainingSample(logical(Position),:);
        Test = TestingSample(logical(Position),:);
    else
        Sample = TrainingSample;
        Test = TestingSample;
    end

    Knn_Result = knnclassify(Test', Sample', TrainingLable);

end