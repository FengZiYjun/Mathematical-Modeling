function X = population(_beta, first_year_population, death_rate, women_p)
  #---------Interface Instruction---------
  #     
  #   _beta: t*1 vector,  average number of children per woman give birth to
  #   first_year_population: 1*m vector
  #   death_rate:¡¡(m+1)*1 vector
  #   women_p: m*1 vector, woman proportion at each age
  
    # m: the largest age of human
    m = 100;
    # t: the number of years to consider
    t = 50;
    # the suitable fertility age of all women is a-b
    a = 20;
    b = 40;


    # population at the age of i in year t
    # i: 0-m
    x = ones(t,m);

    # --------- begin to initialize ---------
    # population in the first year
    x(1,:) = first_year_population;

    # death rate at the age of i (in all years)
    # i: 0-m   
    # death(0) is the death rate of new-born infants
    death = zeros(m+1,1);
    death = death_rate;

    # average number of children per woman give birth to in year t
    beta = zeros(t);
    # beta = sum(fertility(:,[a,b]),2);
    beta = beta + _beta;

    # population proportion of women at the age of i (in all years) is 0.487
    # i=1:m
    k = zeros(m);
    k = women_p;


    # -----------  end ----------------------

    # h: fertility mode at the age of i
    h = zeros(m);
    for i=18:m
      h(i) = ((i-18)^4*exp(-(i-18)/2))/768;
    end

    # fertility rate of women at the age of i in year t
    # i: 1-m
    fertility = zeros(t,m);
    for i=1:t
      for j=1:m
        fertility(i,j) = beta(i)*h(j);
       end
    end

    # born population in year t
    #born = zeros(t);
    #born(1) = sum((fertility(1,[a:b])).*(k([a:b])).*(x(1,[a:b])),2);

    # the number of infants born in year t
    #x(:,1) = (1-death(:,1)).*born;


    # parameter matrix
    A = zeros(m,m);
    for i=1:m-1
      A(i+1,i) = 1 - death(i);
    end

    B = zeros(m,m);
    for i=a:b
      B(1,i) = (1-death(1))^2*k(i)*h(i);
    end

    # recursion formula
    for i=1:t
      x(i+1,:) = ( A * (x(i,:)') + beta(i) .* B * (x(i,:)') )';
     # 1*m  = m*m  m*1      +  1*1 m*m  m*1
    end

    # calculate the total population
    X = sum(x,2);

endfunction
