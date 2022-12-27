function simple_go_no_go_task_2()
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
[wptr,rect]=Screen('Openwindow',max(Screen('Screens')),[128 128 128 ],[0 0 800 600]);


xCenter = rect(3)/2;
yCenter = rect(4)/2;


%Create textures



% 1- draw a image in the center of the screen.

sadFaceData=imread('sadface.jpg');
sadFaceTexture=Screen('MakeTexture',wptr,sadFaceData);



Screen('DrawTexture',wptr,sadFaceTexture);
Screen('Flip', wptr);

% 2- Wait for the user to press a key


KbWait();


% 3- Clear the image from Screen

Screen('Flip', wptr) ;

% 4- wait for the user to press a key
WaitSecs(0.5);
KbWait();


% 5- show the first image with another image (distractor) on screen

angryFaceData=imread('angryface.jpg');
angryFaceTexture=Screen('MakeTexture',wptr,angryFaceData);




%Define destination rects
Rect1=[xCenter/2-xCenter/3,yCenter-yCenter/2 ,xCenter/2+xCenter/3,yCenter+yCenter/2 ];
Rect2=[xCenter/(2/3)-xCenter/3,yCenter-yCenter/2,xCenter/(2/3)+xCenter/3,yCenter+yCenter/2];

stimuli(1).Name = [sadFaceTexture];
stimuli(2).Name = [angryFaceTexture];


for i=1:5
    
    
    randIndex = randperm(2);
    
    
    %Draw them
    Screen('DrawTexture',wptr,stimuli(randIndex(1)).Name,[],Rect1);
    Screen('DrawTexture',wptr,stimuli(randIndex(2)).Name,[],Rect2);
    Screen('Flip',wptr);
    
    %Wait for keypress and clear
    WaitSecs(0.5);
    KbWait();
    
    i = i + 1;
    
end




Screen('Flip',wptr);
WaitSecs(2);
clear Screen





end





