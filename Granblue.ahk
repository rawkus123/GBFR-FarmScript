global stopScript := false
lastLockOnTime := 0
lastCurioSearchTime := 0
CurioCount := 0
HealthColours := ["0xB4FF7E", "0xB7FB4F", "0xAEFF56"]
NoColours := ["0x4EFDFF", "0x47e8fe", "0x5dddfa"]
CurioColours := ["0x36334B", "0x3E3E56"]

CurioCoordinates := [{X1: 380, Y1: 356, X2: 436, Y2: 411},{X1: 449, Y1: 356, X2: 504, Y2:411 },{X1: 379, Y1: 285, X2: 434, Y2: 340}]

;55 55

WinGet, remotePlay_id, List, ahk_exe Nox.exe
if (remotePlay_id = 0)
{
    MsgBox, Nox not found
    return
}
Loop, %remotePlay_id%
{
    id := remotePlay_id%A_Index%
    WinGetTitle, title, ahk_id %id%
    If InStr(title, "NoxPlayer")
        break
}
WinGetClass, remotePlay_class, ahk_id %id%
WinMove, ahk_id %id%,, 0, 0, 1440, 900
ControlFocus,, ahk_class %remotePlay_class%
WinActivate, ahk_id %id%

WinGetPos, WinX, WinY,, , ahk_id %id%

WinActivate, ahk_id %id%

    ;MainMenu Coordinates
    MenuX1 := 696
    MenuY1 := 277
    MenuX2 := 702
    MenuY2 := 285

    ; Set of coordinates (health bar)
    HealthBarX1 := WinX + 163
    HealthBarY1 := WinY + 137
    HealthBarX2 := WinX + 298
    HealthBarY2 := WinY + 143

    ; Set of coordinates for Battle Results
    BattleResultsX1 := WinX + 699
    BattleResultsY1 := WinY + 267
    BattleResultsX2 := WinX + 701
    BattleResultsY2 := WinY + 269

    ;Repeat Coordinates
    RepeatX1 := WinX + 641
    RepeatY1 := WinY + 327
    RepeatX2 := WinX + 729
    RepeatY2 := WinY + 350

    ;Repeat YES/NO
    NoX1 := WinX + 676
    NoY1 := WinY + 599
    NoX2 := WinX + 719
    NoY2 := WinY + 606

    ;Repeat Quest Dialogue Box
    RepX1 := 653
    RepY1 := 376
    RepX2 := 764
    RepY2 := 424

    ;Question Mark
    QX1 := 899
    QY1 := 437
    QX2 := 900
    QY2 := 438

    LoopTimes := 8

LoopTimes := 8

SysGet, screenWidth, 0
SysGet, screenHeight, 1

guiX := (screenWidth - 1140) / 2
guiY := (screenHeight - 400) / 2

StartGui:

Gui, Add, Text, x10 y10 w200 h20 Center, Quest Categories


Gui, Add, Text, x10 y10 w200 h20 Center, Hard Quests
Gui, Add, Button, x10 y30 w200 h30 gSetLoopTimes, Protect the Rep (Quakadile)
Gui, Add, Button, x10 y60 w200 h30 gSetLoopTimes, Delts of Our Lives (Goblin Warrior)
Gui, Add, Button, x10 y90 w200 h30 gSetLoopTimes, Hide and Chic (Blizzadile)
Gui, Add, Button, x10 y120 w200 h30 gSetLoopTimes, Drumsticks au Griffin (Griffin)
Gui, Add, Button, x10 y150 w200 h30 gSetLoopTimes, Looming Tower, Leering Eye (Nazarbonju)


