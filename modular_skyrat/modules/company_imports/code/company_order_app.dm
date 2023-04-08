/// Global list that contains all of the things that can be ordered
GLOBAL_LIST_EMPTY(ftu_import_products)

/datum/computer_file/program/ftu_import
	filename = "ftunow"
	filedesc = "FTU Import Interface"
	category = PROGRAM_CATEGORY_SUPL
	program_icon_state = "request"
	extended_desc = "An application that allows the user to interface with the Free Trade Union's vast trade network. The supplies of the universe, sent directly to your station."
	size = 5 // This is half the size of the NT IRN, because while I don't expect most people to use the IRN, I expect most people to at least want this
	tgui_id = "FreeTradeImport"
	program_icon = "money-bill-wave"
	requires_ntnet = TRUE
	usage_flags = PROGRAM_LAPTOP | PROGRAM_TABLET
	/// If orders cannot be placed using the id's department budget, this will be set to true
	var/non_budget = FALSE
	/// If any orders will be paid for by the id's own account, or its department budget
	var/self_paid = TRUE
	/// List of all the things currently in the cart
	var/list/datum/ftu_import/grocery_list = list()

/datum/computer_file/program/ftu_import/New()
	. = ..()

	if(GLOB.ftu_import_products.len)
		return
	for(var/datum/orderable_item/path as anything in subtypesof(/datum/orderable_item))
		if(!initial(path.item_path))
			continue
		GLOB.ftu_import_products += new path

/// Gets the total cost of every item in the cart
/datum/computer_file/program/ftu_import/proc/get_total_cost()
	var/cost = 0
	for(var/datum/orderable_item/item as anything in grocery_list)
		cost += grocery_list[item] * item.cost_per_order
	return cost

/datum/computer_file/program/ftu_import/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	if(!isliving(usr))
		return
	var/mob/living/living_user = usr
	switch(action)
		if("toggleprivate")
			self_paid = !self_paid

		if("add_one")
			var/datum/orderable_item/wanted_item = locate(params["target"]) in GLOB.ftu_import_products
			grocery_list[wanted_item] += 1

		if("remove_one")
			var/datum/orderable_item/wanted_item = locate(params["target"]) in GLOB.ftu_import_products
			if(!grocery_list[wanted_item])
				return
			grocery_list[wanted_item] -= 1
			if(!grocery_list[wanted_item])
				grocery_list -= wanted_item

		if("cart_set")
			//this is null if the action doesn't need it (purchase, quickpurchase)
			var/datum/orderable_item/wanted_item = locate(params["target"]) in GLOB.ftu_import_products
			grocery_list[wanted_item] = clamp(params["amt"], 0, 20)
			if(!grocery_list[wanted_item])
				grocery_list -= wanted_item

		if("purchase")
			if(!grocery_list.len)
				return
			var/obj/item/card/id/used_id_card = living_user.get_idcard(TRUE)
			if(!used_id_card || !used_id_card.registered_account)
				return
			var/datum/bank_account/used_account = self_paid ? used_id_card.registered_account : SSeconomy.get_dep_account(used_id_card.registered_account.account_job.paycheck_department)
			if(!purchase_items(used_account))
				return
			order_groceries(living_user, used_id_card, grocery_list)
			grocery_list.Cut()

	return TRUE

/datum/computer_file/program/ftu_import/ui_data(mob/user)
	var/list/data = list()

	/// The total cost displayed in the tgui menu
	var/cost = get_total_cost()
	data["total_cost"] = "[cost])"

	var/obj/item/card/id/id_card = computer.computer_id_slot?.GetID()
	var/datum/bank_account/account_we_use

	if(id_card?.registered_account)
		if((ACCESS_COMMAND in id_card.access))
			non_budget = FALSE
			account_we_use = self_paid ? id_card?.registered_account : SSeconomy.get_dep_account(id_card.registered_account.account_job.paycheck_department)
		else
			self_paid = TRUE // Just to be safe
			non_budget = TRUE
			account_we_use = id_card.registered_account
	else
		self_paid = TRUE // Again lets just be safe
		non_budget = TRUE

	data["points"] = account_we_use?.account_balance
	data["non_budget"] = non_budget
	data["self_paid"] = self_paid

	for(var/datum/orderable_item/item as anything in GLOB.ftu_import_products)
		data["item_amts"] += list(list(
			"name" = item.name,
			"amt" = grocery_list[item],
		))

	return data

/datum/computer_file/program/ftu_import/ui_static_data(mob/user)
	var/list/data = list()

	data["order_datums"] = list()
	for(var/datum/orderable_item/item as anything in GLOB.ftu_import_products)
		data["order_datums"] += list(list(
			"name" = item.name,
			"desc" = item.desc,
			"cat" = item.category_index,
			"ref" = REF(item),
			"cost" = item.cost_per_order,
			"product_icon" = icon2base64(getFlatIcon(image(icon = initial(item.item_path.icon), icon_state = initial(item.item_path.icon_state)), no_anim=TRUE))
		))

	return data

/// Checks if the given bank account can actually purchase the items in the cart
/datum/computer_file/program/ftu_import/proc/purchase_items(datum/bank_account)
	var/final_cost = get_total_cost()
	var/failure_message = "Sorry, but you do not have enough money."
	if(express)
		final_cost *= express_cost_multiplier
		failure_message += " Remember, Express upcharges the cost!"
	if(card.registered_account.adjust_money(-final_cost, "[name]: Purchase"))
		return TRUE
	say(failure_message)
	return FALSE
