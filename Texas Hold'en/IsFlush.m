
function [handScore,flushHand] = IsFlush(yourHand,board)

    % board parameter check
    if isempty(board)
        handScore = 0;
        flushHand = [];
        return
    end

    handVector = [yourHand;board]; % concatenated vector of your hand + board
    rowsHand = length(handVector);

    handSuits = handVector(:,2); % only suits of hand cards
    dVector = []; % diamonds vector
    sVector = []; % spades vector
    hVector = []; % hearts vector
    cVector = []; % clubs vector
    suitCounter = zeros(1,4); % counter array of how many cards of each suit
    suitVector = []; % vector with 5 or more cards of the same suit

    % determining the suitVector
    for i = 1:rowsHand
        if handVector(i,1) == 1, handVector(i,1) = 14; end % converting Ace card
        if handSuits(i) == 1
            dVector = [dVector;handVector(i,:)];
            suitCounter(1) = suitCounter(1) + 1;
            if suitCounter(1) >= 5, suitVector = dVector; end
        elseif handSuits(i) == 2
            sVector = [sVector;handVector(i,:)];
            suitCounter(2) = suitCounter(2) + 1;
            if suitCounter(2) >= 5, suitVector = sVector; end
        elseif handSuits(i) == 3
            hVector = [hVector;handVector(i,:)];
            suitCounter(3) = suitCounter(3) + 1;
            if suitCounter(3) >= 5, suitVector = hVector; end
        elseif handSuits(i) == 4
            cVector = [cVector;handVector(i,:)];
            suitCounter(4) = suitCounter(4) + 1;
            if suitCounter(4) >= 5, suitVector = cVector; end
        else
            error('Invalid suit number');
        end
    end

    % cleaning suitVector and returning bool value
    if isempty(suitVector)
        handScore = 0;
        flushHand = [];
    else
        handScore = 6;
        flushHand = sort(suitVector,'descend');
        flushHand = flushHand(1:5,:); % final flush hand
    end

end