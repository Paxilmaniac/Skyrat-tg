/datum/design/board/hydroponics/New()
	. = ..()
	build_type |= COLONY_FABRICATOR

/datum/design/board/cyborgrecharger/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB

/datum/design/board/microwave/New()
	. = ..()
	build_type |= COLONY_FABRICATOR

/datum/design/board/suit_storage_unit/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB

/datum/design/board/reagentgrinder/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
