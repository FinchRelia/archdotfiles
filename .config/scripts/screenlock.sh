#!/bin/bash
set -euo pipefail

LOCKSCREEN_DIR=~/.cache # this dir must contain a dir called 'lockscreen'
BLURTYPE="0x8" 		# http://www.imagemagick.org/Usage/blur/#blur_args

export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_LIST_VIDEOS_COMMAND="find ${LOCKSCREEN_DIR}/lockscreen/ -type f"
export XSECURELOCK_IMAGE_DURATION_SECONDS=3600
export XSECURELOCK_PASSWORD_PROMPT=kaomoji
export XSECURELOCK_COMPOSITE_OBSCURER=0 # avoid picom bug
export XSECURELOCK_FONT=IPAPGothic

if [ -z ${LOCKSCREEN_DIR+x} ]; then exit 1; fi # bail if lockscreen dir is not set

maim ${LOCKSCREEN_DIR}/lockscreen-plain.png &&
convert ${LOCKSCREEN_DIR}/lockscreen-plain.png -blur $BLURTYPE ${LOCKSCREEN_DIR}/lockscreen-blurred.png &&
mv ${LOCKSCREEN_DIR}/lockscreen-blurred.png ${LOCKSCREEN_DIR}/lockscreen/lockscreen.png &
xsecurelock &&
rm  ${LOCKSCREEN_DIR}/lockscreen/lockscreen.png
