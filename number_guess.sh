#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"


echo Enter your username:
read USERNAME


USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

if [[ -z $USER_ID ]]
then
  #Tells the user that its first time
  echo Welcome, $USERNAME! It looks like this is your first time here.
  #Add the user to the database
  USER_ADD=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MAX(guesses) FROM games WHERE user_id = $USER_ID")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

NUMBER=$(($RANDOM%(1001)))

GUESSES=1

echo Guess the secret number between 1 and 1000:
read GUESS
while [[ "$NUMBER" != "$GUESS" ]]
do
  #Verify if the input is a number
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    #Give a hint to the player
    if [[ $GUESS < $NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi

  else
    #Tell the user the bad input
    echo That is not an integer, guess again:
  fi
  #Read again
  read GUESS

  #Count the guess made
  GUESSES=$(( $GUESSES + 1 ))
done

echo You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!
INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, guesses, number) VALUES($USER_ID,$GUESSES, $NUMBER)")
