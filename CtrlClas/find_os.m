% calcula o overshoot a partir do zeta

function os = find_os(zeta)

    os = exp(-zeta*pi/sqrt(1-zeta^2))*100;

end