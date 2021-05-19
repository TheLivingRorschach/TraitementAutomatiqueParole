function [signal,fe,duree]=lecture(fichier)
%
[signal,fe] = audioread(fichier);
duree = length(signal)/fe;
end