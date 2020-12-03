

%%% Define the variables

subjects = [1 2 3 4 5 6];
Group_Results_Face = [];
Group_Results_House = [];
Group_Results_Scissors = [];

%%% Extract confusion matrix accuracy for Faces, Houses, and Scissors

for subject=subjects
    
    subject = num2str(subject);

    ROI_Results = load([pwd '/SPM_Results_' subject '/ROI_Results/res_confusion_matrix.mat']);

    Group_Results_Face = [Group_Results_Face, ROI_Results.results.confusion_matrix.output{1}(4,4)];
    Group_Results_House = [Group_Results_House, ROI_Results.results.confusion_matrix.output{1}(5,5)];
    Group_Results_Scissors = [Group_Results_Scissors, ROI_Results.results.confusion_matrix.output{1}(6,6)];

end


%%% Example t-tests %%%

[F_H_h, F_H_p, F_H_ci, F_H_stats] = ttest(Group_Results_Face, Group_Results_House);
[F_S_h, F_S_p, F_S_ci, F_S_stats] = ttest(Group_Results_Face, Group_Results_Scissors);
