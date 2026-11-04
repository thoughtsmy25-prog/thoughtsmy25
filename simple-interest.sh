#!/usr/bin/env bash

# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time period (years): " time

# Accept non-negative whole numbers or decimals.
number_regex='^[0-9]+([.][0-9]+)?$'

if [[ ! $principal =~ $number_regex || ! $rate =~ $number_regex || ! $time =~ $number_regex ]]; then
  echo "Error: Please enter valid non-negative numbers."
  exit 1
fi

simple_interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
total_amount=$(awk -v p="$principal" -v si="$simple_interest" 'BEGIN { printf "%.2f", p + si }')

echo
echo "----- Simple Interest Result -----"
echo "Principal Amount : $principal"
echo "Interest Rate    : $rate%"
echo "Time Period      : $time years"
echo "Simple Interest  : $simple_interest"
echo "Total Amount     : $total_amount"
