
function [handScore,straightHand] = IsStraight(yourHand,board) % consertar prob da seq A a 5

    %{ board parameter check
    if isempty(board)
        handScore = 0;
        straightHand = [];
        return
    end
    %}

    handVector = [yourHand;board]; % vector of your hand + board
    handVector = sortrows(handVector,-1); % sorting handVector
    %{ fixing Ace card
    if handVector(1,1) == 1
        handVector = [handVector;[14,handVector(1,2)]];
    end
    %}
    
    straightHand = []; % answer vector
    for it = 1:length(handVector)-4
        straightHand = handVector(it,:);
        count = 1;
        for i = it+1:length(handVector)
            if handVector(it,1) == handVector(i,1) + count
                straightHand = [straightHand;handVector(i,:)];
                count = count + 1;
            end
        end
        %straightHand
        if length(straightHand) >= 5
            break
        else
            straightHand = [];
        end
    end

    if isempty(straightHand)
        handScore = 0;
    else
        handScore = 5;
        straightHand = straightHand(1:5,:);
    end
        
end