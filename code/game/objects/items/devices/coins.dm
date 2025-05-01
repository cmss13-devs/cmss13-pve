//*****************************Coin********************************/

/obj/item/coin
	icon = 'icons/obj/items/items.dmi'
	name = "Coin"
	icon_state = "coin"
	flags_atom = FPRINT|CONDUCT
	force = 0
	throwforce = 0
	w_class = SIZE_TINY
	black_market_value = 10
	var/string_attached
	var/sides = 2
	ground_offset_x = 8
	ground_offset_y = 4

/obj/item/coin/gold
	name = "gold coin"
	desc = "A coin of the purest gold."
	icon_state = "coin_gold"
	black_market_value = 30

/obj/item/coin/silver
	name = "silver coin"
	desc = "A coin of the purest silver."
	icon_state = "coin_silver"
	black_market_value = 25

//CO coin
/obj/item/coin/silver/falcon
	name = "falling falcons challenge coin"
	desc = "A small coin, bearing the falling falcons insignia."

/obj/item/coin/copper
	name = "copper coin"
	desc = "A familiar, but cheap form of currency."
	icon_state = "coin_copper"
	black_market_value = 30

/obj/item/coin/diamond
	name = "diamond coin"
	desc = "A coin of the most flawless diamond."
	icon_state = "coin_diamond"
	black_market_value = 35

/obj/item/coin/iron
	name = "iron coin"
	desc = "A coin made of sturdy iron. You fear this might become rusty."
	icon_state = "coin_iron"
	black_market_value = 15

/obj/item/coin/phoron
	name = "solid phoron coin"
	desc = "There are better uses for phoron."
	icon_state = "coin_phoron"
	black_market_value = 35

/obj/item/coin/uranium
	name = "uranium coin"
	desc = "A radioactive coin. Don't touch it!"
	icon_state = "coin_uranium"
	black_market_value = 35

/obj/item/coin/platinum
	name = "platinum coin"
	desc = "A coin made of shiny platinum. It is quite valuable."
	icon_state = "coin_platinum"
	black_market_value = 35

/obj/item/coin/chitin
	name = "chitin coin"
	desc = "Durable alien chitin pressed into a coin. There are much better uses for chitin..."
	icon_state = "coin_chitin"
	black_market_value = 35

/obj/item/coin/clown
	name = "clown coin"
	desc = "Smells like bananas. A miniature clown pressed his face lovingly into every one of these. HONK!"
	icon_state = "coin_clown"
	black_market_value = 35

/obj/item/coin/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/CC = W
		if(string_attached)
			to_chat(user, SPAN_NOTICE("There already is a string attached to this coin."))
			return
		if (CC.use(1))
			overlays += image('icons/obj/items/items.dmi',"coin_string_overlay")
			string_attached = 1
			to_chat(user, SPAN_NOTICE("You attach a string to the coin."))
		else
			to_chat(user, SPAN_NOTICE("This cable coil appears to be empty."))
		return
	else if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS))
		if(!string_attached)
			..()
			return

		var/obj/item/stack/cable_coil/CC = new/obj/item/stack/cable_coil(user.loc)
		CC.amount = 1
		CC.updateicon()
		overlays = list()
		string_attached = null
		to_chat(user, SPAN_NOTICE(" You detach the string from the coin."))
	else ..()

/obj/item/coin/attack_self(mob/user)
	..()
	var/result = rand(1, sides)
	var/comment = ""
	if(result == 1)
		comment = "tails"
	else if(result == 2)
		comment = "heads"
	user.visible_message(SPAN_NOTICE("[user] has thrown \the [src]. It lands on [comment]! "), \
						SPAN_NOTICE("You throw \the [src]. It lands on [comment]! "))


/obj/item/coin/marine
	name = "marine equipment token"
	desc = "I wonder what it does?"
	icon_state = "coin_copper"
	black_market_value = 0
	/// What is the token for?
	var/token_type = VEND_TOKEN_VOID

/obj/item/coin/marine/attackby(obj/item/W as obj, mob/user as mob) //To remove attaching a string functionality
	return

