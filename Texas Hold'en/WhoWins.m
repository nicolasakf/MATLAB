
function winingPlayers = WhoWins(players)
    
%{ parameter validation
if class(players) ~= class(Player())
    error('"players" argument must be array of Player() objects');
end
%}

winingPlayers = [players(1)];

%{ hand combos comparation
for i = 2:length(players)
    if players(i).handRank > winingPlayers(1).handRank
        winingPlayers(1) = players(i);
        winingPlayers = winingPlayers(1:1);
    elseif players(i).handRank == winingPlayers(1).handRank
        winingPlayers = [winingPlayers,players(i)];
    end
end
%}

if length(winingPlayers) == 1
    return
else   
    %{ card values comparation
    comboCards = [];
    for c = 1:length(winingPlayers)
        for r = 1:size(winingPlayers(1).handCombo,1)
            comboCards(r,c) = winingPlayers(c).handCombo(r,1);
        end
    end
    for r = 1:size(comboCards,1)
        ko = 0;
        it = 0;
        duplicates = 0;
        while true
            it = it + 1;
            if comboCards(r,it-ko) > comboCards(r,it+1-ko)
                comboCards(:,it+1-ko) = [];
                winingPlayers(it+1-ko) = [];
                ko = ko + 1;
            elseif comboCards(r,it-ko) < comboCards(r,it+1-ko)
                comboCards(:,it-ko) = [];
                winingPlayers(it-ko) = [];
                ko = ko + 1;
            else
                duplicates = duplicates + 1;
            end
            if length(winingPlayers) == 1
                return
            elseif duplicates == size(comboCards,2)-1
                break
            end
        end
    end
    %}

    %{ kickers comparation
    kickerCards = [];
    for c = 1:length(winingPlayers)
        for r = 1:size(winingPlayers(1).kickers,1)
            kickerCards(r,c) = winingPlayers(c).kickers(r,1);
        end
    end
    for r = 1:size(kickerCards,1)
        ko = 0;
        it = 0;
        duplicates = 0;
        while true
            it = it + 1;
            if kickerCards(r,it-ko) > kickerCards(r,it+1-ko)
                kickerCards(:,it+1-ko) = [];
                winingPlayers(it+1-ko) = [];
                ko = ko + 1;
            elseif kickerCards(r,it-ko) < kickerCards(r,it+1-ko)
                kickerCards(:,it-ko) = [];
                winingPlayers(it-ko) = [];
                ko = ko + 1;
            else
                duplicates = duplicates + 1;
            end
            if length(winingPlayers) == 1
                return
            elseif duplicates == size(kickerCards,2)-1
                break
            end
        end
    end
    %}
    
end

end