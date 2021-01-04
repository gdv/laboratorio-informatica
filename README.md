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

