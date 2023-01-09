	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoop2Scene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FNoop1Scene:
	end

PlayersHouse1FNoop2Scene:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	sjump MeetMomScript

MeetMomUp3Script:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump MeetMomScript

MeetMomUp2Script:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	sjump MeetMomScript

MeetMomUp1Script:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	sjump MeetMomScript

MeetMomRightScript:
	sjump MeetMomScript

MeetMomScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .MomUp3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .MomUp2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .MomUp1
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .MomRight1
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript2

.MomRight1:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript2
.MomUp3:
	turnobject PLAYER, DOWN
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovementUp3
	sjump MeetMomScript2
.MomUp2:
	turnobject PLAYER, DOWN
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovementUp2
	sjump MeetMomScript2
.MomUp1:
	turnobject PLAYER, DOWN
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsUpTowardPlayerMovement
	sjump MeetMomScript2
MeetMomScript2:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .MomReturnUp3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .MomReturnUp2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .MomReturnUp1
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .MomRight1
	sjump .FromLeft
	sjump .Finish

.MomRight1:
	turnobject PLAYER, LEFT
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	turnobject PLAYER, LEFT
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.MomReturnUp3:
	turnobject PLAYER, DOWN
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackDown2Movement
	sjump .Finish

.MomReturnUp2:
	turnobject PLAYER, DOWN
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackDown1Movement
	sjump .Finish

.MomReturnUp1:
	turnobject PLAYER, DOWN
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_PLAYERSHOUSE1F_MEET_MOM
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomTurnsUpTowardPlayerMovement:
	turn_head UP
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomWalksToPlayerMovementUp3:
	slow_step UP
	slow_step UP
	step_end

MomWalksToPlayerMovementUp2:
	slow_step UP
	step_end

MomWalksToPlayerMovementUp1:
	slow_step UP
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

MomWalksBackDown2Movement:
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MomWalksBackDown1Movement:
	slow_step DOWN
	turn_head LEFT
	step_end

ElmsLookingForYouText:
	text "MOM: Right."
	line "All boys leave"
	cont "home some day."
	cont "It said so on TV."

	para "PROF.OAK, next"
	line "door, is looking"
	cont "for you."

	para "And before you go,"
	line "you'll want this!"

	para "A #MON GEAR,"
	line "especially for"
	cont "your travels!"

	para "Here you go!"
	done

MomGivesPokegearText:
	text "#MON GEAR, or"
	line "just #GEAR."

	para "An essential for"
	line "the would-be"
	cont "traveller!"

	para "Oh, the day of the"
	line "week isn't set."

	para "Shall we set that"
	line "up?"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "Oh, right! Do you"
	line "know how to use"
	cont "the PHONE?"
	done

KnowTheInstructionsText:
	text "Yes, you'd know you"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon!"
	done

DontKnowTheInstructionsText:
	text "Let's see. The"
	line "instructions say…"

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done

InstructionsNextText:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Isn't that just"
	line "wonderful?"
	done

HurryUpElmIsWaitingText:
	text "PROF.OAK, next"
	line "door, is looking"
	cont "for you."

	para "Better get to it,"
	line "<PLAYER>!"
	done

SoWhatWasProfElmsErrandText:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

PlayersHouse1FStoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

PlayersHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

PlayersHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

PlayersHouse1FTVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, PALLET_TOWN, 1
	warp_event  7,  7, PALLET_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  3, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomLeftScript
	coord_event  9,  3, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomRightScript

	coord_event  7,  0, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomUp3Script
	coord_event  7,  1, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomUp2Script
	coord_event  7,  2, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomUp1Script

	def_bg_events
;	bg_event  0,  0, BGEVENT_READ, PlayersHouse1FStoveScript
;	bg_event  1,  0, BGEVENT_READ, PlayersHouse1FSinkScript
;	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
;	object_event  0,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
