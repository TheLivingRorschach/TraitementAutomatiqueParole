function matrice_cout = DTW_total(taille_fenetre, nbe_coef, rep_ref, rep_obs)
liste_OBS = dir([rep_obs,'*']);
liste_REF = dir([rep_ref,'*']);
matrice_cout = zeros(length(liste_OBS)-2,length(liste_REF)-2);
for x=3:length(liste_OBS)
    obs = load([rep_obs,liste_OBS(x).name]);
    for y=3:length(liste_REF)
        matrice_cout(x-2,y-2)=dtw(load([rep_ref,liste_REF(y).name]),obs);
    end
end
end