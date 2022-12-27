function simple_go_no_go_task_1()
% The function  
    % 1- draw a image in the center of the screen.
    % 2- Wait for the user to press a key.
    % 3- Clear the image from Screen
    % 4- wait for the user to press a key.
    % 5- show the first image with another image (distractor) on screen.
    % 6- Wait for the user to press a key.
    % 7- Repeat this trial for 5 time. (the location of image and distractor image should be defined randomly for each trials)


%Screen Test
Screen('Preference','SkipSyncTests',1);
%Open the screen
[wptr,rect]=Screen('Openwindow',max(Screen('Screens')),[128 128 128 ],[0 0 400 300]);


centerX = rect(3)/2;
centerY = rect(4)/2; 


% target stimulus properties
targetColor = [255 0 0];
radius = 10;


% distractor stimulus properties
distractorColor = [0 255 0];
radius = 10;




% 1- draw a image in the center of the screen.

circleRect = [centerX ,centerY  , centerX  , centerY ] + [-radius, -radius , radius, radius] ;

Screen('FillOval', wptr , targetColor , circleRect);
Screen('Flip', wptr);

% 2- Wait for the user to press a key


KbWait();


% 3- Clear the image from Screen
 
Screen('Flip', wptr) ;

% 4- wait for the user to press a key
WaitSecs(0.5);
KbWait();


% 5- show the first image with another image (distractor) on screen


Stimuli(1).imagerect = [centerX ,centerY ,centerX ,centerY ].*[0.5 1 0.5 1] + [-radius, -radius , radius, radius];
Stimuli(2).imagerect = [centerX ,centerY ,centerX ,centerY ].*[1.5 1 1.5 1]+ [-radius, -radius , radius, radius];


 for i=1:5
    
    randIndex = randperm(2);
    
    Screen('FillOval', wptr , targetColor , Stimuli(randIndex(1)).imagerect);
    Screen('FillOval' , wptr , distractorColor , Stimuli(randIndex(2)).imagerect);
    
    Screen('Flip', wptr);
    
    WaitSecs(0.5);
    KbWait();
    
    i = i + 1;
    
 end

WaitSecs(1); 
clear Screen
end

