ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestInsideSign:
	jumptext ViridianForestInsideSignText

ViridianForestHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE

ViridianForestInsideSignText:
	text "MT.SILVER"
	done

ViridianForestText1::
	text "I came here with"
	line "some friends!"

	para "They're out for"
	line "#MON fights!"
	done

ViridianForestBattleText1::
	text "Hey! You have"
	line "#MON! Come on!"
	cont "Let's battle'em!"
	done

ViridianForestEndBattleText1::
	text "No!"
	line "CATERPIE can't"
	cont "cut it!"
	prompt

ViridianForestAfterBattleText1::
	text "Ssh! You'll scare"
	line "the bugs away!"
	done

ViridianForestBattleText2::
	text "Yo! You can't jam"
	line "out if you're a"
	cont "#MON trainer!"
	done

ViridianForestEndBattleText2::
	text "Huh?"
	line "I ran out of"
	cont "#MON!"
	prompt

ViridianForestAfterBattleText2::
	text "Darn! I'm going"
	line "to catch some"
	cont "stronger ones!"
	done

ViridianForestBattleText3::
	text "Hey, wait up!"
	line "What's the hurry?"
	done

ViridianForestEndBattleText3::
	text "I"
	line "give! You're good"
	cont "at this!"
	prompt

ViridianForestAfterBattleText3::
	text "Sometimes, you"
	line "can find stuff on"
	cont "the ground!"

	para "I'm looking for"
	line "the stuff I"
	cont "dropped!"
	done

ViridianForestText8::
	text "I ran out of #"
	line "BALLs to catch"
	cont "#MON with!"

	para "You should carry"
	line "extras!"
	done

ViridianForestText9::
	text "TRAINER TIPS"

	para "If you want to"
	line "avoid battles,"
	cont "stay away from"
	cont "grassy areas!"
	done

ViridianForestText10::
	text "For poison, use"
	line "ANTIDOTE! Get it"
	cont "at #MON MARTs!"
	done

ViridianForestText11::
	text "TRAINER TIPS"

	para "Contact PROF.OAK"
	line "via PC to get"
	cont "your #DEX"
	cont "evaluated!"
	done

ViridianForestText12::
	text "TRAINER TIPS"

	para "No stealing of"
	line "#MON from"
	cont "other trainers!"
	cont "Catch only wild"
	cont "#MON!"
	done

ViridianForestText13::
	text "TRAINER TIPS"

	para "Weaken #MON"
	line "before attempting"
	cont "capture!"

	para "When healthy,"
	line "they may escape!"
	done

ViridianForestText14::
	text "LEAVING"
	line "VIRIDIAN FOREST"
	cont "PEWTER CITY AHEAD"
	done


ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  5, ROUTE_2_FOREST_NORTH_GATE, 3
	warp_event 16, 53, ROUTE_2_FOREST_SOUTH_GATE, 1
	warp_event 17, 53, ROUTE_2_FOREST_SOUTH_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 17, 19, BGEVENT_READ, ViridianForestInsideSign
	bg_event  9, 31, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore

	def_object_events
