% Chargement data dans workspace
load app_aa;
load app_uu;
load app_ii;

% Affichage histogramme
subplot(3,1,1);
histogram(app_aa);
title('Class aa')

subplot(3,1,2);
histogram(app_uu);
title('Class uu')

subplot(3,1,3);
histogram(app_ii);
title('Class ii')
% La composante principale des trois sons est la même

% Estimation paramètres
moy_aa=sum(app_aa)/length(app_aa);
moy_uu=sum(app_uu)/length(app_uu);
moy_ii=sum(app_ii)/length(app_ii);

% Estimation covariance
cov_aa=cov(app_aa);
cov_uu=cov(app_uu);
cov_ii=cov(app_ii);

% Chargement datatest
load tst_aa;
load tst_uu;
load tst_ii;

% Test classer
test1=classer(tst_aa(1,:),moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii);
test2=classer(tst_uu(1,:),moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii);
test3=classer(tst_ii(1,:),moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii);

% Test tout_tester
[mat_conf,taux_reco]=tout_tester(moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii)