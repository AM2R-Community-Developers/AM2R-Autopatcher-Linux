PROJECT AM2R
v1.5.5

bit.ly/AM2Rblog
reddit.com/r/AM2R
discord.gg/YTQnkAJ
-----------------------------------------------------------

SYSTEM REQUIREMENTS
- DirectX9.0 or newer installed.
- Linux: See dependencies.txt


INSTALLATION
Unzip the contents of the archive in a folder and run the exe.


KEYS
To configure the game keys and joypad buttons, go to the options screen. 
You can change any game options, including the controls, during gameplay.
XBox 360 Gamepads are detected automatically.

F11 - Show FPS
F12 - Capture Screenshot
ESC - Options Menu
Alt+Enter - Toggle Fullscreen
Alt+F4 - Exit Game

FAQ
- Where are my screenshots? I can't find them anymore!
Look in your AppData/Local folder, it's usually in this location:
C:\Users\[Your User Name]\AppData\Local\AM2R

For Linux, it can be found at this location:
/home/[Your User Name]/.config/AM2R

- Why are my screenshots so big?
The screenshots are now taken with the size of the displayed window.
If you want the classic 320x240 screenshots, set the display to Windowed 1x
before pressing F12.

- Can I use save files from demos before 1.0?
No. The game has changed a lot since the demo, along with the save format.

- Can I use save files from versions before 1.4.3?
Yes, but compatability is not guaranteed. Saves are located in C:\Users\[Your User Name]\AppData\Local\AM2R.
1.0/1.1 saves use the filename savN.
1.5+ saves use the filename saveN.
Some older Community Update saves use the filename saveXN.

- I have an Arcade cabinet, can I exit AM2R with just 1 key?
Sure! After running the game once, go to this folder:
C:\Users\[Your User Name]\AppData\Local\AM2R
And edit config.ini, setting the following values:
EnableExitButton=1 (should be 0 by default)
KeyboardButtonExit, JoystickButtonExit and XBJoypadButtonExit can be used to
customize which button / key is used to exit. Default is ESC for keyboard,
Back for XInput, and button 10 for DirectInput.

FAQ Continued Revisions
- Did DoctorM64 have anything to do with this?
DoctorM64 has nothing to do with this. He did not supply the source code.

- How did you get the source code for AM2R?
https://gitlab.com/users/yellowafterlife/projects

- The Fusion suit doesn't change colors for the different types. Help!
AM2R requires DirectX9.0 installed and hardware shader support to properly 
display art in Fusion mode, allow the 8-bit shader to work, and enable custom 
palettes. Until DirectX9.0 is installed and the shaders properly compile, you 
will see the message displayed on the titlescreen and the above mentioned 
features will not work properly.

The required DirectX version (June 2010) can be found on Microsoft's website here:
https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe

- Will you add Ridley?
...

- Will you add new areas or powerups?
No. The development team believes that the world of AM2R is complete, and we are 
focusing on improving what exists rather than adding totally new content.

- What's the most up-to-date version?
The latest version of AM2R will always be posted at www.reddit.com/r/AM2R and will
automatically be installed if you are using the AM2RLauncher.

- What platforms is AM2R available on?
Currently, AM2R runs natively on Windows, Android, and Linux platforms.
Linux support is provided as-is and is not guaranteed to run on any given machine.
AM2R is capable of running on older Mac devices using Wine.

- Will you release the source code?
It's public! Check out the AM2R-Community-Updates repository on GitHub.

- How do I load custom title images/backgrounds/area intros?

Title images: Place your custom image within the /lang/titles/ folder. It must use the following name format: 'language_x000_y000.png'.
	- Replace 'language' with the same name as the language file you use. This is the name in the file header, not the filename. 
	- Replace '000' after both 'x' and 'y' with the necessary coordinate offsets. 
	- For example, a valid title file might be named 'english_x048_y032.png'
	- If you need a negative 'x' title offset (for say, widescreen) simply add a minus sign in front of the 'x' coordinate: 'language_-x000_y000.png'.
	
Backgrounds: Place your custom image in the same folder as your AM2R datafile. (AM2R.exe on Windows, game.unx on Linux) It must use the following name format: 'titlebackground_f00_s00.png'
	- Replace the '00' after 'f' with the number of frames in the background image.
	- Replace the '00' after 's' with the frame-per-second speed of the animation.
	- For example, a valid background file might be named 'titlebackground_f01_s60.png'

Area intros: Place your custom sprite strip within the /lang/headers/ folder. It must use the following name format: language_a0_f00_b00_c00_d00_e00.png
	- Replace the '0' after 'a' with the area ID.
		- 1. Golden Temple
		- 2. Hydro Station
		- 3. Industrial Complex
		- 4. The Tower
		- 5. Distribution Center
		- 6. [has no intro]
		- 7. Genetics Lab
		- 8. GFS Thoth
	- Replace the '00' after 'f' with the number of frames in your sprite.
	- Replace the '00' after 'b', 'c', 'd', and 'e' with each of the 4 pause frame indices in the sprite.
	- For example, a valid English A1 intro file might be named 'english_a1_f24_b00_c03_d19_e21.png'




CHANGELOG

1.1
- Fixed gravity suit not being rendered in certain systems
- Fixed room transition in area 3 entrance
- Fixed language file detection, the game can be fully translated now
- Added transport pipe to final area
- Other minor fixes

1.2
- There may be some bugs due to the code reconstruction. I've fixed what I've found. Just a warning.
- Fixed gravity suit leg glitch when jumping vertically
- Fixed random wall collisions
- Fixed item blocks not being solid
- Power Beam blast now can open item blocks
- Arachnus Chozo Statue is now solid
- Added modifiers.ini file so you can manually manipulate health and damage of certain bosses and misc. other things
- Added option in modifiers.ini for blue item block for Ice Beam
- Added option for random item blocks (different colors) in modifiers.ini
- Fixed visual glitch with Cave Droppers
- Changed Skorp Disc hitbox
- Fixed, mostly, camera issue in area 3 where hidden area was viewable
- Fixed room in Area 2 where a player can get stuck if they don't have Screw Attack
- Changed saved file names so version 1.0 or 1.1 games are separate from version 1.2
- Changed button icons to PS buttons. Can change these back in the modifiers.ini file
	Thanks go to Craig Kostelecky here.
