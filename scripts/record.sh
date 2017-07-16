#!/bin/sh
# 
# wildefyr - 2016 (c) wtfpl
# record x11 desktop using ffmpeg
# altered by fs0ciety for pulseaudio support
# 
# taken from https://code.fsociety.info/dotfiles/file/bin/bin/record.html

ARGS="$@"

AREA=":0.0"
FRAMERATE=30
ENCODER="h264"
RECPATH="recording.mp4"

PULSE_IN="alsa.output.pci-0000_00_1b.0.iec958-stereo"
PULSE_OUT="alsa_output.pci-0000_00_1b.0.iec958-stereo.monitor"


usage() {
    cat << EOF
Usage: $(basename $0) [-i wid] [-f framerate] [-a source] [-n file] [-eE encoder] [-kqh]

-i|--wid:      Pass window id to record within its geometry.
-a|--audio:    Record audio [valid: mic or audio, default: none]
-e|--encode:   Encode file after recording. [valid: nvenc|h264|webm, default: $ENCODER]
-E|--reencode: Re-encode existing file. [valid: nvenc|h264|webm, default: $ENCODER]
-f|--frames:   Set the framerate of the recording. [default: 30]
-n|--name:     Set the name to save the recording. [default: ./$RECPATH]
-k|--kill:     Kill any currently running instances of ffmpeg.
-q|--quiet:    Suppress all text output.
-h|--help:     Show this help.
EOF

    test $# -eq 0 && exit 0 || exit $1
}

fnmatch() {
    case "$2" in
        $1) return 0 ;;
        *)  printf '%s\n' "Please enter a valid window id."; exit 1 ;;
    esac
}

record() {
    printf '%s\n' "Recording at ${FRAMERATE} frames per second."

    # this leaves much more headroom for the cpu
    test "$gameFlag" = "true" && {
        printf '%s' "Recording using nvenc: "
        ffmpeg -f x11grab -s ${RESOLUTION} -framerate ${FRAMERATE} -i ${AREA} \
        -c:v nvenc -profile high444p -pixel_format yuv444p -preset llhq -b:v 20M \
        -y -loglevel error "${RECPATH}" && return 0
    }

    case "$audioSource" in
        "mic")
            printf '%s' "Recording with microphone: "
            ffmpeg -f alsa -i hw:0 -c:a aac \
            -f x11grab -s ${RESOLUTION} -framerate ${FRAMERATE} -i ${AREA} \
            -c:v libx264rgb -threads 8 -qp 0 -preset ultrafast -y -loglevel \
            error "${RECPATH}"
            ;;
        "audio")
            printf '%s' "Recording with audio: "
            ffmpeg -f pulse -f pulse -i "$PULSE_OUT" -c:a aac \
            -f x11grab -s ${RESOLUTION} -framerate ${FRAMERATE} -i ${AREA} \
            -c:v libx264rgb -threads 8 -qp 0 -preset ultrafast -y -loglevel \
            error "${RECPATH}"
            ;;
        *)
            printf '%s' "Recording: "
            ffmpeg -f x11grab -s ${RESOLUTION} -framerate ${FRAMERATE} -i \
            ${AREA} -c:v libx264rgb -threads 8 -qp 0 -preset ultrafast -y \
            -loglevel error "${RECPATH}"
            ;;
    esac
}

