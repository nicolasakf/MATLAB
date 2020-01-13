
function players = HandAnalyser(es,numIt,yourHand,opponentsHands,board,opponentsNames,infoBool)

% INSTRUCTIONS
%{
es : error setting (acceptable error)
numIt : max number of iterations (hands played)
yourHand : 2x2 matrix
oponentsHands : Nx2 matrix, with N multiple of 2, from 2 up to 16
opponentsNames : cell of char type, e.g. {name1,name2,...nameN}
board : [] for preflop, 3x2 for flop only, 4x2 for until turn and 5x2 for full board
%}

%{ parameter validation
% parameter length
if size(board,1) ~= 0 && size(board,1) ~= 3 && size(board,1) ~= 4 && size(board,1) ~= 5
    error('Please enter a compatible "board" matrix');
elseif length(yourHand) ~= 2
    error('Please enter a compatible "yourHand" matrix');
elseif size(yourHand,2) ~= 2 || size(opponentsHands,2) ~= 2 || size(board,2) ~= 2
    error('Inputed matrix is not compatible');
end
% parameter duplicates
allCardsVector = [yourHand;opponentsHands;board];
if length(unique(allCardsVector,'rows')) ~= length(allCardsVector)
    error('The given hands and/or board arguments have duplicated cards');
end
% parameter range
cardValueRange = any(allCardsVector > 13);
cardSuitRange = any(allCardsVector > 4);
zeroAndNegative = any(allCardsVector <= 0);
if zeroAndNegative(1) || zeroAndNegative(2) || cardValueRange(1) || cardSuitRange(2)
    error('Unvalid card value and/or suit entered')
end
%}

tic; % starting stopwatch

cardsVector = 1:13; % 1 = Ace to 13 = King
suitsVector = 1:4; % 1 = diamonds, 2 = spades, 3 = hearts and 4 = clubs

initDeck = []; % empty deck
deadCards = [yourHand;opponentsHands;board]; % cards that are no longer in the deck
%{ filling the deck
it = 1;
for c = cardsVector
    card = cardsVector(c);
    for s = suitsVector
        suit = suitsVector(s);
        flag = 1;
        for i = 1:length(deadCards)
            cardValue = deadCards(i,1);
            cardSuit = deadCards(i,2);
            if cardValue == card;
                if cardSuit == suit;
                    flag = 0;
                end
            end
        end
        if flag
            initDeck(it,1) = card;
            initDeck(it,2) = suit;
            it = it+1;
        end
    end
end
%}

%{ setting your general parameters
you = Player();
you.name = 'You';
you.roundsWon = 0;
you.winingPercentage = 0;
you.roundsTied = 0;
you.splitPercentage = 0;
%}

players = [you]; % vector with all players

%{ setting opponents general parameters
numOpponents = length(opponentsHands)/2;
if numOpponents ~= length(opponentsNames), error('"opponentsHands" and "opponentsNames" must have the same length'); end
for i = 1:numOpponents
    opponent = Player();
    opponent.name = opponentsNames{i};
    opponent.roundsWon = 0;
    opponent.winingPercentage = 0;
    opponent.roundsTied = 0;
    opponent.splitPercentage = 0;
    players = [players,opponent];
end
%}

ea = ones(1,length(players))*1000; % vector with every player aprox. winingPercentage error
prevPercent = ones(1,length(players))*1000; % vector with previous wining percentages
%{ iteration for loop
for it = 1:numIt
    
    %{ generating random board
    deck = initDeck;
    newBoard = board;
    for i = 1:5-length(board)
        a = .5;
        b = length(deck)+.4999;
        deckIndex = int8(a+(b-a).*rand(1));
        newBoard = [newBoard;deck(deckIndex,:)];
        deck(deckIndex,:) = [];
    end
    %}
    
    %{ defining what is your hand
    [yourHandRank,yourHandCombo,yourKikcers] = WhatsYourHand(yourHand,newBoard,false); % defining your hand
    players(1).handRank = yourHandRank;
    players(1).handCombo = yourHandCombo;
    players(1).kickers = yourKikcers;
    %}
   
    %{ defining opponents hands
    i = 1;
    for n = 1:2:numOpponents*2
        i = i + 1;
        opponentHand = opponentsHands(n:n+1,:);
        [opponentHandRank,opponentHandCombo,opponentKickers] = WhatsYourHand(opponentHand,newBoard,false);    
        players(i).handRank = opponentHandRank;
        players(i).handCombo = opponentHandCombo;
        players(i).kickers = opponentKickers;
    end
    %}
    
    winingPlayer = WhoWins(players); % outputs the wining player
    %{ updating wining player stats
    for p = winingPlayer
        for i = 1:length(players)
            try
                if players(i).name == p.name
                    if length(winingPlayer) == 1
                        players(i).roundsWon = players(i).roundsWon + 1;
                        players(i).winingPercentage = players(i).roundsWon/it*100;
                        if prevPercent(i) == 1000
                            prevPercent(i) = players(i).winingPercentage;
                        else
                            ea(i) = abs(players(i).winingPercentage - prevPercent(i))/players(i).winingPercentage*100;
                            prevPercent(i) = players(i).winingPercentage;
                        end
                    else
                        players(i).roundsTied = players(i).roundsTied + 1;
                        players(i).splitPercentage = players(i).roundsTied/it*100;
                    end
                end
            catch
                continue
            end
        end
    end
    %}
    
    if mean(ea) < es % error breaking condition
        break
    end
    
end
%}

if infoBool
    'Wining %'
    players.winingPercentage
    'Split %'
    players.splitPercentage
    it
end
toc; % stoping stopwatch

end