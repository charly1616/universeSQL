#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  ELEMENT_AN=$1
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_AN=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  else
    ELEMENT_AN=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi

  if [[ -z $ELEMENT_AN ]]
  then
    echo I could not find that element in the database.
  else
    ELEMENT_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_AN")
    echo "$ELEMENT_RESULT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
    do
      AN=$ATOMIC_NUMBER
      NA=$NAME
      SY=$SYMBOL
      TY=$TYPE
      AM=$ATOMIC_MASS
      ME=$MELTING_POINT_CELSIUS
      BO=$BOILING_POINT_CELSIUS
      echo "The element with atomic number $AN is $NA ($SY). It's a $TY, with a mass of $AM amu. $NA has a melting point of $ME celsius and a boiling point of $BO celsius."
    done
  fi
  
else
  echo Please provide an element as an argument.
fi
