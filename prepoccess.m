

D = csvread("death rate.csv");
D = D';
e = zeros(size(D,1)/3,1);
for i=1:22
  e(i) = D(1+(i-1)*3);
end

f = e(1);
e = e(2:end);
d = zeros(99,1);

j = 1;
for i=1:20
    tmp = e(i)/5;
    d(j:1:j+4) = [tmp;tmp;tmp;tmp;tmp];
    j = j+5;
   #elseif
   # tmp = e(i)/4;
   # d(j:1:j+3) = [tmp;tmp;tmp;tmp];
   # j = j+4;
end

d(99) = e(21);
d = [f;d];


C = csvread("2010age.csv");
#C = C(2:end,:);
death_rate = d ./ C;

csvwrite("death_rate.csv",death_rate);