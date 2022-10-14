GLOBAL_LIST_INIT(metal_clothing_colors, list("#c74900","#857994","#bec7d3",))
GLOBAL_LIST_INIT(leather_clothing_colors, list("#362a2a","#272320","#27252e","#53453a","#6e423c","#533737",))
GLOBAL_LIST_INIT(fabric_clothing_colors, list("#F1F1F1","#ffefd3","#dbcbb5","#e5e9be",))
GLOBAL_LIST_INIT(science_robe_colors, list("#46313f","#382744","#443653",))

/*
* Underclothes
*/

/obj/item/clothing/under/costume/buttondown/event_clothing
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	can_adjust = FALSE
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	greyscale_colors = "#F1F1F1#F1F1F1"

// Overalls

/obj/item/clothing/under/costume/buttondown/event_clothing/overalls
	name = "leather overalls"
	desc = "Leather overalls with a pretty normal looking shirt under it, you have no idea what any of this is actually made from."
	icon_state = "overalls_buttondown"
	greyscale_config = /datum/greyscale_config/overalls
	greyscale_config_worn = /datum/greyscale_config/overalls/worn

/obj/item/clothing/under/costume/buttondown/event_clothing/overalls/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "overalls_longshirt"
	set_greyscale("[pick(GLOB.fabric_clothing_colors)][pick(GLOB.leather_clothing_colors)]")

//Pants with a shirt

/obj/item/clothing/under/costume/buttondown/event_clothing/workpants
	name = "leather pants"
	desc = "Worn looking leather pants with a pretty comfortable shirt on top, where the leather for these pants came from is as of now unknown."
	icon_state = "pants_buttondown"
	greyscale_config = /datum/greyscale_config/workpants
	greyscale_config_worn = /datum/greyscale_config/workpants/worn

/obj/item/clothing/under/costume/buttondown/event_clothing/workpants/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "pants_longshirt"
	set_greyscale("[pick(GLOB.fabric_clothing_colors)][pick(GLOB.leather_clothing_colors)]")

//High waist pants with a shirt

/obj/item/clothing/under/costume/buttondown/event_clothing/longpants
	name = "high waist leather pants"
	desc = "Leather pants with an exceptionally high waist for working around water, or for geeks, you choose."
	icon_state = "longpants_buttondown"
	greyscale_config = /datum/greyscale_config/longpants
	greyscale_config_worn = /datum/greyscale_config/longpants/worn

/obj/item/clothing/under/costume/buttondown/event_clothing/longpants/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "longpants_longshirt"
	set_greyscale("[pick(GLOB.fabric_clothing_colors)][pick(GLOB.leather_clothing_colors)]")

/obj/item/clothing/under/costume/buttondown/event_clothing/skirt
	name = "long skirt"
	desc = "A plain skirt (or kilt if you feel like it) with a fairly comfortable shirt on top."
	icon_state = "skirt_buttondown"
	greyscale_config = /datum/greyscale_config/skirt
	greyscale_config_worn = /datum/greyscale_config/skirt/worn

/obj/item/clothing/under/costume/buttondown/event_clothing/skirt/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "skirt_longshirt"
	set_greyscale("[pick(GLOB.fabric_clothing_colors)][pick(GLOB.fabric_clothing_colors)]")

/*
* Misc
*/

/obj/item/clothing/shoes/jackboots/leather
	name = "leather boots"
	desc = "Tough leather boots, though you can't really tell what /kind/ of leather it is."
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "civboots"
	strip_delay = 30
	equip_delay_other = 50
	resistance_flags = NONE
	armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 20, BIO = 90, FIRE = 10, ACID = 50)
	can_be_tied = TRUE
	greyscale_colors = "#3a2313"
	greyscale_config = /datum/greyscale_config/civboots
	greyscale_config_worn = /datum/greyscale_config/civboots/worn

/obj/item/clothing/shoes/jackboots/leather/Initialize(mapload)
	. = ..()
	create_storage(type = /datum/storage/pockets/shoes)
	set_greyscale("[pick(GLOB.leather_clothing_colors)]")

/obj/item/clothing/shoes/jackboots/leather/armored
	name = "armored boots"
	desc = "Tough leather boots with some kind of metal plating added to the toes and shins for extra protection."
	icon_state = "armorboots"
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 90, FIRE = 30, ACID = 50)
	greyscale_colors = "#3a2313#ec6a00"
	greyscale_config = /datum/greyscale_config/armorboots
	greyscale_config_worn = /datum/greyscale_config/armorboots/worn

/obj/item/clothing/shoes/jackboots/leather/armored/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.leather_clothing_colors)][pick(GLOB.metal_clothing_colors)]")

/obj/item/clothing/shoes/event_sandals
	name = "sandals"
	desc = "A pair of rather plain sandals."
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "sandals"
	inhand_icon_state = "wizshoe"
	strip_delay = 5
	equip_delay_other = 50
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 10, FIRE = 0, ACID = 0)
	can_be_tied = FALSE
	species_exception = list(/datum/species/golem)
	greyscale_colors = "#3a2313"
	greyscale_config = /datum/greyscale_config/sandals
	greyscale_config_worn = /datum/greyscale_config/sandals/worn

