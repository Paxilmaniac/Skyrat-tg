/datum/design/geiger/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB

/datum/design/plumbing_eng/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB
