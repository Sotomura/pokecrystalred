	object_const_def
	const ROUTE2FORESTNORTHGATE_SCIENTIST

Route2ForestNorthGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route2ForestNorthGateManScript:
	jumptextfaceplayer Route2ForestNorthGateManText

Route2ForestNorthGateOldManScript:
	jumptextfaceplayer Route2ForestNorthGateOldManText

Route2ForestNorthGateManText::
	text "Many #MON live"
	line "only in forests "
	cont "and caves."

	para "You need to look"
	line "everywhere to get"
	cont "different kinds!"
	done

Route2ForestNorthGateOldManText::
	text "Have you noticed"
	line "the bushes on the"
	cont "roadside?"

	para "They can be cut"
	line "down by a special"
	cont "#MON move."
	done


Route2ForestNorthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_2, 6
	warp_event  5,  0, ROUTE_2, 6
	warp_event  4,  7, VIRIDIAN_FOREST, 1
	warp_event  5,  7, VIRIDIAN_FOREST, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2ForestNorthGateManScript, -1
	object_event  6,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route2ForestNorthGateOldManScript, -1
