# xfwm4-minibox-theme

A public domain minimalistic boxy theme for XFWM4, inspired by borders from minimalistic/tiling window managers. This theme is for users who like keyboard shortcuts and/or are using something like xfce4-namebar-plugin or xfce4-windowck-plugin. It looks pretty good when you use an external compositor like Compton's frame opacity controls.

## How to use

From within the theme directory, run:

`./generate.sh [-r CORNER_RADIUS] STYLE NORMAL_COLOR FOCUSED_COLOR [BUTTON_COLOR]`

The corner radius can be anything from 0 to the width of the border. By default it will be 0. Colors should be either xfwm4 symbolic color names or quoted colors with leading pound symbol. The included theme which fits in with a teal-accented Numix was generated with:

`./generate.sh 3px "#484848" "#1F8999"`

## It has problems!

File an issue report, I'll try to fix it. :)

## I want to add stuff to it!

Make a pull request, I'll probably merge it. :)
