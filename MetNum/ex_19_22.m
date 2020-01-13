
clear
clc

T = .25;
A0 = 1;
nVec = 1:6;
tVec = 0:.01:1;

for n = nVec;
    for i = 1:length(tVec)
        series(n,i) = (4*A0/((2*n-1)*pi))*sin((2*pi*(2*n-1)*tVec(i))/T);
    end
end

for i = 1:length(tVec)
   sumVec(1,i) = sum(series(:,i));
end

plot(tVec,series(1,:),tVec,series(2,:),tVec,series(3,:),tVec,series(4,:),...
    tVec,series(5,:),tVec,series(6,:),tVec,sumVec);