- Fixed issue with Tester spinning sound effect getting stuck turned on.
- Added percent of items currently acquired in character menu screen or map screen. This can be changed in modifiers.ini.
- AM2R now graphically can support 30 E-Tanks on the HUD.
	Thanks go to Craig Kostelecky here.
--------NEW GAME MODES--------
- New Game+ game mode added. This mode starts the lava at level 7, or through area 5.
	38 Metroids in area, from the start, need to be defeated.
	Basically the game thinks you are in area 5 but you have to defeat all the Metroids through area 5. The lava will not
	drain, giving you access to the Alpha before the first Omega fight, until you defeat all the previous Metroids.
	Thanks go to Craig Kostelecky here.
- Random Game+ game mode added. Most power ups are randomized on top of New Game+ rules.
	In modifiers.ini there are some options for random game mode under the EasyPickups section.
	Required to know wall jumping and basic understanding of bomb jumping may be helpful in Random Game+
	It is possible to get stuck in this game mode. Having either spider ball or space jump in some places
	can be vital to being able to get out of situations if you don't have a good grasp on bomb jumping.
	This is mainly an issue in area 5.

1.2.1
- Fixed error on Torizo in hard mode.
- Fixed being able to get stuck leaving the Ice Beam room if you don't have Ice Beam.

1.2.2
- Fixed warp glitch after acquiring ice beam.

1.2.3
- Fixed a room in Area 5 just before Zeta Metroid where you can get stuck in Random Game+.
- Fixed it so you can still escape the reaction without speed boost in New Game+ or Random Game+.
- Fixed issues with errors happening because of going places out of order
- Fixed problems with some reconstructed code in the reactor
- Added an option to change the percent of health E-Tanks give you. 0 to 100% possible.
- Fixed a graphical glitch with the warp pipe between Area 2 and area 4.
- Changed the default buttons back to Xbox. This can be changed to Playstation in the modifiers.ini file.

1.2.4
- Added a manual randomizer seed option in modifiers.ini file.

1.2.5
- Fixed wall glitch in first save room of Area 3
- Fixed it so controller vibration stops if you exit game or pause when controller is actively vibrating
- Added a switch in modifiers.ini to not swap back to the Varia Suit if you have Gravity Suit.
- Fixed Credits. Proper credit has been given now.

1.2.6
- Added HellRun option in modifiers.ini. No save points are active. Power bomb ammo does drop. 
	(For advanced players only. Thanks TheKhaosDemon!)
- Improved Random Game+.
	- Items are now randomized, except for the first super missile pickup and the first power bomb pickup.
		- This is to help guarantee not getting stuck.
	- Item randomization can be turned off in modifiers.ini. 
		- Doing so will only randomize the power ups and force bomb drops in area 1.
	- Added either bombs, screw attack or power bombs to be gotten in area 1.
		- This can be altered in modifiers.ini.
	- If you have power bombs but not regular bombs ammo will drop for power bombs.

1.2.7
- Fixed certain items not appearing
- Potentially fixed duplicate power up glitch. Couldn't replicate issue.
- Fixed no sound on Power Bomb pickups
- Fixed Genesis spawn issue
- Potentially fixed issue with music sometimes not starting in Area 0 at start of game. 

1.2.8
- Fixed glitch where you can collect an incorrect amount of items.
- Fixed soft lock with Hell Run. You can now enter the ship after getting the baby.
- Added ability to switch off Bomb runs, Screw Attack runs, or Power Bomb runs in randomizer. Switch is in modifiers.ini file.
	- If you don't like one or two of the three randomized paths you may exclude them from your randomizer.
- Cleaned up modifiers.ini text and values.
- Changed Randomizer so that E-Tank in Reactor will always be an E-Tank in Hell Run.
- Added ability to change the title picture. Instructions are in modifiers.ini
- Added switch in modifiers.ini for map to show missing item if in same room as a pipe or if multiple item are in one location and you have not acquired them all.
- Added switch in modifiers.ini to switch power ups acquired and not acquired icons.
- Added switch in modifiers.ini for alternative icons for save stations and Metroids.

1.2.9
- Fixed glitch in spider ball room where the game believed there was another item.
- Non-usable pipe in Area 5 is now broken.
- Save stations are pressed down now when loading a game.
- Skreeks near area 4 will now appear in Random Game+ mode until you lower the lava once. Can be turned off in modifiers.ini.
- Added the ability to use custom title background screen sprite. 
- Added fade in / fade out features
- Changed menu so you must beat the game with second best ending or better in order to play New Game+ or Random Game+.
- Normal Mode is now Normal Game.
- Added new effect for Hell Run save stations.
- Fixed problem with main corridor music reverting back to initial music after evening happens.
- Changed behavior of save station in reactor during escape.
- Changed behavior of door near Zeta.
- Fixed credits cutting off early.
- Three introduction pictures can now be changed. See modifiers.ini.
- Overwrite game data now defaults to No.
- In-Game exit game prompt now defaults to No.
- In-Game reload prompt now defaults to No.
- Added a four color filter. Green, Black & White, Blue, and Custom filter available. See modifiers.ini
	- Thanks PixHammer for the Game Boy Shader!
- If you do not have bombs or power bombs when you enter the reactor the bomb blocks in the reactor will be destroyed.


1.2.10
- Fixed graphical issue with new game selection if you haven't finish the game yet.
- Slightly changed the Black and White filter coloring.
- Added switch to handicap your start missile count.
- Changed the name of FourColorfiler to GBOriginalColorFilter in modifiers.ini file.
- Change behavior of Random Game+.
	- You will not longer get random Power Bomb drops in Area 1 if Power Bombs or Screw Attack is your starting path.
