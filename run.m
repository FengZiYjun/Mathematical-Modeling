
C = csvread("2010age.csv");
C = C(2:end,:);
C = C';

death = csvread("death_rate.csv");
women_p = csvread("women proportion.csv");
women_p = [women_p;0;0];

X = population(1, C, death,women_p);
X1 = population(2, C, death,women_p);
years = size(X,1);
T = 2010:1:(years+2010-1);

plot(T,X,'+1;beta=1;', "markersize", 8,T,X1,'o3;beta=2;', "markersize", 8);
xlabel("year");
ylabel("population");
title("predict");