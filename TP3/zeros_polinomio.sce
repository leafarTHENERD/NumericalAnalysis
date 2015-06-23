function z=zeros_do_polinomio(grau_pol, coefs_pol)
    // Objetivo : Calcular raizes dado o grau de um polinomio
    //            e os seus coeficientes.
    hessenberg = zeros(grau_pol, grau_pol);

    for i=1:grau_pol
        hessenberg(1, i) = -coefs_pol(i+1)/coefs_pol(1);
    end

    for i=2:grau_pol
        hessenberg(i, i-1) = 1;
    end

    z=spec(hessenberg);
endfunction

poli_file = mopen("polinomios.dat", "r");
zeros_file = mopen("zeros.sai", "w");

grau = mfscanf(poli_file,"%d");
while grau
    coefs = zeros(grau+1);
    for i=1:grau+1
        coefs(i) = mfscanf(poli_file,"%d");
    end

    zero = zeros_do_polinomio(grau, coefs);

    for i=1:grau
        mfprintf(zeros_file, "%d ",zero(i));
    end
    mfprintf(zeros_file, "\n");

    grau = mfscanf(poli_file,"%d");
end

mclose(poli_file);
mclose(zeros_file);
