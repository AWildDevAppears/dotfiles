killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload right &
    MONITOR=$m polybar --reload center &
  done
else
  polybar --reload left &
  polybar --reload right &
  polybar --reload center &
fi
