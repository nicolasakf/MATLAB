
function [handScore,comboHand,kickers] = IsOtherCombo(yourHand,board)          
    
handVector = [yourHand;board]; % concatenated vector of your hand + board
rowsHand = length(handVector);
%{ fixing Ace card
for i = 1:rowsHand
    if handVector(i,1) == 1, handVector(i,1) = 14; end
end
%}
handVector = sortrows(handVector,-1); % sorting handVector (decreasing order) 

pairOne = [];
pairTwo = [];
set = [];
quad = [];
i = 0;
for it = 1:rowsHand
    i = i + 1;
    if i <= length(handVector)-1
        %testing for pair
        if handVector(i,1) == handVector(i+1,1)
            if i <= length(handVector)-2
                %testing for set
                if handVector(i+1,1) == handVector(i+2,1)
                    if i <= length(handVector)-3
                        %testing for quad
                        if handVector(i+2,1) == handVector(i+3,1)
                            quad = [handVector(i,:);handVector(i+1,:);handVector(i+2,:);handVector(i+3,:)];
                            handVector(i:i+3,:) = [];
                            handVector = sortrows([handVector;pairOne;set],-1);
                            i = i - 1;
                            if i < 0, i = 0; end
                            break
                        else
                            if isempty(set)
                                set = [handVector(i,:);handVector(i+1,:);handVector(i+2,:)];
                                handVector(i:i+2,:) = [];
                                i = i - 1;
                                if i < 0, i = 0; end
                            else
                                pairOne = [handVector(i,:);handVector(i+1,:)];
                                handVector(i:i+1,:) = [];
                                i = i - 1;
                                if i < 0, i = 0; end
                            end
                        end
                    else
                        if isempty(set)
                            set = [handVector(i,:);handVector(i+1,:);handVector(i+2,:)];
                            handVector(i:i+2,:) = [];
                            i = i - 1;
                            if i < 0, i = 0; end
                        else
                            pairOne = [handVector(i,:);handVector(i+1,:)];
                            handVector(i:i+1,:) = [];
                            i = i - 1;
                            if i < 0, i = 0; end
                        end
                    end
                else
                    if isempty(pairOne)
                        pairOne = [handVector(i,:);handVector(i+1,:)];
                        handVector(i:i+1,:) = [];
                        i = i - 1;
                        if i < 0, i = 0; end
                    elseif isempty(pairTwo)
                        pairTwo = [handVector(i,:);handVector(i+1,:)];
                        handVector(i:i+1,:) = [];
                        i = i - 1;
                        if i < 0, i = 0; end
                    end
                end
            else
                if isempty(pairOne)
                    pairOne = [handVector(i,:);handVector(i+1,:)];
                    handVector(i:i+1,:) = [];
                    i = i - 1;
                    if i < 0, i = 0; end
                elseif isempty(pairTwo)
                    pairTwo = [handVector(i,:);handVector(i+1,:)];
                    handVector(i:i+1,:) = [];
                    i = i - 1;
                    if i < 0, i = 0; end
                end
            end
        end
    end
end

%{ hand scoring
kickers = handVector;
if isempty(pairOne) && isempty(pairTwo) && isempty(set) && isempty(quad)
    handScore = 1;
    comboHand = handVector(1,:);
    kickers(1,:) = [];
    if length(kickers) > 4, kickers = kickers(1:4,:); end
else
    if isempty(quad)
        if isempty(pairOne)
            if isempty(set)
            else
                handScore = 4;
                comboHand = set;
                kickers = kickers(1:2,:);
            end
        else
            if isempty(set)
                if isempty(pairTwo)
                    handScore = 2;
                    comboHand = pairOne;
                    kickers = kickers(1:3,:);
                else
                    handScore = 3;
                    comboHand = [pairOne;pairTwo];
                    kickers = kickers(1,:);
                end
            else
                handScore = 7;
                comboHand = [set;pairOne];
                kickers = [];
            end
        end 
    else
        handScore = 8;
        comboHand = quad;
        kickers = kickers(1,:);
    end
end
%}           

end