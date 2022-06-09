#!/bin/bash

echo "Run clingo and extract stable models..."
IFS=' ' read -ra raw_schedule <<< "$(clingo -V0 0 example.lp scheduler.lp | head -n -2)"
echo "  ...done!"
sch_s=()
sch_h=()
sch_w=()
echo "Extract information and parse models..."
for l in "${raw_schedule[@]}"; do
  s=$(echo "$l" | grep -o 'mac[0-9]\+')
  h="$(echo "$l" | grep -o 'h[0-9]\+')"
  h="${h:1}"
  w="$(echo "$l" | grep -o ',[a-z][a-z][a-z]')"
  w="${w:1}"
  echo "$s $h $w"
  sch_s+=("$s")
  sch_h+=("$h")
  sch_w+=("$w")
done
echo "  ...done!"

declare -A H=( [8]=1 [10]=2 [14]=4 [16]=5 )
declare -A W=( ["mon"]=1 ["tue"]=2 ["wed"]=3 ["thu"]=4 ["fri"]=5 )

declare -A S
m=7 # Columns
n=5 # Rows

echo "Initialize size matrix..."
for ((i=1;i<=n;i++)) do
  for ((j=1;j<=m;j++)) do
    S[$i,$j]=0
  done
done
echo "  ...done!"

echo "Populate size matrix..."
k=$(( ${#raw_schedule} - 1))
for ((i=0;i<k;i++)) do
  x="${H[${sch_h[i]}]}"
  y="${W[${sch_w[i]}]}"
  echo "${sch_h[i]}, ${sch_w[i]} -> $x $y"
  S[$x,$y]=$(( S[$x,$y] + 1 ))
done
echo "  ...done!"

T_rows=("Schedule", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
T_cols=("08h00", "10h00", "12h00", "14h00", "16h00")

separ="+--------+------+-------+---------+--------+------+--------+"
printf "%s\n|" "$separ"
for ((i=0;i<m;i++)) do
  printf "%s|" "${T_rows[i]}"
done
#for ((i=0;i<n;i++)) do
  #printf "%s\n|%s|" "$separ" "${T_cols[i]}"
  #for ((j=0;j<m;j++)) do
    #printf
