fan()
{
  if test $1 == '1';
  then
    gpio -g mode 4 up
  elif test $1 == '0';
  then
    gpio -g mode 4 down
  fi
}
alias temp='vcgencmd measure_temp'
alias ledred='gpio -g write 17'
alias ledgreen='gpio -g write 27'
alias switch1='gpio -g read 24'
alias switch2='gpio -g read 23'
