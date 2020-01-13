% calcula zeta a partir do overshoot

function zeta = find_zeta(os)

    % os em (%)
    zeta = abs(log(os/100))/sqrt(pi^2+(log(os/100)^2));

end