- Changed falling behavior of the Tsumuri enemy.


1.3
- Changed Thoth save station position on screen.
- Changed Hard Coded words and added them to the language file.
- Tried to fix starting music issue...again. We think it's working now.
- Added switch in Modifiers.ini so that Samus no longer enters idle mode when arming missile button is held or toggled.
- Added switch in Modifiers.ini to make Torizo's legs hurt Samus during 1st phase of fight.
- Added new Queen attack.
- Fixed message that says "1 Metroids detected in the area".
- Fixed issue with Genesis crawling off the right side of the screen.
- Changed Queen battle music.
- Fixed ghost images from resizing screen.
- Fixed spiderball rotation direction.
- Spiderball glow is now blue when Gravity Suit is equipped.
- Added functionality to load external fonts.
- Added switch in modifiers.ini file to allow charge beam to damage Metroids if you don't have missiles in Hard Difficulty.
- changed Skorp Disc hitbot back to original settings.
- Color Filter Change - You can now toggle between Normal and color filters with the F9 key. Filters can be turned on in game by default.
- Switch in modifier.ini file to change Chozo Statue in Golden Temple.

1.3.1
- Fixed blue caves at start of game in version 1.3.
- color Filters are turned off by default. F9 key still toggles filters but they must be turned on in modifiers.ini file.

1.3.2
- Changed the graphics of the reactor elevator in the map.
- Fixed issue with Queen music double playing.
- Fixed problem with color filters and the map. Filters now turned on by default. Toggle with F9.
- Fixed possibly getting stuck in the Distribution Center if you don't have Speed Booster.
- Samus will pause when the baby hatches. Switch is in modifiers.ini. Turned on by default.
- Damage to Metroid from Charged Beam when missiles are depleted now works on all difficulties. Turned on by default.
- Fixed glitch with doors on the GFS Thoth.
- Original Metroid II Metroid counter is being used. Switch in modifiers.ini. Turned on by default.
	- Instead of counting the Metroids near the Queen from the start, they are counted once you get to the egg.
- You may now play with the baby Metroid following Samus anytime you want. Turn on in modifiers.ini file.
- Fixed issue in version 1.3.1 where wrong gallery picture showed in hard difficulty if you complete game under two hours.
- Serris now drops power-ups. Can be switched off in modifiers.ini file.
- Added button configuration for the Nintendo Pro Controller and a colorful SNES Controller in modifiers.ini file.
- The modifiers.ini file has been reorganized into proper sections.
- If you are using the save file editor by Unknown there is now a modifier to fix the items not appearing properly on the map.
	Can be switched on in modifiers.in file. Turned off by default.
- After beating game once you can turn on an item collected count for the map screen. Turn on in modifier.ini file. Turned off by default. -Sylandro
- Glitch with Metroids leaving the screen and causing a soft-lock shouldn't soft-lock the game anymore.
	If a Metroid leaves the room it will be killed.
- English.ini file has been rearranged. All additions are now under -gatordile additions- section. Above this section is the original layout of the english.ini file starting at version 1.2.
	This was done to help with language translations.
- Added quake after killing last Metroid before Queen.
- Fixed glitch with the In Game Hints.
- Changed the sprite of the Water Moheeks in the Distribution Facility. This can be changed back to the original in modifiers.ini file.

1.3.3
- Reworked backend Randomizer coding.
	Pre-V1.3.3 random games may not work correctly anymore if you have not acquired all power ups. Power ups will just default to original locations.
- Unknown's save file editor version 2.5 and earlier will unrandomize game files.
- RandomGame+ now has three options. Read info in Explanations.txt file for full details.
	- Classic Mode has two options: Items and Power-ups are in two separate pools.
		- Power-ups only: The original randomizer from version 1.2. Bombs always acquired in area 1. No randomized items.
		- Starting Paths: Either Bombs, Power Bombs, or Screw Attack is acquired in area 1. Has randomized items.
	- Split Random: Two randomized pools. No guaranteed power-up in area 1.
	- AM2Random: Power-ups and items are now fully randomized together.
- Added Expanations.txt file to help explain features.
- Updated Mission Log for the Distribution Center with the new Moheek sprite.
- Fixed crash when you Shinespark the Ancient Guardian.
- CollectedItemsOnMap modifier can now be toggled on or off on the map screen by pressing the Missile button.
- Fixed issue with larval Metroids flying off the screen. 
- Added new sprint animation. Can be turned on or off in modifiers.ini file. Turned on by default.
- Fixed slowness issue when falling into save station room in area 3.
- Added toggle to re-order beams in character screen in menu. Ice beam has been moved to the bottom of the list. Turned on by default.
- Fixed game crash issues with language files.
- Added Low Health Alarm. Can be turned on/off. There are two volume settings. See modifers.ini.
- Metroids now drop Super Missiles. Can be turned on/off in modifiers.ini.
- Fixed notification popup when viewing item cut scene.
- Samus will now roll slowly while in morph ball just as she walks slowly when slightly tilting the analog stick.
- Fixed Button names in Joypad Settings for non-Xbox 360 controllers.
- Fixed keyboard names in Keyboard Settings for most keys.
- Changed underwater spin sound when you do not have the Gravity Suit.
- Number of Super Missiles and Power Bombs will only show in Menu system once you have acquired said items.