/obj/item/coin/marine/engineer
	name = "marine engineer support token"
	desc = "Insert this into an engineer vendor in order to access a support weapon."
	icon_state = "coin_gold"
	token_type = VEND_TOKEN_ENGINEER

/obj/item/coin/marine/specialist
	name = "marine specialist weapon token"
	desc = "Insert this into a USCM equipment vendor in order to access a single highly dangerous weapon."
	icon_state = "coin_diamond"
	token_type = VEND_TOKEN_SPEC

/obj/item/coin/marine/synth
	name = "synthetic experimental tool redemption token"
	desc = "Insert this into a synthetic experimental tools vendor in order to access a variety of experimental support tools."
	icon_state = "coin_synth"
	token_type = VEND_TOKEN_SYNTH

// requisition tokens for extraction

/obj/item/coin/requisitionpoint
	name = "null-credit requisition token"
	desc = "You probably shouldn't have this.."
	icon_state = "coin_iron"
	black_market_value = 0

/obj/item/coin/requisitionpoint/one
	name = "one-credit requisition token"
	desc = "A stamped iron coin that can be redeemed at the Hideout requisitions bay for goods or services worth 1RP."

/obj/item/coin/requisitionpoint/five
	name = "five-credit requisition token"
	desc = "A stamped copper coin that can be redeemed at the Hideout requisitions bay for goods or services worth 5RP."
	icon_state = "coin_copper"

/obj/item/coin/requisitionpoint/ten
	name = "ten-credit requisition token"
	desc = "A stamped silver coin that can be redeemed at the Hideout requisitions bay for goods or services worth 10RP."
	icon_state = "coin_silver"

/obj/item/coin/requisitionpoint/twenty
	name = "twenty-credit requisition token"
	desc = "A stamped golden coin that can be redeemed at the Hideout requisitions bay for goods or services worth 20RP."
	icon_state = "coin_gold"

/obj/item/coin/requisitionpoint/fifty
	name = "fifty-credit requisition token"
	desc = "A stamped platinum coin that can be redeemed at the Hideout requisitions bay for goods or services worth 50RP."
	icon_state = "coin_platinum"

/obj/item/coin/requisitionpoint/onehundred
	name = "one-hundred-credit requisition token"
	desc = "A stamped diamond coin that can be redeemed at the Hideout requisitions bay for goods or services worth 100RP."
	icon_state = "coin_diamond"

/obj/item/coin/requisitionpoint/twohundred
	name = "two-hundred-credit requisition token"
	desc = "A stamped phoron coin that can be redeemed at the Hideout requisitions bay for goods or services worth 200RP."
	icon_state = "coin_phoron"

/obj/item/coin/vehicletoken
	name = "vehicle redemption token (null)"
	desc = "You probably shouldn't have this.."
	icon_state = "coin_uranium"
	black_market_value = 0

/obj/item/coin/vehicletoken/boxvan
	name = "vehicle redemption token (Grey Van)"
	desc = "A stamped steel coin which can be redeemed at the Hideout requisition bay for a civilian van, painted grey."

/obj/item/coin/vehicletoken/boxvan/ambulance
	name = "vehicle redemption token (Ambulance)"
	desc = "A stamped steel coin which can be redeemed at the Hideout requisition bay for a civilian medical van."

/obj/item/coin/vehicletoken/boxvan/copcar
	name = "vehicle redemption token (Police Cruiser)"
	desc = "A stamped steel coin which can be redeemed at the Hideout requisition bay for a police car."

/obj/item/coin/vehicletoken/boxvan/pizza
	name = "vehicle redemption token (Planet Pizza Delivery Truck)"
	desc = "A stamped steel coin which can be redeemed at the Hideout requisition bay for a civilian pizza delivery truck with a Planet Pizza paintjob."

/obj/item/coin/vehicletoken/truck
	name = "vehicle redemption token (Cargo Truck)"
	desc = "A stamped steel coin which can be redeemed at the Hideout requisition bay for a civilian cargo truck."

