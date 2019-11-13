# Purpose and Scope
## Application functionality
Snake application is inspired from Snake game that came with old Nokia phones. In this game the user is provided with a snake in a sqaure or rectangular box. Once the game starts snake keeps moving in the direction controlled by the user by pressing up, down, left or right keys. The game also regular produces an apple within the boundries of the box which can be eaten by snake if it passes over the apple. This enables snake to grow and gives certain number of points to the user. If the snake cuts it self or hits any of the boundry of the walls.
The goal of the user is to make snake eat as many apples as much possible without cutting it self and without hitting any of the walls.
## Problem Statement
Today's generation has forgotten about good old days of limited functionality not so smart cellular phones. We want to remind the users good old days of snake fun by giving a bit of twist to the snake game.
## Target Audience
Target audience is mainly the kids who have not got chance to use old Nokia series phones and to teach them how some of their parents enjoyed limited functionality games in limited colors and simple graphics. Also the users who have had first hannd experience with the game to continue the fun on terminal.
<!-- Ques is this read me file -->
<!-- 
Develop a statement of purpose and scope for your application. It must include:
- describe at a high level what the application will do
- identify the problem it will solve and explain why you are developing it
- identify the target audience
- explain how a member of the target audience will use it	
 -->
# Features
<!-- 
Develop a list of features that will be included in the application. It must include:
- at least THREE features
- describe each feature


Ensure that your features include the following language elements and concepts:
- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling


Note: If the features you described do not require you to use all of the above it is likely that your application is not sophisticated enough. Consult with your educator to check your features are sufficient to address the criteria for T1A2-7. 
-->
## Should explain how to use the game
At the start of the game the application should check if user needs to know how to use the game.
If user choses to see the help file it should show the help on screen.
## Should accept user name as input.
It should be possible to give user name as optional command line argument or else ask for user name if command line argument is missing. 
## Should use arrow keys to move snake in up,down,left and right direction.
It should be possible to change the direction of the snake by pressing up, down, left, right keys.
## Should game over if snake cuts it self.
It should detect if the snake's head overlaps on it self and should end the game for the user.
## Should game over if snake hits any of the boundry walls.
It should detect if snake's head goes over any of the boundry walls of the board and should end the game in that case.
## Should produce apple which can be eaten by snake to grow.
The game should produce an apple an place it inside the box. Should detect when snake overlaps on the apple and should regularly produce an apple at a random location within the box everytime previous apple is eaten.
## Snake should move continuously
The game should move the snake continously  in the direction chosen by the user.
## Should should accept difficulty level and automatically move snake in the direction last chosen by the user.
The game should provide option to skill level of the user. Based on skills it should adjust speed of movement of the snake.
## Should track user score and display at end of the game.
The game should reward the user with certain number of points everytime an apple is eaten by the snake and it should keep track of apples eaten by the user as well as update the score. 
## Should allow user to play again without ending the application.
When the game ends due to snake hitting wall or cutting it self. The application should provide option to restart a new game without user needing to start the application again.
## Should allow user to quit during the game play.
During the game play it should allow user to quit the game if user presses the key "Q" or "q"
## Should produce with letters from user name and let user win when they build snake with their name.
The game should produce letters from name of the user as an apple which can be eaten by the snake. On each eating of the apple the letter should be added to the tail of the snake. The user wins when whole name is produced without cutting it self or without hitting the wall.
# User Interaction and Experience
<!-- 
Develop an outline of the user interaction and experience for the application.
Your outline must include:
- how the user will find out how to interact with / use each feature
- how the user will interact with / use each feature
- how errors will be handled by the application and displayed to the user
 -->

# Control Flow Diagram	
<!-- 
Develop a diagram which describes the control flow of your application. Your diagram must:
- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.
 -->

# Implementation Plan
<!-- 
Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item
 -->

# Status Updates
All the status updates can be found [here](development-log.md)