encode() {
    test ! -e "${RECPATH}" && {
        printf '%s\n' "${RECPATH} doesn't exist! Exiting..."
        exit 3
    }

    amountOfFrames="$(ffprobe -select_streams v -show_streams ${RECPATH} \
        -loglevel error | grep nb_frames | cut -d'=' -f 2)"
    printf '%s\n' "${amountOfFrames} frames to encode."

    printf '%s\n' "Starting re-encode..."

    case "$ENCODER" in
        "nvenc")
            ffmpeg -i "${RECPATH}" -c:v nvenc -b:v 10M -acodec copy \
            -y -loglevel error nvenc-${RECPATH} || return 1
            ;;
        "h264")
            # using crf 15 because there's no fucking difference
            ffmpeg -i "${RECPATH}" -acodec copy -c:v libx264 \
            -crf 15 -b:v 20M -preset veryslow -threads 8 \
            -y -loglevel error "${RECPATH}".mp4 || return 1
            ;;
        "webm")
            ffmpeg -i "${RECPATH}" -c:v libvpx -deadline good \
            -minrate 1.2M -maxrate 2.5M -vb 2.5M \
            -c:a libvorbis -threads 8 \
            -y -loglevel error "${RECPATH}".webm || return 1
            ;;
    esac

    printf '%s\n' "Re-encode complete."

    printf '%s' "Delete lossless file? [y/n]: "; while read -r confirm; do
        test "$confirm" = "y" && {
            deleteFlag=true
            break
        }
        test "$confirm" = "n" && {
            break
        }
        printf '%s\n' "Please enter y or n."
        printf '%s' "Delete lossless file? [y/n]: "
    done

    test "$deleteFlag" = "true" && {
        printf '%s\n' "Deleting file: ${RECPATH}"
        rm -f "${RECPATH}"
    }

}

validateDeps() {
    type ffmpeg 2>&1 > /dev/null || {
        printf '%s\n' "What the hell is wrong with you? You don't have ffmpeg!" >&2
        exit 2
    }
    type wattr 2>&1 > /dev/null || {
        printf '%s\n' "wattr was not found on your \$PATH" >&2
        printf '%s\n' "cannot detect resolution!" >&2
        exit 2
    }
}

main() {
    validateDeps

    RESOLUTION=$(wattr wh $(lsw -r) | tr \  x)

    for arg in "$@"; do
        case $arg in -?|--*) nameFlag=false ;; esac
        test "$nameFlag" = "true" && NAMESTRING="${NAMESTRING}${arg}"
        case $arg in -n|--name) nameFlag=true ;; esac
    done

    test ! -z "$NAMESTRING" && {
        RECPATH="$NAMESTRING"
    }

    for arg in "$@"; do
        test "$frameFlag"  = "true" && FRAMERATE="$arg" && frameFlag=false
        test "$audioFlag"  = "true" && audioSource="$arg" && audioFlag=false
        test "$encodeFlag" = "true" || test "$reencodeFlag" = "true" && {
            case "$arg" in
                "webm")  ENCODER="$arg" ;;
                "nvenc") ENCODER="$arg" ;;
                "h264")  ENCODER="$arg" ;;
            esac
        }

        case "$arg" in
            -g|--game)     gameFlag=true      ;;
            -f|--frames)   frameFlag=true     ;;
            -a|--audio)    audioFlag=true     ;;
            -e|--encode)   encodeFlag=true    ;;
            -E|--reencode) reencodeFlag=true  ;;
            -k|--kill)     pkill ffmpeg; exit ;;
        esac
    done

    extension=$(printf '%s\n' "${RECPATH}" | rev | cut -d'.' -f 1 | rev)
    case "$extension" in
        "mp4") RECPATH="${RECPATH}"     ;;
        "mkv") RECPATH="${RECPATH}"     ;;
        *)     RECPATH="${RECPATH}.mp4" ;;
    esac

    test "$reencodeFlag" = "true" && {
        encode
        exit
    }

    for arg in "$@"; do
        test "$widFlag" = "true" && {
            wid="$arg"
            fnmatch '0x*' "$wid" && {
                X=$(($(wattr x $wid) + 2))
                Y=$(($(wattr y $wid) + 2))
                W=$(wattr w $wid)
                H=$(wattr h $wid)
                RESOLUTION="${W}x${H}"
                AREA="$AREA+$X,$Y"
            }

            widFlag=false
        }

        case "$arg" in
            -i|--wid) widFlag=true ;;
        esac
    done

    record

    test "$encodeFlag" = "true" && {
        encode
    }
}

for arg in $ARGS; do
    case $arg in
        -q|--quiet) QUIETFLAG=true ;;
        -h|--help)  usage 0        ;;
    esac
done

test "$QUIETFLAG" = "true" && {
    main $ARGS 2>&1 > /dev/null
} || {
    main $ARGS
}
