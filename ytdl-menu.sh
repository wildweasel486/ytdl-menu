#!/bin/bash
# ytdl-menu by corwin "wildweasel" brence
# https://github.com/wildweasel486/ytdl-menu for updates
# licensed under the terms of MIT; see LICENSE for info.

echo	"ytdl-menu by wildweasel"
selection=
until [ "$selection" = "0" ]; do
	echo "
1 - Download a single video as an MP3
2 - Download a whole playlist as MP3
3 - Update youtube-dl (run this if it won't download)

0 - We're done here
"
	echo -n "Choose an option: "
	read selection
	echo ""
	case $selection in
		1 )	echo 	"Single video mode selected.
Please copy the Video ID. The ID is everyting to the right of v=
in the Youtube URL. Therefore, a URL that looks like
https://www.youtube.com/watch?v=VIDEO_ID
has the video ID of VIDEO_ID.";
			echo -n "Paste the ID here: > ";
			read ytdlID;
			echo "Now attempting to download video from ID: $ytdlID";
			youtube-dl -f bestaudio -o "./Output/%(title)s.%(ext)s" --extract-audio --audio-format "mp3" $ytdlID;;

		2 ) echo	"Playlist mode selected.
Please copy the Playlist ID. The ID is everyting to the right of list=
in the Youtube URL. Therefore, a URL that looks like
https://www.youtube.com/playlist?list=PLAYLISTIDGOESHERE
has the playlist ID of PLAYLISTIDGOESHERE.";
			echo -n "Paste the ID here: > ";
			read ytdlID;
			echo "Now attempting to download playlist from ID: $ytdlID";
			youtube-dl -f bestaudio -o "./%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --extract-audio --audio-format "mp3" $ytdlID;;

		3 ) echo "OK, telling youtube-dl to go update itself.";
			sudo youtube-dl -U;;
	esac
done

echo "Seeya. -ww"