1.4
- Added Fusion Difficulty. See explanations.txt file.
- Fixed glitched Spin Jump under water.
- Fixed glitch with Screw Attack under water.
- Changed sprites of certain frozen enemies.
- Added Menu Options for some settings previously in modifiers.ini file.
- Fixed glitch with the gallery and starting a new game.
- Added sound for Samus' ship landing and taking off.
- Fixed graphical glitch with Genesis.
- Fixed graphical issue with background sometimes peeking through.
- Suit colors are now changeable with palette sheets. See explanations.txt file.
- Increased Number of larva Metroids in the lab depending on game difficulty.
- Added switch to allow pickups from Spike Plants and Metroids in Hard and Fusion difficulty.
- Hatchling Metroid will now follow X Parasites.
- Morphball sprite animation can now be altered in modifiers.ini file.
- Item Acquire music now plays in powerup rooms. This can be turned off in modifiers.ini file.
- Metroids have a different color Palette in Fusion.
- Metroids have changeable palette sheets. See explanations.txt file.
- Fixed displayed health glitch.
- Fixed wrong doors on Thoth.
- Fonts updated with extended Latin, Cyrillic, and Greek. -Doctor-Mak
- The temperature meter during the escape sequence now expands to fit the text inside.
- Added Gawron and Ramulken animations.
- Fixed grammar error in the logs.
- Fixed glitch where Zeta Metroid appeared as an item on the map.
- Unknown's save file editor version 2.6+ works with the randomizer in all versions of AM2R.
- Added 12 new logs entries. Last entry hidden.
- Added color coded pipes for easy identification. This can be turned on and off in modifiers.ini file.
- Added Blob Thrower enemies.
- Added Septoggs.
- Added additional helper septoggs for navigation in randomizer modes.
	- Some septoggs can be disabled in modifiers.ini file.
- Changed Serris health drops.
- Fixed manual randomizer seed.
- Modified AM2Random logic.
	- There are no guaranteed item placements anywhere. All swappable items logic has been removed.
		- There should always be a way out of every situation if you're not properly equipped.
	- Gravity Suit is now in the randomizer pool.
- Varia suit and Gravity suit damage modifiers are stacked now.
	- Varia suit will half your damage taken. Gravity suit will half your damage taken.
	- If you have Gravity suit and not Varia suit, your damage taken will be the same as Varia suit.
- D-pad fixed for non-Xbox controllers.
- GB Filters now turned on/off and cycled through with the F9 button.
- Bosses are no longer killed by a single Power Bomb.
- Lag Problems should be improved.
- Updated Pincher Fly, Halzyn, Mumbo, and Octroll sprites.
- Save files have been renamed to save1, save2, and save3. 1.2+ - 1.3.3 save files have not been deleted if they exist.
- Added/edited 8Bit filters.
- Ice Beam damage has been modified for random modes.

1.4.1
- Android support.
	- Minimum hardware requirements:
		- Quad-core 1.2Ghz CPU
		- Dedicated GPU
		- 2GB RAM
		- NOTE: These specs will provide full-speed gameplay almost everywhere, with some slowdowns in non-critial areas with a large amount of objects, such as the main caverns of A2, A3, and A5.
			Weaker GPUs may slow down in Fusion mode during X morphing.
- Fusion mode overhaul:
	- Added Core-X to some boss fights.
	- Updated graphics.
	- New sound effects.
	- X parasites may now respawn if not picked up.
- Fixed D-pads not working on some controllers.
- Directional buttons can now be rebound for some controllers.
- Changed pickup sounds for Super Missiles, Big Health, Power Bombs, and X parasites.
- Fixed water Blob Thrower dropping ice shards when killed with Speed Booster.
- Pickups (including X) now spawn at center of enemy.
- Changed non-robotic enemy death sound when killed by Screw Attack or Speed Booster.
- Added new Hydro Station background.
- Added unique, randomized heads to Zetas.
- Palette loading has been restructured.
	- Palettes and related sprites for Samus and the Metroids are now stored in their respective folders under the mods/palettes folder.
- Tester boss can now play its own music if it exists:
	- The song should be called "musTester.ogg" and placed in the main game directory with the rest of the music.
- Suit change animations will now play in Random games when the item is not in a tunnel or in the air.
- A little bird told me some hidden message should now unlock more reliably. You didn't hear it from me though >.>
- Samus should no longer clip though the Queen when in morph.
- Item room music now obeys the volume setting and should no longer restart the area theme when ended.
	- The Retro item music toggle has been removed, instead, the item room theme now plays if the file called "musItemAmb2.ogg" exists in the game directory; if it is removed, the area theme will continue playing rather than the item theme.
- Music should no longer randomly fail to play (Yes, for real this time...).
- Updated Skreek sprite.
- A7 cave background changed.
- Added French, Czech, and German localizations.
- Many other minor fixes.

1.4.2
- Music when entering item rooms will now quickly cross-fade.
- Resolved various issues related to shaders.
- Modifiers.ini streamlined: some options have been removed and/or made permanent to unify the experience.
	- Metroids and spike plants will now drop health and ammo on Hard and Fusion difficulties when Insanity Mode is off.
- Fixed Samus sometimes becoming offset when saving at a save station. 
- Fixed trace image of item appearing after picking up Arachnus Core-X.
- Fixed confirmation prompt not appearing when attempting to overwrite a save.
- Fixed missing pixels on Fusion suit sprite.
- Fixed visual issue with Ramulken eye.
- Fixed Screw Attack effect playing while picking up a Core-X.
- Other minor fixes.
  Android:
- By default, the game will now read gamepad input using virtual keycodes, e.g. "Button A" or "Right Trigger", rather than numbered scan codes.
	- IF YOUR GAMEPAD DOESN'T WORK GO TO CONTROL OPTIONS AND ENABLE *COMPATIBILITY MODE*.
	- Buttons will need to be rebound.
	- Buttons hints can be changed to match various controllers, under Display Settings, when not in compatibility mode.
	
