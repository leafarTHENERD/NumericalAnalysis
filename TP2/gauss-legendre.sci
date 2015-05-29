function si = elemento_si_jacobi(i)
	si = return((i*i)/(4*i*i  - 1));
endfunction

function jn = matriz_jacobi_grau_n(N)
	// Objetivo: Calcular uma matriz de Jacobi de grau N
	jn = zeros(N,N);
	for i=2:N
		si = elemento_si_jacobi(i-1);
		jn(i-1, i) = j(i, i-1) = si;
	end
endfunction

function [t, w] = calcula_abscissas_T_pesos_W(matriz_jacobi, n)
	autovalores = spec(matriz_jacobi);
	t = zeros(n);
	w = zeros(n);
endfunction

function integral = quadratura_gauss_legendre(fx, n, a, b)
	matrizJacobiana = matriz_jacobi_grau_n(n);
	[w, t] = calcula_abscissas_T_pesos_W(matrizJacobiana, n);

	soma = 0
	for i=1:n
		xi = a + ((( t(i) + 1)*( b - a )) / 2);
		soma = soma + w(i) * fx(xi);
	end

	integral = return(soma*( b - a) / 2);
endfunction