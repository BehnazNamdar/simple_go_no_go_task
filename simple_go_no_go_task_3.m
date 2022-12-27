function simple_go_no_go_task_3()
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
sadFaceData = imresize(sadFaceData,[200, 200]);
sadFaceTexture=Screen('MakeTexture',wptr,sadFaceData);


Screen('DrawTexture',wptr,sadFaceTexture);
Screen('Flip', wptr);

% 2- Wait for the user to press a key


KbWait();


% 3- Clear the image from Screen

Screen('Flip', wptr) ;





% 5- show the first image with another image (distractor) on screen


angryFaceData=imread('angryface.jpg');
angryFaceData = imresize(angryFaceData,[200, 200]);
angryFaceTexture=Screen('MakeTexture',wptr,angryFaceData);



for i=1:5
    % alternative 1 
%  while 1 
%     randX = round((rect(3)-200).*rand(2,1));
%     randY = round((rect(4)-200).*rand(2,1)); 
%     if abs(randX(1)-randX(2))> 200 && abs(randY(1)-randY(2))> 200
%         break;
%     end
%  end
 

while 1 
    for a=1:3
            i= randi(n1);
            loc1(a) = vector1(i); 
            loc2(a) = vector2(i);
         
            if loc1(a-1) == [] 
                WaitSecs(0.01);
                
            elseif abs(loc1(a)-loc1(a-1))> 48 && abs(loc2(a)-loc2(a-1))> 48 
            break;
            end
    end
        
    
end

 

X=true;
while X

        
        for a=2:3
            if (loc1(a)-loc1(a-1))>48
                X=false;
            end
        end
end

        
      % alternative 2    
        
        %Define destination rects

    randX = round((rect(3)-200).*rand(2,1));
    randY = round((rect(4)-200).*rand(2,1));
    
    while abs(randX(1)-randX(2))< 200 || abs(randY(1)-randY(2))< 200
        
        randX = round((rect(3)-200).*rand(2,1));
        randY = round((rect(4)-200).*rand(2,1));
    end 
        
        
        
    
    Rect1 = [randX(1),randY(1),randX(1)+200,randY(1)+200]; 
    Rect2 = [randX(2),randY(2),randX(2)+200,randY(2)+200]; 
    
    

    %Draw them
    Screen('DrawTexture',wptr,angryFaceTexture,[],Rect1);
    Screen('DrawTexture',wptr,sadFaceTexture,[],Rect2);
    WaitSecs(0.5);
    KbWait();
    Screen('Flip',wptr);
    
    
   
    
    %Wait for keypress and clear
    WaitSecs(0.5);
    KbWait();
    Screen('Flip',wptr);

    
    
end



WaitSecs(2);
clear Screen


end







