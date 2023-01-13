/obj/item/storage/box/trail_food_kit
	name = "wrapped travel meal"
	desc = "A brown paper package which theoretically contains edible food for those on the go."
	icon = 'modular_skyrat/modules/imported_vendors/icons/imported_quick_foods.dmi'
	icon_state = "foodpack_generic_big"
	illustration = null

/obj/item/storage/box/foodpack/PopulateContents()
	. = ..()
	new /obj/item/food/plumphelmetbiscuit(src)
	new /obj/item/food/sausage(src)
	new /obj/item/reagent_containers/cup/glass/flask/filled(src)

/obj/item/reagent_containers/cup/glass/flask/filled
	list_reagents = list(/datum/reagent/consumable/ethanol/wine = 30)
