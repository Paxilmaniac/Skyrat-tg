/turf/open/water/stream
	name = "stream"
	desc = "Gently flowing water, you reckon that with a pole you could catch some of the fish swimming around in it too."
	baseturfs = /turf/baseturf_bottom
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	color = "#a7e9ff"
	immerse_overlay_color = "#2c654f"
	/// The reagent we provide when a container is used on us
	var/datum/reagent/reagent_we_make = /datum/reagent/water

/turf/open/water/stream/Initialize(mapload)
	. = ..()
	make_fishable()

/// Adds the fishing spot element to the water turf
/turf/open/water/stream/proc/make_fishable()
	AddElement(/datum/element/lazy_fishing_spot, /datum/fish_source/surface_stream)

/turf/open/water/stream/examine(mob/user)
	. = ..()
	. += span_info("You could probably collect some [initial(reagent_we_make.name)] with an open container.")

/turf/open/water/stream/attackby(obj/item/attacking_item, mob/user, params)
	if(!attacking_item.is_open_container())
		return ..()
	if(!attacking_item.reagents.add_reagent(reagent_we_make, rand(5, 10)))
		to_chat(user, span_warning("[attacking_item] is full."))
		return
	user.visible_message(span_notice("[user] scoops from the [src] with [attacking_item]."), span_notice("You scoop out some of the [src] using [attacking_item]."))

/turf/open/water/stream/Entered(atom/movable/arrived)
	. = ..()
	wash_atom(arrived)
	wash_atom(loc)

/// Cleans the given atom of whatever dirties it
/turf/open/water/stream/proc/wash_atom(atom/nasty)
	nasty.wash(CLEAN_WASH)

// Fishing source for streams

/datum/fish_source/surface_stream
	fish_table = list(
		/obj/item/fish/catfish = 5,
		/obj/item/fish/needlefish = 10,
		/obj/item/fish/angelfish = 5,
		/obj/item/fish/plasmatetra = 5,
		/obj/item/fish/guppy = 5,
		/obj/item/fish/goldfish = 5,
	)
	catalog_description = "Surface Streams"

// Stagnant ponds of salty water, gross

/turf/open/water/stream/stagnant_pond
	name = "stagnant salt pond"
	desc = "Murky, kinda gross looking water that smells of salt. In better news, you can boil the water to get salt, how useful!"
	reagent_we_make = /datum/reagent/water/salt
	color = "#ffffff"
	immerse_overlay_color = "#5AAA88"

/turf/open/water/stream/stagnant_pond/make_fishable()
	AddElement(/datum/element/lazy_fishing_spot, /datum/fish_source/stagnant_pond)

// Fishing source for stagnant ponds, shelled creatures galore

/datum/fish_source/stagnant_pond
	fish_table = list(
		/obj/item/fish/catfish = 5,
		/obj/item/fish/needlefish = 10,
		/obj/item/fish/armorfish = 5,
		/obj/item/fish/chasm_crab = 5,
	)
	catalog_description = "Stagnant Ponds"

// We don't actually have a way to boil the salt water, well, we do now with this
/datum/chemical_reaction/saltwater_boiling
	required_reagents = list(/datum/reagent/water/salt = 1)
	results = list(/datum/reagent/consumable/salt = 1)
	required_temp = WATER_BOILING_POINT
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_DRINK | REACTION_TAG_ORGAN
