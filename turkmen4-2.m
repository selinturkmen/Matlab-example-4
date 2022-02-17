% FIRST NAME, LAST NAME = Selin Türkmen

clear all
close all

%% Question 1
%% a)

for w =500;
    x1 = xcalculator(w);
end

for w =2000;
    x2 = xcalculator(w);
end

disp('X1 in meters:')
disp(x1)
disp('X2 in meters:')
disp(x2)
%%  b)
x3 =[];
w =[0:3000];
for i = [1:length(w)]
    w =[0:3000];
    x3(1,i) = xcalculator(w(1,i));
end

plot(w,x3)
xlabel('W Values(N)')
ylabel('X values(m)')
%the function of this question is at the end of my code
%% Question 2
deck = [ 1 2 3 4 5 6 7 8 9 10 10 10 10 11];


userscore=0;% number of player win
dealerscore=0;% number of dealer win

for roundnum=1:3
    fprintf('---Round Number %d---\n',roundnum);
    usersum=0;
    dealersum=0;
    usercard1=randi(length(deck));
    usercard2=randi(length(deck));  
    fprintf('User Card 1 : %d\n',usercard1);
    fprintf('User Card 2 : %d\n',usercard2);
    usersum=usersum+usercard1+usercard2;
    fprintf('User Sum : %d\n',usersum);
    dealercard1=randi(length(deck));
    dealercard2=randi(length(deck)); 
    fprintf('Dealer Card 1 : %d\n',dealercard1);
    dealersum=dealersum+dealercard1+dealercard2;
    x=1;
    while true
        response=input('Draw another card?(Yes/No)\n','s');
        if(strcmp(response, "Yes") == 1)
            % random index from deck
            usercard3=randi(length(deck));
            fprintf('User Card %d : %d\n',x+2,usercard3);
             % player sum
            usersum=usersum+usercard3;
            fprintf('User Sum : %d\n',usersum);
            % random index from deck
            dealercard3=randi(length(deck));
            % dealer sum
            dealersum=dealersum+deck(dealercard3);
        else
            break;
        end
        x=x+1;
    end
    fprintf('Dealer Sum : %d\n',dealersum);
    % display each round winning
    if usersum<dealersum || usersum>21
        if dealersum<=21 
            fprintf('Dealer wins this round!\n');
            dealerscore=dealerscore+1;
        elseif dealersum>21
            userscore=userscore+1;
                fprintf('User wins this round!\n');            
        end
        
    elseif usersum==dealersum 
        fprintf('This round ends with a tie!\n');
    elseif dealersum>21 && usersum>21
        fprintf('This round ends with a tie!\n');
    else
        if usersum>dealersum || dealersum>21
            if usersum<=21
                fprintf('User wins this round!\n');
                userscore=userscore+1;
            elseif usersum>21
                fprintf('Dealer wins this round!\n');
                dealerscore=dealerscore+1;
            end
        end
    end
end
% final win between them
if dealerscore>userscore
    fprintf('Dealer Wins! Score %d-%d\n',userscore,dealerscore);
else
    if userscore==dealerscore
        fprintf('Its a Tie! Score %d-%d\n',userscore,dealerscore);
    else
        fprintf('User Wins! Score %d-%d\n',userscore,dealerscore);
    end
end



%% Functions:
%1st question's function 
function x = xcalculator(w)
k1=10000;
k2=15000;
d=0.1;
check = w/k1;
if d>check
    x = w/k1;
elseif d<=check
    x = (w+2*k2*d)/(k1+2*k2);
end
end
%% HW END