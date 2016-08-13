function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C = 1;
sigma = 0.1;

return


CTest = [ 0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30 ];
sigmatesTest = CTest;

errMin = -1;

for i=1:length(CTest)

  for j=1:length(sigmatesTest)
    
    model= svmTrain(X, y, CTest(i), @(x1, x2) gaussianKernel(x1, x2, sigmatesTest(j)));
    
    predictions = svmPredict(model, Xval);
    
    err = mean(double(predictions ~= yval));
    
    if(errMin == -1 || errMin > err)
      errMin = err;
      C = CTest(i);
      sigma = sigmatesTest(j);
    end
    
    fprintf(['C = %2.2f sigma = %2.2f CostOpt = %0.5f\n'], CTest(i), sigmatesTest(j), errMin);
    
  end
end

fprintf(['C = %2.2f sigma = %2.2f Cost = %2.5f\n'], C, sigma, errMin);

% =========================================================================

end
