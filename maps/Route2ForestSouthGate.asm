	object_const_def
	const ROUTE2FORESTSOUTHGATE_WOMAN
	const ROUTE2FORESTSOUTHGATE_GIRL

Route2ForestSouthGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route2ForestSouthGateWomanScript:
	jumptextfaceplayer Route2ForestSouthGateWomanText

Route2ForestSouthGateGirlScript:
	jumptextfaceplayer Route2ForestSouthGateGirlText

Route2ForestSouthGateWomanText::
	text "Are you going to"
	line "VIRIDIAN FOREST?"

	para "Be careful. It's"
	line "a natural maze!"
	done

Route2ForestSouthGateGirlText::
	text "RATTATA may be"
	line "small, but its"
	cont "bite is wicked!"

	para "Have you caught"
	line "one already?"
	done


Route2ForestSouthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, VIRIDIAN_FOREST, 2
	warp_event  5,  0, VIRIDIAN_FOREST, 2
	warp_event  4,  7, ROUTE_2, 7
	warp_event  5,  7, ROUTE_2, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2ForestSouthGateWomanScript, -1
	object_event  2,  3, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2ForestSouthGateGirlScript, -1
