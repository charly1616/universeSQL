#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo $1
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")


  echo "Welcome to My Salon, how can I help you?"
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    if [[ ! $SERVICE_ID =~ ^[0-9]+$ ]]
    then
      continue
    fi
    echo -e "$SERVICE_ID) $NAME"
  done
  
  read SERVICE_ID_SELECTED


  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      CUSTOMER_ENTERED=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      echo $CUSTOMER_ENTERED
    fi

    echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
    read SERVICE_TIME
    NOSPACES='s/^ *| *$//g'
    CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')
    SERVICE_TIME=$(echo $SERVICE_TIME | sed -E 's/^ *| *$//g')

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    APPOINTMENT_ENTERED=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME') ")
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}


MAIN_MENU




