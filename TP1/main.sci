function coeficientes = polinomio_interpolador(n, x, y)
// Objetivo : Calcular os coeficientes do polinômio interpolador de grau n
//
//      POLINOMIO_INTERPOLADOR(N, X, Y) calcula os coeficientes 
//      do polinômio interpolador de grau N utilizando o método
//      das diferenças divididas (Polinômio de Newton) a partir
//      das N+1 coordenadas representadas em X(abscissas) e 
//      Y(ordenadas).
//
    if n < 1
        error('grau do polinomio < 1');
    end

    for i = 1:(n+1)
        c(i) = y(i);
    end

    // contruindo as diferenças divididas
    for k = 1:n
        for i = (n+1):-1:(k+1)
            c(i) = (c(i) - c(i-1)) / (x(i) - x(i-k));
        end
    end

    // calculando os coefiecientes do polinômio interpolador
    for k = n:-1:1
        for i = k:n
            c(i) = c(i) - c(i+1)*x(k);
        end
    end
    coeficientes = c
endfunction

// recebe o grau do polinômio
N = input('');
N = int(N);

for i = 1:N+1
    X(i) = input('');
    Y(i) = input('');
end

coef = polinomio_interpolador(N, X, Y);

coef_len = length(coef);
if coef_len > 0
    P_X = poly(coef, 'x', 'coeff');
    print(%io(2), P_X);
end