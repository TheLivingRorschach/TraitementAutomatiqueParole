function [mat_conf,taux_reco]=tout_tester(m_aa,c_aa,m_uu,c_uu,m_ii,c_ii)

% Chargement des données de test
load tst_aa;
load tst_uu;
load tst_ii;

% Initialisation output [matrice_confusion, taux_reco]
mat_conf=[0 0 0;0 0 0;0 0 0];
taux_reco=0;

% Reco tst_aa -> ligne 1
for n=1:length(tst_aa)
    no_classe=classer(tst_aa(n,:),m_aa,c_aa,m_uu,c_uu,m_ii,c_ii);
    mat_conf(1,no_classe)=mat_conf(1,no_classe)+1;
end

% Reco tst_uu -> ligne 2
for n=1:length(tst_uu)
    no_classe=classer(tst_uu(n,:),m_aa,c_aa,m_uu,c_uu,m_ii,c_ii);
    mat_conf(2,no_classe)=mat_conf(2,no_classe)+1;
end

% Reco tst_ii -> ligne 3
for n=1:length(tst_ii)
    no_classe=classer(tst_ii(n,:),m_aa,c_aa,m_uu,c_uu,m_ii,c_ii);
    mat_conf(3,no_classe)=mat_conf(3,no_classe)+1;
end

% Calcul tx_reconnaissance -> diagonale matrice_confusion
taux_reco=(mat_conf(1,1)+mat_conf(2,2)+mat_conf(3,3))/(length(tst_aa)+length(tst_uu)+length(tst_ii))

end