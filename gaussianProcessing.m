function [hyp] = gaussianProcessing(x, y)

% global hyp

% this is needed if you are not running 
% in the Libraries root directory
mydir = '~/Downloads/gpml-matlab-v4.0/';
addpath(mydir(1:end-1))
addpath([mydir,'cov'])
addpath([mydir,'doc'])
addpath([mydir,'inf'])
addpath([mydir,'lik'])
addpath([mydir,'mean'])
addpath([mydir,'prior'])
addpath([mydir,'util'])

% set the squared exponential covariance function
covfunc = {@covMaterniso, 1};
% first component is log(l) and second is log(sigma)
hyp.cov = [log(1/4); log(1.0)]; 

% set the likelihood function to Gaussian
likfunc = @likGauss;
sn = 0.05; %1e-16; % this is the noise level
hyp.lik = log(sn);

% maximize the likelihood function to find the hyperparameters
hyp = minimize(hyp, @gp, -100, @infExact, [], covfunc, likfunc, x, y);

end
