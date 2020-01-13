
function [handRank,hand,kickers] = WhatsYourHand(yourHand,board,infoBool)
    
% INSTRUCTIONS
%{
yourHand : 2x2 matrix
oponentsHands : Nx2 matrix, with N multiple of 2, from 2 up to 16
board : [] for preflop, 3x2 for flop only, 4x2 for until turn and 5x2 for full board
%}

[straightScore,straightHand] = IsStraight(yourHand,board);
if straightScore ~= 0
    [straightFlushScore,straightFlushHand] = IsFlush(straightHand(1:2,:),straightHand(3:5,:));
    if straightFlushScore ~= 0
        handRank = 9;
        hand = straightFlushHand;
        kickers = [];
    else
        [flushScore,flushHand] = IsFlush(yourHand,board);
        [comboScore,comboHand,kickers] = IsOtherCombo(yourHand,board);

        handCombos = [flushScore,straightScore,comboScore];
        handRank = max(handCombos);

        if handRank == 5
            hand = straightHand;
            kickers = [];
        elseif handRank == 6
            hand = flushHand;
            kickers = [];
        else
            hand = comboHand;
        end
    end
else
    [flushScore,flushHand] = IsFlush(yourHand,board);
    [comboScore,comboHand,kickers] = IsOtherCombo(yourHand,board);

    handCombos = [flushScore,straightScore,comboScore];
    handRank = max(handCombos);

    if handRank == 5
        hand = straightHand;
        kickers = [];
    elseif handRank == 6
        hand = flushHand;
        kickers = [];
    else
        hand = comboHand;
    end
end

if infoBool

    handCombosNames = {'High Card','One Pair','Two Pair','Set','Straight',...
                       'Flush','Full House','Four of a Kind','Straight Flush'};
    cardNames = {'A','2','3','4','5','6','7','8','9','10','J','Q','K','A'};
    suitNames = {'d','s','h','c'};

    yourHandString = {};
    for i = 1:rowsYourHand
        yourHandString{i,1} = [cardNames{yourHand(i,1)},suitNames{yourHand(i,2)}];
    end       
    boardString = {};
    for i = 1:rowsBoard
        boardString{i,1} = [cardNames{board(i,1)},suitNames{board(i,2)}];
    end
    for i = 1:length(boardString)-length(yourHandString)
        yourHandString{end+1} = '';
    end

    sprintf('Hand Rank: %s', handCombosNames{handRank})
    table(yourHandString,boardString,'VariableNames',{'YourHand','Board'})

end
    
end