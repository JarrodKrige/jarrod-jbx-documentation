Research Knowledge Base
========================

Mopidy Music Server
https://www.mopidy.com

Mopidy API Reference:
https://docs.mopidy.com/en/latest/api/backend/#backend-api

Extension for Spotify:
https://github.com/mopidy/mopidy-spotify

Notes:
  - Need premium Spotify account

An implementation of Mopidy called Pi MusicBox
http://www.pimusicbox.com
https://github.com/pimusicbox/pimusicbox

A web client implementation of Mopidy called Mopify
https://github.com/dirkgroenen/mopidy-mopify

Audio visualisers:
Python: http://www.tomarcher.co.uk/2016/10/28/raspberry-pi-audio-visualiser/
        https://github.com/Tom-Archer/audio-visualiser
C: https://github.com/daniel-j/unicorn-fft


Node.js wrapper for Spotify api
https://github.com/thelinmichael/spotify-web-api-node


Misc:
Lightshowpi: https://bitbucket.org/togiles/lightshowpi/src/94e76f67cb9df59990acfe9a4e7eb4a443d1668c/py/examples/play_message.py?at=master&fileviewer=file-view-default

Scrolling Text:
https://github.com/topshed/UnicornHatScroll

Other considerations
====================

Shairport - Allows use of Airplay from iOS, iTunes and others
https://github.com/mikebrady/shairport-sync

- Should I use Docker?
- Should I cluster the 2 Pi's and if so Docker Swarm?
- what about a cloud api to serve all data which calls to pi to only invoke play music function. this api integrate direct to spotify api. You can play sample direct from spotify api to client app. client can select play, cloud api enrols song in playlist. cloud api manages playlist. Pi only continues to play the playlist, perhaps requiring a poll or a push from cloud api.

Hardware config
===============

Pi-DigiAMP+
http://www.iqaudio.com/downloads/IQaudIO.pdf

Squid LED
https://github.com/simonmonk/squid

Unicorn display
https://github.com/pimoroni/unicorn-hat


Idea
====

implement web server : Node.js or Python Flask
  do swagger api doc
  Wrap Mopidy functions
  Allow multiple clients to queue songs - add to playlist. When song completes, remove from playlist

Network 2x Pi's. One serves audio through amplifier and the other creates visuals on Unicorn.

Create iOS app client to web server. oAuth.

Roadmap:
MVP (v0.1): Airplay Audio
0.2 Airplay audio with random visualiser and text scroll
0.3 Implement authentication between iOS and cloud api
0.5: Retrieve metadata from spotify on basic iOS app
0.7: Play samples from basic iOS app
0.8: Play audio on jukebox from basic ios app, streaming from spotify
0.9: Squid LED network and pi status visualiser
1.0: Audio with visualiser sync
1.1..2.0 iOS app UX refresh, Android client?, web client?, admin app/feature