1.4.3
- Removed Septogg directly to the left of the ship to avoid confusing players.
- Changed controller screen text to encourage players to purchase Metroid: Samus Returns.
- Fixed distorted glow on controller screen.
- Modified Zeta arena in A4 to prevent players from being knocked into room transition.
- Added shatter particles to Genetic Lab tubes.
- Added extra Hatchling sounds.
- Modified randomizer logic to prevent Springball from being at the Super Missile location in the Golden Temple.
- Fixed bug that caused the Varia/Gravity suit animation to create a slope below the pickup location.
- Fixed bug that allowed the Queen's Power Bomb death to be triggered early, resulting in an offset explosion.
- Fixed bug that allowed the Queen to be killed twice.
- Fixed bug that caused ammo/health drops to be visually distorted after moving.
- Fixed internal bug that caused sand to misbehave. Players will notice no difference, but the devs are much happier.
- Fixed internal bug that caused the Fusion Queen Death tiles to misbehave.
- Changed 2 pixels on the Metroid Husk sprite to fix a distractingly sharp angle.
- Fixed a bug in the X Parasite spawn routine that caused the game to crash in specific circumstances.
- Added message informing players that Fusion Mode is unlocked on the first time the 100% cutscene is seen.
- Added seed saving and display functionality for random game modes.
	- Seed and randomizer type will display below savefile when selected in main menu.
	- Seed and randomizer type also viewable in the Extras menu.
	- Savefiles generated prior to 1.4.3 will have their seed defaulted to 0, if it displays at all.
- Added Castillian Spanish translation. Thanks u/atemporalDarkness!
- Prevented Baby Septoggs from spawning at a time they should not have in BG3.
- Made Samus immune to the pull of floor turbines in A2 while wearing Gravity Suit.
- Fixed visual issue with Ramulken eye drawing over all layers.
- Fixed bug that caused the splash sound to play while moving between two cave rooms shortly after completing A5.
- Blob Fly AI tweaked to make them less aggressive.
- Spike Wall Septogg in A3 now will not disappear during Random Games unless either the Space Jump or Speed Booster have been collected.
- Fixed missing collision in one of the Waterfall rooms.
- Added randomized Omega Metroid variants. This change is purely visual, and does not affect gameplay.
- Larval Metroids should no longer be able to glitch themselves through walls.
- Added option in the Extras Menu to display the in-game timer under the HUD.
- Modified a set of crumble blocks in A5 to give players a faster backtracking route to collect a Screw Attack walled item.
- Cleaned up several information files included with the patch.

1.5
- Linux support added.
	- Please read dependencies.txt for more information.
- Added intro text to area scan logs.
- Zeta/Omega balance changes:
	- Buffed Omega health from 32 to 35.
	- Made a few Omega AI tweaks, including a new flame attack to prevent spiderball cheese.
	- Very slightly increased cooldown on Zeta missile block.
- Resprited several enemies and tweaked various behaviors.
	- Meboids are now fully animated, and drain health instead of doing normal damage.
	- Skreeks spawn slightly slower and have new movement to feel less robotic.
	- Shirks now take one missile's worth of damage less to destroy.
	- Skorps now use lures.
	- Several enemies have new/modified Hard/Fusion difficulty behavior:
		- Drivel now drop acid on Hard/Fusion difficulty.
		- Aquatic Blobs now home in on Samus.
		- Meboid Barriers will explode into several Meboids on destruction.
- Revamped parts of Area 6 (Search & Rescue Hideout):
	- Added a save station much closer to the first Omega.
	- Changed a significant amount of the level layout to flow better.
	- Changed some enemy placement/behavior and incorporated some new species.
		- New variants of Meboids and Skreek now live in A6.
		- The new Skreek variant has returned to its M2 roots, jumping out of lava and spitting acid at Samus before dropping back into it.
		- The new Meboids are far more aggressive and multiply rapidly; they have, however, retained their vulnerability to the Ice Beam.
- Changed how Fusion Suit palettes are loaded.
	- Hardware incapable of running the palette swap shader will now properly display the M:SR variants of the Fusion Suit instead of an eternal blue suit.
	- Fusion Suit Power, Varia, and Gravity palette files have all been separated. 
		- M:SR variants are in the left column, and the defaults are in the right; edit the right column to change them in-game.
- Revamped the Serris battle:
	- Graphics updated.
	- Movement AI fully rewritten; new movement patterns implemented.
	- Several small tweaks to missile and beam collisions.
		- The double-hit Missile bug has been fixed.
		- Non-Plasma beam weapons no longer pierce through Serris during the second phase of the fight.
	- Sonic projectiles added to one pattern.
	- Speedboosting implemented.
- Revamped the Tank battle:
	- Graphics updated.
	- Two new beam attacks added.
	- Core health boosted from 100 to 125 to compensate for larger hitbox sizes.
	- Decreased Super Missile damage boost against core by 1/3.
	- Slowed missile production to compensate for the additional beam attacks.
	- Arm Cannon HP boosted from 100 to 150.
- Revamped multiple sections of artwork.
	- All upgrades and expansion tanks have been resprited.
		- Ammo pickups dropped by enemies have been resprited to fit.
	- New animation added for obtaining the Gravity Suit.
	- Missiles, Super Missiles, Power Bombs, and Bombs have been resprited to fit their respective items.
	- Chozo Statues and Item Balls have been resprited.
	- Several HUD sprites updated to match new items.
	- S&R Team resprited.
	- Pre-Lab Ascent background updated.
	- Several log images changed to match new sprites.
	- Several log images changed to use the AM2R Larval Metroid instead of the Zero Mission form.
	- Golden Temple Claw Orbs resprited.
	- The default Gravity Suit palette file has been given a facelift.
	- Area 5 has received several reworked sprites and general palette tweaks.
		- The Gravity Chamber has been resprited.
		- EMP Sphere graphics have been updated.
		- Warp pipe graphics updated.
			- The broken pipe has been altered. Pray that we do not alter it further.
	- Touched up the Research Lab sprites.
	- Added new textures for bubbles generated in lava.
	- The first cavern phase with Skorps now has various fungi and small Cordite crystals scattered around, as do the Cordite Mines.
	- Updated Save Station palette.
	- Samus' Gunship has been reshaded.
- Added cheats functionality.
	- On the game selection screen, you may use the following sequence of buttons to unlock:
		- New Game+, Random Game+, and Fusion difficulty (On Android the game modes are now disabled by default, but can be unlocked again with this): [UP][UP][DOWN][DOWN][LEFT][RIGHT][LEFT][RIGHT][ACCEPT][BACK]
		- Early Baby Metroid (Lets the baby Metroid follow you anywhere, anytime during gameplay. Enter it again to disable.): [UP][LEFT][DOWN][RIGHT][RIGHT][DOWN][LEFT][UP]
		- A sound will play if the unlock was successful.
