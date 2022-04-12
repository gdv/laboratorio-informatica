# laboratorio-informatica
Materiale di Laboratorio di Informatica (SGI e SSE)

https://gdv.github.io/laboratorio-informatica

Registrato con profili `Firefox` di simplescreenrecorder e comando `wmctrl -e 0,915,2,1920,1260 -r SAS\ Studio`

Per vedere i tasti: `screenkey -p fixed -g 1800x80+1000+50 -f "DejaVu Sans Mono Bold"`

Per fare crop del video 
`ffmpeg -i zoom_0.mp4 -filter:v "crop=1866:1096"  part1.mp4`
ffmpeg -i DB-SAS2-to-crop-35.mp4 -filter:v "crop=1866:1096" -vcodec libx265 -crf 35 -acodec copy  DB-SAS2-h265.mp4

Converti
ffmpeg -ss 00:00:40 -i DB-SAS2.mp4 -i ~/Downloads/blank2.png -filter_complex "[0:v][1:v] overlay=1725:0:enable='between(t,0,5070)'" -vcodec libx265 -crf 28 -c:a copy  DB-SAS2-to-crop.mp4

Una conversione più efficiente, in un formato libero
(https://www.draketo.de/software/ffmpeg-compression-vp9-av1.html)
Q=42; EXT="webm"
time for i in riscv_hammerblade.webm
do
    nice ffmpeg -y -i "$i" -c:v libvpx-vp9 -b:v 0 -crf $Q \
         -aq-mode 2 -an \
         -tile-columns 0 -tile-rows 0 \
         -frame-parallel 0 -cpu-used 8 \
         -auto-alt-ref 1 -lag-in-frames 25 -g 999 \
         -pass 1 -f webm -threads 8 \
         "$(basename "$i" .${EXT})".temp;
    nice ffmpeg -y -i "$i" -c:v libvpx-vp9 -b:v 0 -crf $Q \
         -aq-mode 2 -c:a libopus -b:a 12k \
         -tile-columns 2 -tile-rows 2 \
         -frame-parallel 0 -cpu-used -5 \
         -auto-alt-ref 1 -lag-in-frames 25 \
         -pass 2 -g 999 -threads 8 \
         "$(basename "$i" .${EXT})"-vp9-q${Q}.webm;
done

Per codificare in AV1 (troppo lento)
Q=56 && EXT="mkv" && time for i in  *.${EXT}; do
    nice ffmpeg -y -i "$i" -c:v libaom-av1 -strict -2 \
         -b:v 0 -crf $Q \
         -aq-mode 2 -an \
         -sc_threshold 0 \
         -row-mt 1  -tile-columns 2 -tile-rows 2 -threads 12  \
         -cpu-used 8 \
         -auto-alt-ref 1 -lag-in-frames 25 -g 999 \
         -pass 1 -f webm \
         "$(basename "$i" .${EXT})"-av1.temp
    nice ffmpeg -y -i "$i" -c:v libaom-av1 -strict -2 \
         -b:v 0 -crf $Q -aq-mode 2  \
         -sc_threshold 0 \
         -row-mt 1  -tile-columns 2 -tile-rows 2 -threads 8 \
         -cpu-used 1 \
         -auto-alt-ref 1 -lag-in-frames 25 -g 999 \
         -c:a libopus -b:a 12k \
         -pass 2 -threads 12 \
         "$(basename "$i" .${EXT})"-av1-q${Q}-cpu-used-1.webm
    # create a preview image to use as poster; position: 5s (-ss 5)
    mplayer "$i" -ss 5 -nosound -vo jpeg:outdir=. -frames 1
    mv 00000001.jpg "$(basename "$i" .${EXT})"-av1.jpg 
done
