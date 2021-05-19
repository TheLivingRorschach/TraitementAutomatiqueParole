function no_classe=classer(x,moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii)
% x est la variable observee -> 1*2

% Calcul loglikehood
llh_aa=log(det(cov_aa))+(x-moy_aa)*inv(cov_aa)*(x-moy_aa).';
llh_uu=log(det(cov_uu))+(x-moy_uu)*inv(cov_uu)*(x-moy_uu).';
llh_ii=log(det(cov_ii))+(x-moy_ii)*inv(cov_ii)*(x-moy_ii).';

% Determiner loglikehood le plus faible
llh=[llh_aa,llh_uu,llh_ii];
test=min(llh);

% Return
if test==llh_aa
    no_classe=1;
elseif test==llh_uu
    no_classe=2;
elseif test==llh_ii
    no_classe=3;
else
    no_classe=-1;
end

end