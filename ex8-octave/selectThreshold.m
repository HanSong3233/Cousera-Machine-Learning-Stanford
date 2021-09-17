function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

tp_best=0;
fp_best=0; %stands for false positive
fn_best=0; %stands for false negative


stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions


	predictions = (pval < epsilon);
	tp=0; %stands for true positive
	fp=0; %stands for false positive
	fn=0; %stands for false negative
	
	pred_and_reality=[predictions yval];
	num_of_example=length(yval);

	for i = 1:num_of_example
	    x=pred_and_reality(i,:);  #x is the prediction and reality for i-th example
		if x(1)==1
		    if x(2)==1
			    tp=tp+1;
			elseif
			    fp=fp+1;
				endif
		else
		    if x(2)==1
			    fn=fn+1;
				endif
		endif
	end

	prec=tp/(tp+fp);
	rec=tp/(tp+fn);
	F1=2*prec*rec/(prec+rec);

	if F1>bestF1
		bestF1=F1;
		bestEpsilon=epsilon;
		endif

	end


   

end

