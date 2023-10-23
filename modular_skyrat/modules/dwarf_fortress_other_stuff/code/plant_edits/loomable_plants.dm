/obj/item/grown
	var/thread_type = null

/obj/item/grown/proc/set_up_looming()
	if(!thread_type)
		return

	AddElement(/datum/element/loomable, thread_type)

/obj/item/grown/cotton
	thread_type = /obj/item/stack/dwarf_certified/thread/cotton

// Making a whole new reeds plant right here just for this, why not

/obj/item/seeds/river_reeds
	name = "pack of river reed seeds"
	desc = "These seeds grow into river reeds."
	icon_state = "seed-sugarcane"
	species = "reeds"
	plantname = "Reeds"
	growing_icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/growing_plants.dmi'
	product = /obj/item/grown/reeds
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	yield = 4
	reagents_add = list(/datum/reagent/consumable/nutriment/cloth_fibers = 0.04)

/obj/item/grown/reeds
	name = "river reeds"
	desc = "The stalks of reeds commonly found growing near sources of water."
	icon_state = "grassclump"
	w_class = WEIGHT_CLASS_SMALL
	thread_type = /obj/item/stack/dwarf_certified/thread/reed

// This isn't really a plant but it falls here for stuff fabrics need

/obj/structure/spider/stickyweb/Destroy()
	new /obj/item/stack/dwarf_certified/thread/silk(drop_location())
	. = ..()

/obj/structure/spider/stickyweb/examine(mob/user)
	. = ..()

	. += span_notice("You could probably get some spider silk thread if you broke [src].")
