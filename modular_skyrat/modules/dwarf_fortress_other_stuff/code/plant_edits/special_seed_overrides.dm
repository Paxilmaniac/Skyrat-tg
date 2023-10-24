/obj/item/seeds
	/// If these seeds plant into something special, (like tree saplings) then we use this instead
	var/special_plant_type

/obj/item/seeds/tea
	special_plant_type = /obj/structure/flora/df_sapling/tea

/obj/item/seeds/toechtauese
	special_plant_type = /obj/structure/flora/df_sapling/tree_berry

/obj/item/seeds/korta_nut
	special_plant_type = /obj/structure/flora/df_sapling/nut

/obj/item/seeds/plum
	special_plant_type = /obj/structure/flora/df_sapling/plum

/obj/item/seeds/cocoapod
	special_plant_type = /obj/structure/flora/df_sapling/cacao

/obj/item/seeds/lime
	special_plant_type = /obj/structure/flora/df_sapling/lime

/obj/item/seeds/orange
	special_plant_type = /obj/structure/flora/df_sapling/orange

/obj/item/seeds/cocoapod/bungotree
	special_plant_type = /obj/structure/flora/df_sapling/bungo
