function mfcc = parametrisation(signal,taille_fenetre,nbe_coeff)
% Initialisation
mfcc = [];

% Recouvrement
recouvrement=floor(taille_fenetre/2);

% Calcul de l'energie
for x=1:recouvrement:length(signal)-taille_fenetre+1;
    cepstre = real(fft(log(abs(fft(signal(x:x+taille_fenetre-1).*hamming(taille_fenetre))))));
    mfcc=[mfcc,cepstre(2:nbe_coeff+1)];
end

end