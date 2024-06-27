#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $winner = 'winner' ]]
  then
    continue
  fi



  winner_found="$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")"
  if [[ -z $winner_found ]]
  then
    add="$($PSQL "INSERT INTO teams(name) VALUES('$winner')")"
    winner_found="$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")"
  fi

  
  opponent_found="$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")"
  if [[ -z $opponent_found ]]
  then
    add="$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")"
    opponent_found="$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")"
  fi

  game_added="$($PSQL "INSERT INTO games(year, round, opponent_id, winner_id, winner_goals, opponent_goals) VALUES($year, '$round', $opponent_found, $winner_found, $winner_goals, $opponent_goals)")"
  echo $game_added
done


