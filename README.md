# Granblue Fantasy: Relink Farming Script
Simple AutoHotKey script I made to be used for PS4/PS5 on NOX Player in conjuction with RemotePlay for grinding any of the boss missions from HARD to MANIAC, mainly for Curios but also for mats.
I'm also assuming that you know how to setup Nox Player and install apk's to it. If not there's guides out there to help you throught the process.

I didn't tailor this towards PC as I figured it would be easier just to trainer it instead. This is for the hard yakka Playstation Players, but if you want me to make geared towards PC I can do so.

[Nox Player](https://www.bignox.com/)

[Remote Play](https://play.google.com/store/apps/details?id=psplay.grill.com&hl=en_AU&gl=US)

Written using AutoHotKey V1.1.
## General Information
This script was made to be used with any character with the intention of Full Assist being used, keep in mind that whilst Maniac can be selected you'll need a decent setup to do this. Albeit the script does this:
- Teleports to the quest counter using game's build-in teleport function.
- Starts selected Quest.
- Target Boss and move towards it (its not a bot though and relies on Full Assist).
- Auto Repeats quest when dialogue is present.
- FailSafe in case character is thrown out of Loop it will attempt to go back to quest counter and repeat quest.
- (Future Release) Have toggle to turn off Boss targeting and moving forward.
- (Future Release) Gui to track Curio collection

## Setup
- Grab the newest release
- Place the file anywhere you'd like on your computer and run the exe.
- To setup the boss loop some manual setup is required. Just run over to the quest counter and change the Sort selection to "By Type", goto Boss, select any quest, accept it and then abandon it.

You don't need to have AHK installed if you use this script like this. Should work on any Windows machine.

## Compiling
You can also just download the repo and compile the scripts yourself using [AHK2EXE](https://github.com/AutoHotkey/Ahk2Exe/releases/tag/Ahk2Exe1.1.37.01c). It has the option of compiling V2 scripts.

Alternatively, running the scripts as-is, without compiling, is also an option if you have AHK V2 installed.

## Keybinds
ctrl + Q stops and restarts the script

## Video example
Click the image below to be redirected to an example of this working on YouTube.

[![Video Example](https://img.youtube.com/vi/SqQBlNRglC4/0.jpg)](https://youtu.be/SqQBlNRglC4)

## Some Things to Take away
I've run this script for 6 hours on Wings of Antiquity (Ancient Dragon). My team can kill this boss in 15 secs, so doing the maths the full loop including boss time,loading times and battle results is roughly 2 mins so thats 30 boss fights
in the hour, with this setup its netted me on Average 110 Curios. There doesnt seem to be a solid method on Grinding Curio's as far as I know and it comes down to RNG in both drops and rewards. So Good Luck.
