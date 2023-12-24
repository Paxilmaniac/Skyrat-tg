/datum/design/geiger/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB

/datum/design/plumbing_eng/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB

/datum/design/boxcutter/New()
	. = ..()
	build_type |= COLONY_FABRICATOR

/datum/design/universal_scanner/New()
	. = ..()
	build_type |= COLONY_FABRICATOR

/datum/design/conveyor_sorter/improved/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB
