
function MOMENT = CalcMomTWcorr(n,p)

%   This function calculates the scaling terms (MOMENTS) for the
%   Tracy-Widom distribution for the largest eigenvalues of random sample
%   correlation matrices as detailed in
%   http://onlinelibrary.wiley.com/doi/10.1002/cem.1411/abstract

%   Edoardo Saccenti - Wageningen University - (c) 2011 - 2015
%   email: esaccenti@gmail.com


MaxPerm = 100;

EIGA1 = zeros(1,MaxPerm);

MOMENT = zeros(4,2); %mu / sigma


disp('Calculation the empyirical distribution of the first largest eigenvalue')
for perm = 1:MaxPerm;
    RX = zscore(randn(n,p));
    eigenvalues = eigs(RX*RX');

    EIGA1(perm) = eigenvalues(1);
end


%% Calculate moment for the first Eiglenvalue

ux = -1.2065335745820;
sx = sqrt(+1.607781034581);

uy = mean(EIGA1);
sy = sqrt(moment(EIGA1,2));

muu = -(sy/sx)*ux + uy;
sssigma = sy/sx;

MOMENT(1,1) = muu;
MOMENT(1,2) = sssigma;

disp('First eigenvalue')
disp(sprintf('Mu: %2.4f', muu))
disp(sprintf('Sigma: %2.4f', sssigma))
disp(' ')
disp('***')
disp('  ')