- Added animated title screen background to internal resources and changed how custom backgrounds are loaded.
	- The animated title screen background will now display on Android.
	- See the FAQ at the top of the readme on how to load a custom background.
- Changed how title screen images are loaded.
	- Each language can now have its own image.
	- See the FAQ at the top of the readme on how to load custom titles.
- Changed some randomizer logic to prevent potential hardlocks. This may cause old seeds to generate differently!
	- Changed randomizer logic to prevent Speedbooster from being at the Reactor location behind Speedboost blocks.
	- Changed some Bomb blocks in the room before Varia to destroy themselves under certain conditions in Random Games.
- Changed item ball sprite held by the Chozo statue in A4 to match the coloration of the statue.
- Changed several of the Larval Metroid collision behaviors to prevent them from getting out of bounds. For real this time.
- Changed how Charge Beam draws in pickups. The speed should be relatively the same, but it should accelerate more smoothly and has better directional support.
- Changed Health and Missile X Parasites to have a 50% chance to spawn even when Samus has full health and ammo.
- Changed the Autom's hit sound and death type from organic to robotic.
- Changed item acquisition fanfare to quickly fade out rather than simply stopping when the item collection notification is closed.
- Changed room during Reactor escape sequence to fix an improper room transition.
- Modified Energy Tank pickup description text to reflect the multiplier values in difficulty settings.
- Modified the right platform in BG3 Gamma room to become shot blocks under certain conditions in Random Games.
- Updated small health pickup sound to a higher quality sound file.
- Updated percent complete sprite in map menu.
- Tweaked trooper/research log arrow animation to be quicker when unlocking.
- Slightly modified random Septogg spawn routines.
- Slightly lowered Autrack projectile origin.
- Animated Halzyn eye to follow Samus when in view.
- Tweaked Blob Fly AI to make them more aggressive but disperse under certain conditions (namely retreating from or killing the Blob Thrower).
- Enemies near Samus are now destroyed during suit transition animations to prevent Samus from being damaged and put in a bad state.
- Fixed Samus being shifted slightly left when against a right wall while jumping or unmorphing.
- Fixed Samus from being affected by room transition fades.
- Fixed bug that caused Septogg to spawn in the first Alpha room before the Alpha was dead.
- Fixed collision bug in Mining Facility that caused speedboost to stop on a slope.
- Fixed rare error with water graphics.
- Fixed rare Torizo Core-X crash on pickup.
- Fixed bug that allowed Missiles and Super Missiles to collide with Larval Metroids in their idle state.
- Fixed softlock at the first Super Missile Tank location.
- Fixed display bug that caused HUD E-Tanks to display improperly with health values between 99 and 100.
- Fixed bug that caused bosses to spawn Power Bomb refills in Insanity Mode, regardless of whether or not the player has obtained them yet.
- Fixed bug that caused the HUD map highlight square to become partially transparent.
- Fixed log notification pop-up from being affected by room transition fades.
- Fixed multiple scan notifications unlocking at once and overlapping; the second log notification will now wait for the first to finish before scanning.
- Fixed Wallfire projectile origin being off-center.
- Fixed cave droppers sometimes disappearing early.
- Fixed Ancient Guardian being damaged by Power Bombs during its immune state.
- Fixed graphical glitch with ending gallery selection screen.
- Fixed Ramulken enemy being blurry on some resolutions.
- Fixed issue in A3 where picking up an item in Alpha room during the fight would cause the area theme to resume, making both the boss and area theme play simultaneously.
- Fixed Halzyn being unable to damage Samus in morphball form.
- Fixed Halzyn and Ramulken shields being drawn over other enemies.
- Fixed water graphics being at full opacity at room start despite Samus already being in the water.
- Updated log font with new glyphs, including special characters, updated Cyrillic letters, and the Japanese alphabet.
- Fixed a rare randomizer sequence break that enabled an Alpha Metroid to fly out of bounds in Area 2.
- Fixed a rare error where a water jet could activate while an Alpha Metroid was still alive, causing a minor graphical and audio error.
- Removed Super Missiles from Alpha Metroid drop pool.
- Zeta Metroid cocoons are now persistent.
- A2 turbine invulnerability to Power Bombs has been fixed.
- Added helper Septoggs in BG3 to prevent a softlock in Random Games.
- Other minor fixes.

1.5.1
- Added widescreen support.
	- MASSIVE thanks to Wanderer for getting the backbone of widescreen figured out before he left.
	- Special thanks to ChloePlz for extending the animated Title Screen!
	- Toggleable via the Display options menu. Requires moving through a room transition to apply the setting if changed in-game.
	- May impact performance on especially weak devices.
	  If you're playing AM2R on a potato, this setting probably isn't for you!
- Refined the Serris battle.
	- Added conduits on the sides of the arena that can be blasted open and short-circuited!
		- Destructable with Missiles and Bombs.
		- If Serris swims through an active conduit, it will take some damage and (if boosting) 
		  reduce the remaining boost patterns in a phase by 1.
	- AI fixes
		- Fixed bug that occasionally locked Serris into a permanent spiral.
		- Fixed bug that made Samus immune to contact damage with Serris while close to the walls of the arena.
- Refined the Tank battle.
	- The Tank's initial pause has been shortened by 3 seconds.
	- The Tank moves faster based on difficulty; Easy and Normal are unchanged.
- Improved a few animated aspects of the Omega Metroid.
	- Now blinks when Power Bombs are set off.
	- Now opens and closes mouth while roaring and breathing fire.
- Fixed the Zeta Metroid's swipe cooldown. For real this time, we promise.
- Increased the Gamma Metroid's hurtbox size and slightly modified the shell hitbox to make them easier to hit.
- Added the Gameplay Options menu.
	- Only accessible through the title screen.
	- Controls RandomGame+ seeds, Insanity Mode, and Extreme Lab Metroids.
