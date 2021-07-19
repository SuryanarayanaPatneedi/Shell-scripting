#!/bin/bash

sample() {
  echo Hello , I am a Sample function
  echo Value of a = ${a}
  b=200

}

## Main Program

## Call the function
a=100
sample ABC
echo Value of b = ${b}
