# Description
Snake application is inspired by the Snake game that came with old Nokia phones. 
The goal of the game is to feed the apples produced by the game to the snake without hitting boundaries of the wall and without running over itself. Each time the snake is fed with an apple it grows by one unit.
This game is implemented as a terminal app using Ruby programming language.
# Installation
1. Follow the instructions at [https://www.ruby-lang.org/en/documentation/installation/](https://www.ruby-lang.org/en/documentation/installation/) to download and install Ruby on you computer.

2. Clone or Download the repository from [GitHub](https://github.com/hirengondhiya/name_snake_game)

3. On terminal cd into root directory of the cloned/downloaded repository

4. Install the bundler gem 

This step is optional if you already have installed Bundler gem.
If not on terminal using below command install Bundler gem.
```
Gem install bundler
```
5. Install depencies

This app have dependencies on Ruby gems "Colorize" and "Feep". Use below command to install all the dependencies.
```
bundle install
```

6. In the terminal run bash script to run the file.
```
chmod u+x snake.sh
./snake.sh
```
Alternatively run
```
ruby snake.rb -username="Your Name" -help
```
# Dependencies
This app has dependency on following Ruby gems
1. [Colorize](https://rubygems.org/gems/colorize)
2. [Feep](https://rubygems.org/gems/feep)
# Features
1. Commandline parameters

The application recognizes two command-line parameters.

-username: This optional parameter can be used to pass username to the game. Usage ruby index.rb -username="name of the user" Please note Equal sign (=) after the parameter name must be used to assign the username value to the parameter If the name is more than one word it should be enclosed in quotes (")

-help: This optional parameter can be used to show the help file it does not need to be passed any value to the parameter. If any value is passed to -help it would be ignored.
The snake can be controlled by using arrow keys on the keyboard. 

2. Moving the Snake

Press

Up Arrow: to move the snake in top direction.

Down Arrow: to move the snake in the down direction.

Left Arrow: to move snake in left direction.

Right Arrow: to move the snake in the right direction.

3. Quiting the game

Anytime during the game play the user can Quit the game by pressing "q" or "Q".

4. Pausing the game

Anytime during the game play the user can Pause the game by pressing "p" or "P"

5. Input Error
During the gameplay, if you press any other key except mentioned above the snake will move by one step in the same direction as the previous one and the app will indicate invalid keypress by sounding a beep sound.

The game will continue until the user does not hit any of the four walls or runs its head over its tail.
# Software Development Plan
The software development plan can be accessed from [here](./documentation/development-plan.md)