- Removed Insanity Mode from modifiers.ini. It is now toggled in-game.
- Added a scaling option for touch controls on Android devices.
- Implemented Japanese characters to two more fonts and added Japanese translation to default distribution.
	- Special thanks to gponys, Nanassshy and kitronmacaron!
- Added Italian translation to default distribution.
- Enabled custom Area Intro Scan animations to be externally loadable.
	- See the FaQ at the top of this file for instructions on file format and loading.
	- Created full Area Intro sets for the following language distributions:
		- English
		- German
		- Japanese
		- Spanish (Castellano)
		- French
		- Russian
		- Italian
- Added Sensitivity Mode to the Display options menu.
	- Lowers the intensity of some flashing/flickering light effects. When enabled:
		- The red Power Plant escape flash is halved in opacity and speed.
		- The Power Bomb explosion effect does not flicker.
		- The Tower activation lights flickers much less.
- Fixed numerous issues with dinput controllers on Linux.
	- Compatibility mode has been enabled. If your controller does not work, enabling this
	  setting will likely fix the issue.
	- Allowed remapping of controller stick axes to mitigate the unpredictability
	  of Linux controller IDs.
	- Tested on DualShock 4 and 8bitdo SN30 Pro controllers.
- Added item collection percentage to the HUD if the In-Game Time display and map screen item count settings are both enabled.
- The small turbines in A2 now draw bombs towards them.
- Added an item pickup that will appear if the main Power Plant item is not obtained before the explosion.
- Updated Gawron sprite.
- Updated Yumee sprite.
- Updated the Power Plant elevator to look destroyed after the explosion.
- The 100% post-credits cutscene will now display after completing Fusion Difficulty in addition to the other three difficulties.
- Re-implemented controller screen text that was accidentally removed in 1.5.
- Added a few names to the credits text that were accidentally missed in 1.5.
- Modified wall-crawling enemy code to behave nicer in previously buggy circumstances. Enemies should no longer randomly fall off slopes.
	- Thanks Wanderer!
- Added proper lava states to the new Save Room. Adjusted collision geometry accordingly.
- Added two Septoggs to the Cordite Mines to prevent softlocks in RandomGame+ and NewGame+.
- Tower activation room door no longer locks behind Samus once the Tester has been defeated.
- Modified Halzyn lava glow sprites to function based on distance from the lava surface.
- Set game to not boot in fullscreen on first launch; this should fix some display issues on Linux.
- Removed Item Room music from the Spiderball room for thematic consistency.
- Slightly modified geometry of one room in the Cordite Mines to prevent a clipping error with speedball.
- Updated normal suit palette files to include a few missing colors.
- Gamma Metroids will now never drop more than one Super Missile on death.
- Modfied a set of Septogg logic to prevent a hardlock in NewGame+.
- Added tubes to the back of the Queen body sprite to bring it in-line with other canonical appearances.
- Optimized the Landing Site. Slightly. (Removed the unused Speed Booster blocks)
- Nerfed base Air Blob damage from 10 to 7.
- Nerfed the Shirk's health by a missile... again.
- Improved accuracy of Missile and Bomb explosion spawn positions.
- Improved EMP Sphere collision with Missile and Bomb explosions.
- Updated Autodoc minigame Super Missile pit to reflect the new ammo sprites.
- Slightly modified collision in the Waterfalls to reflect the 1.2 Dev Stream.
- Fixed a minor bug with Serris' health on RandomGame+.
- Fixed a long-standing issue in an A3 Gamma room that forced Samus to move to the right.
- Fixed a bug in the new A6 terrain that allowed Samus to build up a Shinespark by running in place.
- Fixed bug where IGT display setting was not saved to file.
- Fixed a bug where the Queen Metroid's stomach could not be entered while using analog input.
- Fixed a bug where Samus clipped through the Queen Metroid's jaw during the final phase.
- Fixed a bug with several enemy flashing draw routines.
- Fixed pre-A2 Alpha Metroid/Wave Beam collision bug.
- Fixed minor graphical issue with the Subscreen Fusion Varia Suit.
- Fixed minor graphical issue where a Warp Pipe animation would draw over Swimming Moheek.
- Fixed minor graphical issue with the 100% ending cutscene egg crush animation.
- Fixed residual tile in Area 3 entrance on Bombless Randomizer runs.
- Fixed a few Varia suit sprites that were missing pixels.
- Fixed a RandomGame+ hardlock in lower Area 3 on Hard/Fusion difficulties.
- Fixed an incredibly rare collision bug with the Chute Leech and Octroll creatures.
- Fixed a bug where Meboid barriers could be destroyed while not frozen.
- Fixed a minor Fusion Gravity Suit palette bug.
- Fixed the [Default] button in the joypad options menu.
- Fixed an issue that allowed the Extras menu to be manipulated while unpausing.
- Fixed an issue that caused the liquid distortion filter to not move with the retracting lava after killing the first Alpha Metroid.
- Fixed a visual issue with the log screen transition.
- Fixed an issue with certain looping sounds not ending properly. (Hopefully)
- Fixed a rare crash related to the fullscreen/windowed display mode toggle.
- Fixed an error in the Omega spiderball AI.
- Fixed a camera issue with warp pipe transitions.
- Fixed a rare bug where picking up a suit in RandomGame+ would temporarily disable Save Stations.
- Fixed a post-Gravity Loop music bug in RandomGame+.
- Fixed an issue in the refill drop system that made Power Bombs needlessly rare.
- Fixed an issue in Fusion Difficulty that caused mechanical enemies to drop health/Missiles in invalid conditions.
- Fixed the Autoad Doublejump and Autrack Death Laser stunlock bugs.
- Fixed an OOB in the Power Plant escape sequence.
- BladeBots now despawn when outside of a room.
- Other minor fixes.