/obj/item/coin/vehicletoken/arc
	name = "vehicle redemption token (Armored Recon Carrier, Standard)"
	desc = "A stamped steel-phoron alloy coin which can be redeemed at the Hideout requisition bay for an ARC with a frontal cannon."
	icon_state = "coin_chitin"

/obj/item/coin/vehicletoken/arc/unarmed
	name = "vehicle redemption token (Armored Recon Carrier, Unarmed)"
	desc = "A stamped steel-phoron alloy coin which can be redeemed at the Hideout requisition bay for an ARC with no munitions attached."
	icon_state = "coin_chitin"

/obj/item/coin/vehicletoken/apc
	name = "vehicle redemption token (Armored Personnel Carrier, Standard)"
	desc = "A stamped steel-phoron alloy coin which can be redeemed at the Hideout requisition bay for an APC armed with side-gunner M56 emplacements, a frontal cannon, and dualcannons."
	icon_state = "coin_chitin"

/obj/item/coin/vehicletoken/apc/unarmed
	name = "vehicle redemption token (Armored Personnel Carrier, Unarmed)"
	desc = "A stamped steel-phoron alloy coin which can be redeemed at the Hideout requisition bay for an APC with no munitions attached."
	icon_state = "coin_chitin"

/obj/item/coin/vehicletoken/apc/med
	name = "vehicle redemption token (Armored Personnel Carrier, Medical)"
	desc = "A stamped steel-phoron alloy coin which can be redeemed at the Hideout requisition bay for an APC with a medical suite, frontal cannon, and dualcannons."
	icon_state = "coin_chitin"

/obj/item/coin/vehicletoken/apc/command
	name = "vehicle redemption token (Armored Personnel Carrier, Command)"
	desc = "A stamped steel-phoron alloy coin which can be redeemed at the Hideout requisition bay for an APC with a command suite, radio tower, frontal cannon, and dualcannons."
	icon_state = "coin_chitin"

/obj/item/coin/vehicletoken/apc/antiair
	name = "vehicle redemption token (Armored Personnel Carrier, Anti-Air)"
	desc = "A stamped steel-phoron alloy coin which can be redeemed at the Hideout requisition bay for an APC with an anti-air cannon and vertical launch relay."
	icon_state = "coin_chitin"

/obj/item/coin/vehicletoken/tank
	name = "vehicle redemption token (M34A2 Longstreet Light Tank, Standard)"
	desc = "A stamped titanium coin which can be redeemed at the Hideout requisition bay for a tank using a modular cannon with an LTB cannon and M56 emplacement attached, a weapons sensor array, and a paladin armor module."
	icon_state = "coin_synth"

/obj/item/coin/vehicletoken/tank/unarmed
	name = "vehicle redemption token (M34A2 Longstreet Light Tank, Unarmed)"
	desc = "A stamped titanium coin which can be redeemed at the Hideout requisition bay for a tank using a modular cannon with no pre-attached module."
	icon_state = "coin_synth"

/obj/item/coin/vehicletoken/tank/minigun
	name = "vehicle redemption token (M34A2 Longstreet Light Tank, Chaingun)"
	desc = "A stamped titanium coin which can be redeemed at the Hideout requisition bay for a tank using a modular cannon with a LTAA-AP chaingun and flamer emplacement attached, a weapons sensor array, and a ballistic armor module."
	icon_state = "coin_synth"

/obj/item/coin/vehicletoken/tank/flamer
	name = "vehicle redemption token (M34A2 Longstreet Light Tank, Flamer)"
	desc = "A stamped titanium coin which can be redeemed at the Hideout requisition bay for a tank using a modular cannon with a DRG-N flamethrower and grenade launcher emplacement attached, an overdrive enhancer, and a ballistic armor module."
	icon_state = "coin_synth"

/obj/item/coin/vehicletoken/tank/autocannon
	name = "vehicle redemption token (M34A2 Longstreet Light Tank, Autocannon)"
	desc = "A stamped titanium coin which can be redeemed at the Hideout requisition bay for a tank using a modular cannon with a AC3-E flak cannon and rocket emplacement attached, a weapons sensor array, and a ballistic armor module."
	icon_state = "coin_synth"