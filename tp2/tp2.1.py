from scipy.io import loadmat
import numpy as np
import matplotlib.pyplot as plt 

#Charger les données
app_aa = loadmat("app_aa.mat").get('app_aa')
app_uu = loadmat("app_uu.mat").get('app_uu')
app_ii = loadmat("app_ii.mat").get('app_ii')

#Afficher les histogrammes
plt.figure()
plt.hist(app_aa[:,0],bins=30)
plt.figure()
plt.hist(app_aa[:,1],bins=30)

plt.figure()
plt.hist(app_uu[:,0],bins=30)
plt.figure()
plt.hist(app_uu[:,1],bins=30)

plt.figure()
plt.hist(app_ii[:,0],bins=30)
plt.figure()
plt.hist(app_ii[:,1],bins=30)
#plt.show()

#Afficher moyenne et matrice de covariance de chaque classe
moy_aa = np.mean(app_aa,0)
cov_aa = np.cov(np.transpose(app_aa))
print("moyenne aa : \n", moy_aa)
print("covariance aa : \n", cov_aa)

moy_uu = np.mean(app_uu,0)
cov_uu = np.cov(np.transpose(app_uu))
print("moyenne uu : \n", moy_uu)
print("covariance uu : \n", cov_uu)

moy_ii = np.mean(app_ii,0)
cov_ii = np.cov(np.transpose(app_ii))
print("moyenne ii : \n", moy_ii)
print("covariance ii : \n", cov_ii)

#définir fonction classer qui renvoie la classe obtenue par maximum de vraisemblance
def classer(observation,moyenne_aa,covariance_aa,moyenne_uu,covariance_uu,moyenne_ii,covariance_ii):
    arg_aa = (1/((2*np.pi)*(np.linalg.det(covariance_aa)**(1/2))))*np.exp((-1/2)*np.transpose(np.subtract(observation,moyenne_aa))@np.linalg.inv(covariance_aa)@np.subtract(observation,moyenne_aa))
    arg_uu = (1/((2*np.pi)*(np.linalg.det(covariance_uu)**(1/2))))*np.exp((-1/2)*np.transpose(np.subtract(observation,moyenne_uu))@np.linalg.inv(covariance_uu)@np.subtract(observation,moyenne_uu))
    arg_ii = (1/((2*np.pi)*(np.linalg.det(covariance_ii)**(1/2))))*np.exp((-1/2)*np.transpose(np.subtract(observation,moyenne_ii))@np.linalg.inv(covariance_ii)@np.subtract(observation,moyenne_ii))
    liste = [arg_aa,arg_uu,arg_ii]
    return(np.argmax(liste))

tst_aa = loadmat("eval_data.mat").get('eval_aa')
tst_uu = loadmat("eval_data.mat").get('eval_uu')
tst_ii = loadmat("eval_data.mat").get('eval_ii')

matrice_confusion = [[0,0,0],[0,0,0],[0,0,0]]
for i in range(20):
    ord = classer(tst_aa[i], moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii)
    matrice_confusion[0][ord] += 1
for i in range(20):
    ord = classer(tst_uu[i], moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii)
    matrice_confusion[1][ord] += 1
for i in range(20):
    ord = classer(tst_ii[i], moy_aa,cov_aa,moy_uu,cov_uu,moy_ii,cov_ii)
    matrice_confusion[2][ord] += 1
print(np.array(matrice_confusion))

taux = 0
for i in range(3):
    taux += matrice_confusion[i][i]
print("taux de reussite : ",taux*100/60,"%")