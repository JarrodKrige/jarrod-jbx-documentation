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


Other considerations
====================

Shairport - Allows use of Airplay from iOS, iTunes and others
https://github.com/mikebrady/shairport-sync


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
  Wrap Mopidy functions
  Allow multiple clients to queue songs - add to playlist. When song completes, remove from playlist

Network 2x Pi's. One serves audio through amplifier and the other creates visuals on Unicorn.

Create iOS app client to web server. oAuth.
