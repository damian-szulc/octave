function J = costFunctionJ(X, y, theta)
 
% X is the "design matrix" containing our dataset
% y is the class labels 
% theta 

m = size(X,1); % num of training examples
predictions = X*theta; % predictions of hypothesis on all m examples
sqrErrors = (predictions-y).^2; % vector with squared errors

J= 1/(2*m) * sum( sqrErrors );