/obj/item/clothing/shoes/event_sandals/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.leather_clothing_colors)]")

/obj/item/clothing/gloves/color/black/leather
	name = "leather gloves"
	desc = "Made of some unknown leather, they'll probably protect your hands from burning."
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "holegloves"
	greyscale_colors = "#3a2313"
	greyscale_config = /datum/greyscale_config/holegloves
	greyscale_config_worn = /datum/greyscale_config/holegloves/worn
	cut_type = null

/obj/item/clothing/gloves/color/black/leather/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.leather_clothing_colors)]")

/obj/item/clothing/gloves/fingerless/leather
	name = "fingerless leather gloves"
	desc = "Made of some unknown leather, protecting everything but your fingertips, so everything but the most important parts."
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "fingieless"
	greyscale_colors = "#3a2313"
	greyscale_config = /datum/greyscale_config/fingieless
	greyscale_config_worn = /datum/greyscale_config/fingieless/worn

/obj/item/clothing/gloves/fingerless/leather/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.leather_clothing_colors)]")

/obj/item/clothing/neck/mantle/cloak
	name = "cloak"
	desc = "A cloak made of leather, for windy days and terrible rain, you wouldn't need this thing if you just lived underground you know."
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "cloak"
	greyscale_colors = "#3a2313"
	greyscale_config = /datum/greyscale_config/event_cloak
	greyscale_config_worn = /datum/greyscale_config/event_cloak/worn

/obj/item/clothing/neck/mantle/cloak/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.leather_clothing_colors)]")

/obj/item/clothing/neck/mantle/cloak/cloth
	name = "cloak"
	desc = "A cloak made of a fine cloth of some kind, serves no practical purpose aside from looking posh."
	greyscale_colors = "#F1F1F1"

/obj/item/clothing/neck/mantle/cloak/cloth/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.fabric_clothing_colors)]")

/obj/item/clothing/suit/apron/event_apron
	name = "apron"
	desc = "A basic apron made of close enough to white fabric to be used by butchers and doctors alike, some may even say these are the same job."
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	greyscale_colors = "#F1F1F1"
	greyscale_config = /datum/greyscale_config/apron
	greyscale_config_worn = /datum/greyscale_config/apron/worn

/obj/item/clothing/suit/apron/event_apron/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.fabric_clothing_colors)]")

/obj/item/clothing/suit/apron/event_apron/leather
	desc = "A basic apron made of thick leather, popular with blacksmiths, and other individuals who might want to protect their chest."
	greyscale_colors = "#3a2313"

/obj/item/clothing/suit/apron/event_apron/leather/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.leather_clothing_colors)]")

/obj/item/clothing/head/helmet/event_hardhat
	name = "armored hardhat"
	desc = "A reinforced hardhat issued to defense forces and mining teams alike."
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "hardhat"
	flags_inv = null
	dog_fashion = null
	greyscale_colors = "#ec6a00"
	greyscale_config = /datum/greyscale_config/hardhat
	greyscale_config_worn = /datum/greyscale_config/hardhat/worn

/obj/item/clothing/head/helmet/event_hardhat/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.metal_clothing_colors)]")

/obj/item/clothing/suit/armor/armor_plate
	name = "armor plate"
	desc = "A plate of some pretty cheap looking metal, but at least it'll keep you safe, right?"
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "armor"
	greyscale_colors = "#ec6a00"
	greyscale_config = /datum/greyscale_config/armor_plate
	greyscale_config_worn = /datum/greyscale_config/armor_plate/worn

/obj/item/clothing/suit/armor/armor_plate/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.metal_clothing_colors)]")

/obj/item/storage/backpack/explorer/event
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "backpack"
	worn_icon_state = "backpack_worn"

/obj/item/storage/backpack/satchel/explorer/event
	icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	worn_icon = 'modular_skyrat/modules/GAGS/icons/event_clothes_human.dmi'
	icon_state = "satchel"
	worn_icon_state = "satchel_worn"

/obj/item/clothing/under/costume/skyrat/bathrobe/event
	name = "robes"
	desc = "Comfortable, definitely posh looking robes fit for a king, or just a huge nerd who has no other job."

/obj/item/clothing/under/costume/skyrat/bathrobe/event/Initialize(mapload)
	. = ..()
	set_greyscale("[pick(GLOB.science_robe_colors)]")

/obj/item/storage/belt/sabre/cargo/security_actually
	name = "leather sheath"
	desc = "A fairly standard looking guard's sabre sheath, its a bit dusty from the trip here."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/sabre/cargo/security_actually/PopulateContents()
	new /obj/item/melee/sabre/cargo/security_actually(src)
	update_appearance()

/obj/item/melee/sabre/cargo/security_actually
	name = "guard's sabre"
	desc = "An expertly crafted sabre issued to caravan guards, the fact you're still here means it must've worked!"
