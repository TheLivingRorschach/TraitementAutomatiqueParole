function cout=dtw(mfcc_ref,mfcc_obs)
N = size(mfcc_ref,2);
M = size(mfcc_obs,2);
g(1,1) = 0;
for i=2:N+1
    g(i,1) = Inf;
end
for j=2:M+1
    g(1,j)=Inf;
end

for i=2:N+1
    for j=2:M+1
        d=sum((mfcc_ref(:,i-1)-mfcc_obs(:,j-1)).^2).^0.5;
        g(i,j) = min([g(i-1,j)+d,g(i-1,j-1)+2*d,g(i,j-1)+d]);
    end
end
cout=g(N+1,M+1)/(N+M);
        
end