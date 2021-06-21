function y --description 'download youtube video as mp3'
   youtube-dl --extract-audio --audio-format mp3 $argv
end
