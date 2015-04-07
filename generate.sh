#!/bin/bash
RADIUS="0"
while getopts "r:" OPT; do case $OPT in
    r) RADIUS="$OPTARG" ;;
esac; done
shift $((OPTIND-1))

SIZE="$1"
INACTIVE="$2"
ACTIVE="$3"
BUTTON="$4"
[[ "$BUTTON" ]] || BUTTON="$ACTIVE"

if ! [[ -d "${SIZE}" ]]; then
    echo "That size is not available."
    exit 1
elif ! [[ -e "${SIZE}/tl${RADIUS}.xpm" ]]; then
    echo "That corner radius is not available."
    exit 1
fi

for f in bottom left right title-1 title-2 title-3 title-4 title-5; do
    sed s:%COLOR%:$ACTIVE: ${SIZE}px/side.xpm > xfwm4/$f-active.xpm
    sed s:%COLOR%:$INACTIVE: ${SIZE}px/side.xpm > xfwm4/$f-inactive.xpm
done

for f in close hide menu stick stick-toggled maximize maximize-toggled \
         shade shade-toggled stick stick-toggled; do
    sed s:%COLOR%:$BUTTON: ${SIZE}px/side.xpm > xfwm4/$f-active.xpm
    sed s:%COLOR%:$BUTTON: ${SIZE}px/side.xpm > xfwm4/$f-prelight.xpm
    sed s:%COLOR%:$BUTTON: ${SIZE}px/side.xpm > xfwm4/$f-pressed.xpm
    sed s:%COLOR%:$INACTIVE: ${SIZE}px/side.xpm > xfwm4/$f-inactive.xpm
done

sed s:%COLOR%:$ACTIVE: ${SIZE}px/tl$RADIUS.xpm > xfwm4/top-left-active.xpm
sed s:%COLOR%:$ACTIVE: ${SIZE}px/tr$RADIUS.xpm > xfwm4/top-right-active.xpm
sed s:%COLOR%:$ACTIVE: ${SIZE}px/bl$RADIUS.xpm > xfwm4/bottom-left-active.xpm
sed s:%COLOR%:$ACTIVE: ${SIZE}px/br$RADIUS.xpm > xfwm4/bottom-right-active.xpm
sed s:%COLOR%:$INACTIVE: ${SIZE}px/tl$RADIUS.xpm > xfwm4/top-left-inactive.xpm
sed s:%COLOR%:$INACTIVE: ${SIZE}px/tr$RADIUS.xpm > xfwm4/top-right-inactive.xpm
sed s:%COLOR%:$INACTIVE: ${SIZE}px/bl$RADIUS.xpm > xfwm4/bottom-left-inactive.xpm
sed s:%COLOR%:$INACTIVE: ${SIZE}px/br$RADIUS.xpm > xfwm4/bottom-right-inactive.xpm
