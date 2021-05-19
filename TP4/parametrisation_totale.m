function parametrisation_totale(taille_fenetre,nbe_coef)
liste_OBS = dir('SIGNAL/OBS/*');
liste_REF = dir('SIGNAL/REF/*');


for x=3:length(liste_OBS)
    nom=liste_OBS(x).name;
    [signal,fe,duree] = lecture(['SIGNAL/OBS/',nom]);
    mfcc=parametrisation(signal,taille_fenetre,nbe_coef);
    save(['MFCC/OBS/',erase(nom,'.wav'),'.mfcc'],'mfcc','-ascii');
end
for y=3:length(liste_REF)
    nom=liste_REF(y).name;
    [signal,fe,duree] = lecture(['SIGNAL/REF/',nom]);
    mfcc=parametrisation(signal,taille_fenetre,nbe_coef);
    save(['MFCC/REF/',erase(nom,'.wav'),'.mfcc'],'mfcc','-ascii');
end
end