# ytdl-menu
A simple shell script based front-end to use with youtube-dl and its forks. Presently, I use this to download YT videos and convert them to MP3, and its only function is to automate this process.

If you do not already have yt-dlp, it can be found at https://github.com/yt-dlp/yt-dlp . _(Any references to `youtube-dl` throughout this document are used generically and may refer to whatever fork you want to use.)_

Note that, because the MP3 conversion is done via ffmpeg, you will want to make sure that ffmpeg and ffprobe are installed through your method of choice, along with any other dependencies youtube-dl needs. _ytdl-menu itself has no dependencies other than bash._

## Setup
The script itself should be self-contained, run from local folder (ideally, have it in the folder where you want to download to). It may very well be possible to install ytdl-menu, but this is not something I have ever tried.

### An important note if you are using a fork of youtube-dl
If you are using a different fork of youtube-dl besides (as of this writing) yt-dlp, open ytdl-menu.sh in your text editor of choice and modify line 6 (`bin=yt-dlp`) to `bin=name_of_your_forks_executable`. If you are using yt-dlp, in linux or windows, you do not need to change anything. _Thanks to malachai for implementing this._

### Using via Windows without WSL
If you do not want to use WSL for whatever reason (you're valid, btw), ytdl-menu will work just as well with a Windows EXE of youtube-dl. Download ytdl-menu.sh, and place it in the same folder as your fork of choice, and ensure that ffmpeg.exe and ffprobe.exe are in the same folder as well. To actually run the script, you'll need a way to execute Bash scripts. I, personally, have had 100% success using Git Bash, which gets installed with [the Git tools for Windows](https://git-scm.com/download/win); installed with default settings, you can even just double-click ytdl-menu.sh and it'll work.

### Using via WSL
For usage in Windows 10 or 11 via WSL, you will need to _use a Linux or Python version of youtube-dl_. Get it configured to the point where you can run it simply by typing its name into your terminal, then the script should be able to invoke it without problems.

If you are using a different fork besides yt-dlp, edit this script with your text editor of choice and change line 6 to indicate what you're using.

## Usage
Run `ytdl-menu.sh` from the folder in which you want your files downloaded. You will see 3 options:

```
1 - Download a single video as an MP3
2 - Download a whole playlist as MP3
3 - Update youtube-dl (run this if it won't download)
```

For option 1, _generally_ copying in the URL to the Youtube video will work, _however_ I personally advise clicking the video's Share button and copying it from there to get the shortened `youtu.be/VIDEO_ID` one instead. If it throws errors saying it can't find the video, copy only the video ID into it. The output will be placed in a subfolder called `Output` within the working folder.

Option 2 should function much the same, however it is intended for playlists and channel URLs. It will _try_ to intelligently track-number and title every video in the list, but it can make mistakes. The output goes into a folder named for the playlist's title (or, assuming I've done it right, the channel name).

Option 3 invokes `youtube-dl -U` to attempt to fetch the newest version. If you're getting errors, this may be because Youtube have changed something on their end to break downloaders, so fetching an update to the downloader will often fix this.

## Caveats
Presently, this script is hardwired to convert the "best quality" version of its target videos into 320 Kbps CBR MP3s. This is all I ever needed from it, so I never bothered to add any kind of output options for that. You cannot just download the videos with my script - frankly, that's as easy as `youtube-dl [URL]` with no other args anyway, so I never added that kind of function either.

Please feel free to drop me a message if you have questions about it, or open an issue ticket or pull request if there's something I should address. Bear in mind, though, this is literally the first Bash script I've ever written(!!), so I would appreciate kindness and mercy. ;)