1.5.2
- Enabled negative X offsets for title overlays. New format is at the top of the readme file, as usual.
- Subscreen ammo sprites updated.
- Re-implemented the nighttime Landing Site Septoggs.
- Updated the Extras Menu to hide shader options if they are unsupported on the target platform.
- Reduced the Queen Metroid's body contact damage during the first movement phase.
- Removed all downwards waterfall room transitions except the very top one.
- Fixed widescreen language variant title overlay detection.
- Fixed Linux Area Intro translation loading.
- Fixed display scaling when widescreen is enabled; the game should no longer extend beyond screens with non-standard aspect ratios.
- Fixed a hardlock in the Distribution Center on Hard/Fusion Difficulty by disabling bomb block regeneration in one room.
- Fixed several widescreen tiling errors.
- Fixed a few more Serris AI bugs, including the notorious spinning bug.
- Fixed an animation bug that affected the Tester's cannons.
- Fixed a scrolling bug in the Display Options menu on Android.
- Fixed a camera snapping issue in widescreen.
- Other minor fixes.

1.5.3
- Switched back to Virtual Machine builds to allow better modding support through the UndertaleModTool.
- Tweaked the Windows sleep margin setting - this is the primary cause of the random slowdowns people have been running into.
	- We changed it from 1 to 10, which should resolve the issue for most people.
	- However! This setting is very odd and doesn't work the same for every machine, so you may need to adjust it yourself in options.ini.
- Moved the custom palette files into an "inactive" folder to prevent them from running by default - this should speed up performance on lower-end machines.
- Made the default volume quieter. This will not affect any existing settings, but should be more gracious towards new players' ears and speakers.
- Changed pseudo-Screw Attack behavior to retain the charge when spaceboosting through enemies.
- Added localization author display to the Display menu.
- Added Portuguese, Brazilian Portuguese, Ukranian, and Swedish localizations.
- Reworked the credits for timing and readability concerns.
- Implemented behavior for EMP effects on Sensitivity Mode.
- Linux fixes: 
	- Fixed garbled graphics during a fullscreen boot.
	- Fixed external title/area file loading.
- Fixed VM-specific memory leak in A6 (Search and Rescue Hideout/Omega Nest).
- Fixed character error in the Glasstown NBP font.
- Fixed RandomGame+ Seed setting text shadow.
- Fixed custom palette behavior for the Fusion Suit.
- Fixed inconsistencies in the "controller recommended" graphic.
- Fixed restart bug for the custom item room theme.
- Fixed in-game timer and item% display on HUD when disabled.
- Fixed an animation bug in the A5 (Distribution Center) bubble vents on YYC builds.
- Fixed a hitbox inconsistency in Genesis' turning animation.
- Fixed audio stacking bug when killing the Ancient Guardian with the Speed Booster.
- Fixed incorrect Halzyn sprites being drawn by freshly spawned X Parasites.
- Fixed Drillevator not spawning under certain conditions.
- Fixed(?) audio bug when picking up a Core-X while holding a charged shot.
- Fixed incorrect map markings for the Research Site Alphas when widescreen is enabled.
- Fixed incorrect drawing behavior for some Title menu options.
- Fixed crash when opening the Extras menu on certain devices.
- Fixed frozen enemy hitsound stacking.
- Other misc. fixes.
- Added Ridley?

1.5.4
- Fixed shader crash on Fusion Difficulty.

1.5.5
- Fixed credits fadein.
- Fixed missing credits entry.
- Fixed missing font characters.


Thanks for supporting this continued effort. See you next mission!






CREDITS

Producer
Milton 'DoctorM64' Guasti

Graphic Design
Ramiro Negri
Steve 'Sabre230' Rothlisberger
Jack Witty
Kirill '1Eni1' Fevralev
Jasper
MichaelGabrielR

Promo Art
Azima 'Zim' Khan

Writing
James 'Ridley' Hobbs
Paulo 'Latinlingo' Villalobos

Platform Engine Code
Martin Piecyk

Music Composition
Milton 'DoctorM64' Guasti
Darren Kerwin
Torbjørn 'Falcool' Brandrud

Debug
Hemse
Dragondarch
Esteban 'DruidVorse' Criado
Verneri 'Naatiska' Viljanen

Playtest
Jennifer Potter
Mario Crestanello
Live4Truths
Torbjørn 'Falcool' Brandrud
Lise Trehjørningen
Nommiin
Gabriel Kaplan
Nicolas 'Skol' Del Negro
Darren Kerwin
Robert Sephazon

Community Management
Dragonheart91
Ammypendent
Karrde

Special Thanks
Nommiin
Nathan 'wickedclown' Hess
Tyler Rogers
Kousoru
Infinity's End
CapCom
Isabelle Amponin
The Metroid Community

Source Code Reconstruction
YellowAfterlife

Continued Revisions

Development
Gatordile
Alex 'Wanderer' Mack
Lojemiru

Programming
Metroid3D
Scooterboot
Craig Kostelecky
milesthenerd

Art Lead
Dannon 'Shmegleskimo' Yates

Art
ShirtyScarab
Cooper Garvin
Chris 'Messianic' Oliveira
ChloePlz

Localization
Imsu, Diegomg
m3Zz, LPCaiser
Miepee, unknown
fedprod, ReNext
LetsPlayNintendoITA
SadNES cITy e Vecna
Atver, Gponys
DarkEspeon, Vectrex28
R3VOWOOD, Ritinha
LiveLM, pMega0n
peachflavored, Katherine_S2003
PanHooHa, realgard
Mister Bond, joe_urahara
RippeR1692, LudvigNG
Andréas

Special Thanks
Banjo, Grom PE
King Bore, Jean-Samuel Pelletier
Reaku The Crate, Scooterboot
Sylandro, TheKhaosDemon
Unknown, Iwantdevil
PixHammer, CaptGlitch
Nokbient, EODTex
Electrix, gponys
Japanese Community


-----------------------------------------------------------
For updates on the project, please visit:
bit.ly/AM2Rblog
reddit.com/r/AM2R
discord.gg/YTQnkAJ