Gui, Add, Text, x240 y10 w200 h20 Center, Very Hard Quests
Gui, Add, Button, x240 y30 w200 h30 gSetLoopTimes, Wings of Antiquity (Ancient Dragon)
Gui, Add, Button, x240 y60 w200 h30 gSetLoopTimes, A Bone to Peak (Scarmiglione)
Gui, Add, Button, x240 y90 w200 h30 gSetLoopTimes, Geomology 102: Volcanic Golems (Rock Golem)
Gui, Add, Button, x240 y120 w200 h30 gSetLoopTimes, No One Likes Leftovers (Tayu'itar)
Gui, Add, Button, x240 y150 w200 h30 gSetLoopTimes, I See a Deathly Vision (Gerasene)
Gui, Add, Button, x240 y180 w200 h30 gSetLoopTimes, The Next Hot Topic (Infernadile)

Gui, Add, Text, x470 y10 w200 h20 Center, Extreme Quests
Gui, Add, Button, x470 y30 w200 h30 gSetLoopTimes, License to Thrill (Furycane)
Gui, Add, Button, x470 y60 w200 h30 gSetLoopTimes, Saga Illustrated (Managarmr)
Gui, Add, Button, x470 y90 w200 h30 gSetLoopTimes, General Investigation: Gallanza (Gallanza)
Gui, Add, Button, x470 y120 w200 h30 gSetLoopTimes, General Investigation: Maglielle (Maglielle)
Gui, Add, Button, x470 y150 w200 h30 gSetLoopTimes, Learning from the Past (Excavallion)
Gui, Add, Button, x470 y180 w200 h30 gSetLoopTimes, Saga illustrated: Inferno (Vulcan Bolla)
Gui, Add, Button, x470 y210 w200 h30 gSetLoopTimes, General Investigation: Id (Id)
Gui, Add, Button, x470 y240 w200 h30 gSetLoopTimes, Wings of Conflagration (Vrazarek Firewyrm)
Gui, Add, Button, x470 y270 w200 h30 gSetLoopTimes, Wings of Upheaval (Corvell Earthwyrm)
Gui, Add, Button, x470 y300 w200 h30 gSetLoopTimes, Wings of the Storm (Elusious Windwyrm)
Gui, Add, Button, x470 y330 w200 h30 gSetLoopTimes, Wings of Rime (Wilinus Icewyrm)
Gui, Add, Button, x470 y360 w200 h30 gSetLoopTimes, To Know the Unknowable (Angra Mainyu)


Gui, Add, Text, x700 y10 w200 h20 Center, Maniac Quests
Gui, Add, Button, x700 y30 w200 h30 gSetLoopTimes, Rumble in the Desert (Quakadile)
Gui, Add, Button, x700 y60 w200 h30 gSetLoopTimes, Armor is Best Served Cold (Blizzadile)
Gui, Add, Button, x700 y90 w200 h30 gSetLoopTimes, A Heated Rivalry (Infernadile)
Gui, Add, Button, x700 y120 w200 h30 gSetLoopTimes, Death, Taxes and Goblins (Goblin Warrior)
Gui, Add, Button, x700 y150 w200 h30 gSetLoopTimes, Icy Eye on the Holy Prize (Nazarbonju)
Gui, Add, Button, x700 y180 w200 h30 gSetLoopTimes, Golemonology 103: Forest Golems (Rock Golem)
Gui, Add, Button, x700 y210 w200 h30 gSetLoopTimes, Hope in the Machine (Tayu'itar)
Gui, Add, Button, x700 y240 w200 h30 gSetLoopTimes, A New Breed (Griffin)
Gui, Add, Button, x700 y270 w200 h30 gSetLoopTimes, I See a Grim Vision (Gerasene)
Gui, Add, Button, x700 y300 w200 h30 gSetLoopTimes, Throw a Smith a Bone (Scarmiglione)
Gui, Add, Button, x700 y330 w200 h30 gSetLoopTimes, Revenge of the Hordes (Goblin Warrior x2)
Gui, Add, Button, x700 y360 w200 h30 gSetLoopTimes, Serenity Upon the Mount (Nazarbonju x2)
Gui, Add, Button, x700 y390 w200 h30 gSetLoopTimes, Roost and Regin (Griffin x2)
Gui, Add, Button, x700 y420 w200 h30 gSetLoopTimes, Boss Done Wants it Did (Rock Golem x2)
Gui, Add, Button, x700 y450 w200 h30 gSetLoopTimes, Know Your Enemy (Tayu'itar)
Gui, Add, Button, x700 y480 w200 h30 gSetLoopTimes, I See a Chromatic Vision (Multi Boss)
Gui, Add, Button, x700 y510 w200 h30 gSetLoopTimes, The Saga Continues: Wind (Furycane)
Gui, Add, Button, x700 y540 w200 h30 gSetLoopTimes, Saga illustrated: Crystal (Managarmr)
Gui, Add, Button, x700 y570 w200 h30 gSetLoopTimes, Id Bears Repeating (Id)
Gui, Add, Button, x700 y600 w200 h30 gSetLoopTimes, The Saga Continues: Silver (Gallanza)
Gui, Add, Button, x700 y630 w200 h30 gSetLoopTimes, Saga illustrated: Veil (Maglielle)
Gui, Add, Button, x700 y660 w200 h30 gSetLoopTimes, The Saga Continues: Earth (Excavallion)
Gui, Add, Button, x700 y690 w200 h30 gSetLoopTimes, Saga illustraed: Hellfire (Vulcan Bolla)
Gui, Add, Button, x700 y720 w200 h30 gSetLoopTimes, Saga Grande: Happily Ever After (Angra Mainyu)


quests := [{name: "Protect the Rep (Quakadile)", loopTimes: 8}, {name: "Delts of Our Lives (Goblin Warrior)", loopTimes: 9}, {name: "Hide and Chic (Blizzadile)", loopTimes: 10}, {name: "Drumsticks au Griffin (Griffin)", loopTimes: 11}, {name: "Looming Tower, Leering Eye (Nazarbonju)", loopTimes: 12}, {name: "Wings of Antiquity (Ancient Dragon)", loopTimes: 13}, {name: "A Bone to Peak (Scarmiglione)", loopTimes: 14}, {name: "Geomology 102: Volcanic Golems (Rock Golem)", loopTimes: 15}, {name: "No One Likes Leftovers (Tayu'itar)", loopTimes: 16}, {name: "I See a Deathly Vision (Gerasene)", loopTimes: 17}, {name: "The Next Hot Topic (Infernadile)", loopTimes: 18}, {name: "License to Thrill (Furycane)", loopTimes: 19}, {name: "Saga Illustrated (Managarmr)", loopTimes: 20}, {name: "General Investigation: Gallanza (Gallanza)", loopTimes: 21}, {name: "General Investigation: Maglielle (Maglielle)", loopTimes: 22}, {name: "Learning from the Past (Excavallion)", loopTimes: 23}, {name: "Saga illustrated: Inferno (Vulcan Bolla)", loopTimes: 24}, {name: "General Investigation: Id (Id)", loopTimes: 25}, {name: "Wings of Conflagration (Vrazarek Firewyrm)", loopTimes: 26}, {name: "Wings of Upheaval (Corvell Earthwyrm)", loopTimes: 27}, {name: "Wings of the Storm (Elusious Windwyrm)", loopTimes: 28}, {name: "Wings of Rime (Wilinus Icewyrm)", loopTimes: 29}, {name: "To Know the Unknowable (Angra Mainyu)", loopTimes: 30}, {name: "Rumble in the Desert (Quakadile)", loopTimes: 31}, {name: "Armor is Best Served Cold (Blizzadile)", loopTimes: 32}, {name: "A Heated Rivalry (Infernadile)", loopTimes: 33}, {name: "Death, Taxes and Goblins (Goblin Warrior)", loopTimes: 34}, {name: "Icy Eye on the Holy Prize (Nazarbonju)", loopTimes: 35}, {name: "Golemonology 103: Forest Golems (Rock Golem)", loopTimes: 36}, {name: "Hope in the Machine (Tayu'itar)", loopTimes: 37}, {name: "A New Breed (Griffin)", loopTimes: 38}, {name: "I See a Grim Vision (Gerasene)", loopTimes: 39}, {name: "Throw a Smith a Bone (Scarmiglione)", loopTimes: 40}, {name: "Revenge of the Hordes (Goblin Warrior x2)", loopTimes: 41}, {name: "Serenity Upon the Mount (Nazarbonju x2)", loopTimes: 42}, {name: "Roost and Regin (Griffin x2)", loopTimes: 43}, {name: "Boss Done Wants it Did (Rock Golem x2)", loopTimes: 44}, {name: "Know Your Enemy (Tayu'itar)", loopTimes: 45}, {name: "I See a Chromatic Vision (Multi Boss)", loopTimes: 46}, {name: "The Saga Continues: Wind (Furycane)", loopTimes: 47}, {name: "Saga illustrated: Crystal (Managarmr)", loopTimes: 48}, {name: "Id Bears Repeating (Id)", loopTimes: 49}, {name: "The Saga Continues: Silver (Gallanza)", loopTimes: 50}, {name: "Saga illustrated: Veil (Maglielle)", loopTimes: 51}, {name: "Saga illustrated: Veil (Maglielle)", loopTimes: 52}, {name: "The Saga Continues: Earth (Excavallion)", loopTimes: 53}, {name: "Saga illustraed: Hellfire (Vulcan Bolla)", loopTimes: 54}, {name: "Saga Grande: Happily Ever After (Angra Mainyu)", loopTimes: 55}]


Gui, Add, Button, x10 y760 w70 h30 gLookHealthBar, START

Gui, Add, Button, x110 y760 w70 h30 gQuitScript, QUIT

Gui, Show, x%guiX% y39 w910 h800, Quest Selector
return

SetLoopTimes:
    buttonText := A_GuiControl
    LoopTimes := 0

    for index, quest in quests {
        if (quest.name = buttonText) {
            LoopTimes := quest.loopTimes
            break
        }
    }

    if (LoopTimes = 0) {
        MsgBox, % "Quest not found for button text: " buttonText
    }
return

QuitScript:
; Terminate the script
    ExitApp

return


LookHealthBar:

Gui, Hide

WinActivate, ahk_id %id%
CurioVariable := 0

Loop
{
    ToolTip, Searching For HealthBar and Countdown Timer, WinX + 50, WinY + 50
    Sleep, 1000

    PixelSearch, FoundX1, FoundY1, BattleResultsX1, BattleResultsY1, BattleResultsX2, BattleResultsY2, 0xFFF99C, 5, Fast RGB
        if (ErrorLevel = 0)
        {
            Sleep, 2000
            ;Double Check Countdown Timer
            ToolTip, Searching For Countdown Timer, WinX + 50, WinY + 50
            PixelSearch, FoundX1, FoundY1, BattleResultsX1, BattleResultsY1, BattleResultsX2, BattleResultsY2, 0xFFF99C, 5, Fast RGB
            if (ErrorLevel = 0)
                {
                    Click Up
                    ToolTip, Timer Found - Waiting 30 Secs, WinX + 50, WinY + 50
                    Sleep, 55000
                    MouseMove, 1265, 679
                    Click, Left, Down
                    Sleep, 500
                    Click, Left, Up
                    ToolTip, Viewing Battle Results - Waiting For Quest Repeat Dialogue,  WinX + 50, WinY + 50
                    Goto BattleResults
                }
        }
        else
        {
                    ; Search Health Bar
                    ToolTip, CountDown Timer Not Found Searching for HealthBar, WinX + 50, WinY + 50
                    for index, colour in HealthColours
                    {
                        PixelSearch, FoundX1, FoundY1, HealthBarX1, HealthBarY1, HealthBarX2, HealthBarY2, %colour%, 10, Fast RGB
                        if (ErrorLevel = 0)
                        {
                            ToolTip, Health Bar Found, WinX + 50, WinY + 50
                            Sleep, 1000

                            ; Target Monster
                            MouseMove, 73, 176
                            Click, Left, Down
                            Sleep, 200
                            Click, Left, Up

                            Sleep, 200
                            ; Move Forward
                            MouseMove, 396, 725
                            Sleep, 500
                            Click Down
                            Sleep, 500
                            MouseMove, 391, 606
                            Sleep, 2000
                        }
                        else
                        {
                            ;Try Pressing L2 for Quick Navigation
                            ;Click L2
                            MouseMove, 74, 186
                            Click, Left, Down
                            Sleep, 200
                            Click, Left, Up
                            PixelSearch, MenuFoundX1, MenuFoundY1, MenuX1, MenuY1, MenuX2, MenuY2, 0x3BC1D9, 5, Fast RGB
                            if (ErrorLevel = 0)
                                {
                                    Goto FailSafe
                                }
                                else
                                {
                                    Goto LookHealthBar
                                }
                        }
                    }
        }
}




return


^Q::
ToolTip, Reloading script...
Sleep, 1000
Reload
return

BattleResults:
    Sleep, 6500
    if (RepeatQuestCounter = 1)
            {
                    ;Click Square, Click X
                    MouseMove, 1178, 592
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    SLeep, 500
                    MouseMove, 1272, 686
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 1000
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 1000
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    RepeatQuestCounter := 0
            }
    Loop
            {
                Loop, % CurioCoordinates.Length()
                {
                    if (CurioVariable = 0)
                    {
                        CurioCoord := CurioCoordinates[A_Index - 1]

                        Loop, % CurioColours.Length()
                        {
                            CurioColor := CurioColours[A_Index - 1]
                            PixelSearch, FoundCurioX, FoundCurioY, CurioCoord.X1, CurioCoord.Y1, CurioCoord.X2, CurioCoord.Y2, %CurioColor%, 5, Fast RGB
                            if (ErrorLevel = 0)
                        {
                            CurioVariable := 1
                            CurioCount++
                            GuiControl,, CurioCount, Curio Count: %CurioCount%

                            Break
                        }
                        }
                    }
                }

                PixelSearch, FoundRepX1, FoundRepY1, RepX1, RepY1, RepX2, RepY2, 0x091A33, 5, Fast RGB
                if (ErrorLevel = 0)
                {
                    ToolTip, Quest Repeat Dialogue box found - attempting to repeat, WinX + 50, WinY + 50
                    MouseMove, 129, 518
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 1000
                    MouseMove, 1265, 679
                    Click, Left, Down
                    Sleep, 500
                    Click, Left, Up
                }
                else
                {
                    for index, colour in HealthColours
                    {
                        PixelSearch, FoundX1, FoundY1, HealthBarX1, HealthBarY1, HealthBarX2, HealthBarY2, %colour%, 10, Fast RGB
                        if (ErrorLevel = 0)
                        {
                            ToolTip, Health Bar Found, WinX + 50, WinY + 50
                            Goto LookHealthBar
                        }
                    }
                }
                ;FailSafe incase thrown out of loop
                ;Try Pressing L2 for Quick Navigation
                            ;Click L2
                            MouseMove, 74, 186
                            Click, Left, Down
                            Sleep, 200
                            Click, Left, Up
                            Sleep, 1000
                            PixelSearch, MenuFoundX1, MenuFoundY1, MenuX1, MenuY1, MenuX2, MenuY2, 0x3BC1D9, 5, Fast RGB
                            if (ErrorLevel = 0)
                                {
                                    Goto FailSafe
                                }
            }



FailSafe:

                    ToolTip, Trying to restart quest... Please Wait, WinX + 50, WinY + 50

                    ;Click L2
                    MouseMove, 74, 186
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 3000

                    ;Click X
                    MouseMove, 1272, 686
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 1000

                    ;Move Left Stick Forward
                    MouseMove, 396, 721
                    Click, Left, Down
                    Sleep, 200
                    MouseMove, 394, 613
                    Sleep, 1000
                    Click, Left, Up

                    ;Click Triangle
                    MouseMove, 1265, 508
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 2000

                    ;Click X
                    MouseMove, 1272, 686
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 2000

                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 500

                    ;D-Pad Down 27x
                    MouseMove, 140, 671
                    Loop, %LoopTimes%
                    {
                    Click, Left, Down
                    Sleep, 100
                    Click, Left, Up
                    Sleep, 100
                    }
                    MouseMove, 1272, 686
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 1000
                    MouseMove, 1272, 686
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 2000

                    ;Click Square, Click X
                    MouseMove, 1178, 592
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    SLeep, 500
                    MouseMove, 1272, 686
                    Click, Left, Down
                    Sleep, 200
                    Click, Left, Up
                    Sleep, 10000

            Loop
            {
                    for index, colour in HealthColours
                    {
                        PixelSearch, FoundX1, FoundY1, HealthBarX1, HealthBarY1, HealthBarX2, HealthBarY2, %colour%, 10, Fast RGB
                        if (ErrorLevel = 0)
                        {
                            ToolTip, Health Bar Found, WinX + 50, WinY + 50
                            RepeatQuestCounter := 1
                            Goto LookHealthBar
                        }
                        else
                        {
                        PixelSearch, MenuFoundX1, MenuFoundY1, MenuX1, MenuY1, MenuX2, MenuY2, 0x52595A, 3, Fast RGB
                        if (ErrorLevel = 0)
                            {
                                Goto FailSafe
                            }
                        }
                    }
            }
    return
