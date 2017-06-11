
X = population(1);
years = size(X,1);
T = 2010:1:(years+2010-1);

plot(T,X,'+1;beta=1;', "markersize", 8);
xlabel("year");
ylabel("population");
title("predict");