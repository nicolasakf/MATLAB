
classdef Player
    properties
        % self properties
        name;
        % hand properties
        handRank;
        handCombo;
        kickers;
        % stats properties
        roundsWon;
        winingPercentage;
        roundsTied;
        splitPercentage;
        % game properties
        position;
        stack;
        handOdds;
        potOdds;
    end
end