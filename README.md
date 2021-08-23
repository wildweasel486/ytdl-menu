# ytdl-menu
A simple shell script based front-end to use with youtube-dl. Presently, I use this to download YT videos and convert them to MP3.

If you do not already have youtube-dl, it can be found at https://ytdl-org.github.io/youtube-dl/index.html .
Note that, because the MP3 conversion is done via ffmpeg, you will want to make sure that ffmpeg is installed, along with any other dependencies youtube-dl needs. _ytdl-menu itself has no dependencies other than bash._

## Setup
The script itself should be self-contained, run from local folder (ideally, have it in the folder where you want to download to). It may very well be possible to install ytdl-menu, but this is not something I have ever tried.

For usage in Windows 10, I have only ever tested this using Ubuntu via WSL; this means that you will need to _use a Linux version of youtube-dl_, as this WILL NOT WORK using the Windows EXE. I do not see any reason why it wouldn't work on your Linux flavor of choice, but please let me know if there are issues (or ideally, advise me on how to correct them, via pull request).

## Usage
Run `ytdl-menu.sh` from the folder in which you want your files downloaded. You will see 3 options:
`1 - Download a single video as an MP3
2 - Download a whole playlist as MP3
3 - Update youtube-dl (run this if it won't download)`

For option 1, _generally_ copying in the URL to the Youtube video will work, _however_ I personally advise clicking the video's Share button and copying it from there to get the shortened `youtu.be/VIDEO_ID` one instead. If it throws errors saying it can't find the video, copy only the video ID into it. The output will be placed in a subfolder called `Output` within the working folder.

Option 2 should function much the same, however it is intended for playlists and channel URLs. It will _try_ to intelligently track-number and title every video in the list, but it can make mistakes. The output goes into a folder named for the playlist's title (or, assuming I've done it right, the channel name).

Option 3 invokes `youtube-dl -U` to attempt to fetch the newest version. Use it if you are getting errors.

## Caveats
Presently, this script is hardwired to convert the "best quality" version of its target videos into 320 Kbps CBR MP3s. This is all I ever needed from it, so I never bothered to add any kind of output options for that. You cannot just download the videos with my script - frankly, that's as easy as `youtube-dl [URL]` with no other args anyway, so I never added that kind of function either.

Please feel free to drop me a message if you have questions about it, or open an issue ticket or pull request if there's something I should address. Bear in mind, though, this is literally the first Bash script I've ever written(!!), so I would appreciate kindness and mercy. ;)
