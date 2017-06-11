
# the number of years to consider 
years = 50

# population in the 1st year(2010)
p = csvread("2010age.csv");
p = p(2:end,:);
p = p';

# death rate at the age of i (in all years)
death = csvread("death_rate.csv");

# population proportion of women at the age of i (in all years)
women_p = csvread("women proportion.csv");
# add to 100*1
women_p = [women_p;0;0];

# beta change from 1 to 2 in 2016
beta = ones(years,1);
beta = beta + [zeros(6,1);ones(years-6,1)];

X = population(years, 1, p, death, women_p);
X1 = population(years, beta, p, death, women_p);
years = size(X,1);
T = 2010:1:(years+2010-1);

plot(T,X,'+1;beta=1;', "markersize", 8,T,X1,'o3;beta=2;', "markersize", 8);
xlabel("year");
ylabel("population");
title("the influence of child policy on Chinese population(2010-)");