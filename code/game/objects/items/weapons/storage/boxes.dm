/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/storage/box
	name = "box"
	desc = "It's just an ordinary box."
	icon_state = "box"
	item_state = "syringe_kit"
	max_storage_space = DEFAULT_BOX_STORAGE
	var/foldable = /obj/item/stack/material/cardboard	// BubbleWrap - if set, can be folded (when empty) into a sheet of cardboard

/obj/item/storage/box/large
	name = "large box"
	icon_state = "largebox"
	w_class = 4
	max_w_class = 3
	max_storage_space = DEFAULT_LARGEBOX_STORAGE

// BubbleWrap - A box can be folded up to make card
/obj/item/storage/box/attack_self(var/mob/user)
	if(..()) return

	//try to fold it.
	if ( contents.len )
		return

	if ( !ispath(src.foldable) )
		return
	var/found = 0
	// Close any open UI windows first
	for(var/mob/M in range(1))
		if (M.s_active == src)
			src.close(M)
		if ( M == user )
			found = 1
	if ( !found )	// User is too far away
		return
	// Now make the cardboard
	user << "<span class='notice'>You fold [src] flat.</span>"
	if(ispath(foldable, /obj/item/stack))
		var/stack_amt = max(2**(w_class - 3), 1)
		new src.foldable(get_turf(src), stack_amt)
	else
		new src.foldable(get_turf(src))
	qdel(src)

/obj/item/storage/box/make_exact_fit()
	..()
	foldable = null //special form fitted boxes should not be foldable.

/obj/item/storage/box/survival/
	startswith = list(/obj/item/clothing/mask/breath = 1,
					/obj/item/tank/emergency/oxygen = 1,
					/obj/item/clothing/mask/gas/aquabreather = 1
					)

/obj/item/storage/box/engineer/
	startswith = list(/obj/item/clothing/mask/breath = 1,
					/obj/item/tank/emergency/oxygen/engi = 1,
					/obj/item/clothing/mask/gas/aquabreather = 1
					)

/obj/item/storage/box/gloves
	name = "box of latex gloves"
	desc = "Contains white gloves."
	icon_state = "latex"
	startswith = list(/obj/item/clothing/gloves/latex = 7)

/obj/item/storage/box/masks
	name = "box of sterile masks"
	desc = "This box contains masks of sterility."
	icon_state = "sterile"
	startswith = list(/obj/item/clothing/mask/surgical = 7)


/obj/item/storage/box/syringes
	name = "box of syringes"
	desc = "A box full of syringes."
	icon_state = "syringe"
	startswith = list(/obj/item/reagent_containers/syringe = 7)

/obj/item/storage/box/syringegun
	name = "box of syringe gun cartridges"
	desc = "A box full of compressed gas cartridges."
	icon_state = "syringe"
	startswith = list(/obj/item/syringe_cartridge = 7)


/obj/item/storage/box/beakers
	name = "box of beakers"
	icon_state = "beaker"
	startswith = list(/obj/item/reagent_containers/glass/beaker = 7)

/obj/item/storage/box/injectors
	name = "box of DNA injectors"
	desc = "This box contains injectors it seems."
	startswith = list(/obj/item/dnainjector/h2m = 6)

/obj/item/storage/box/shotgunammo
	name = "box of shotgun slugs"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/shotgun = 7)

/obj/item/storage/box/sniperammo
	name = "box of .50BMG shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	startswith = list(/obj/item/ammo_casing/sniper = 7)

/obj/item/storage/box/flashbangs
	name = "box of flashbangs"
	desc = "A box containing 7 antipersonnel flashbang grenades.<br> WARNING: These devices are extremely dangerous and can cause blindness or deafness from repeated use."
	icon_state = "flashbang"
	startswith = list(/obj/item/grenade/flashbang = 7)

/obj/item/storage/box/teargas
	name = "box of pepperspray grenades"
	desc = "A box containing 7 tear gas grenades. A gas mask is printed on the label.<br> WARNING: Exposure carries risk of serious injury or death. Keep away from persons with lung conditions."
	icon_state = "flashbang"
	startswith = list(/obj/item/grenade/chem_grenade/teargas = 7)

/obj/item/storage/box/emps
	name = "box of emp grenades"
	desc = "A box containing 5 military grade EMP grenades.<br> WARNING: Do not use near unshielded electronics or biomechanical augmentations, death or permanent paralysis may occur."
	icon_state = "flashbang"
	startswith = list(/obj/item/grenade/empgrenade = 5)

/obj/item/storage/box/frags
	name = "box of frag grenades"
	desc = "A box containing 5 military grade fragmentation grenades.<br> WARNING: Live explosives. Misuse may result in serious injury or death."
	icon_state = "flashbang"
	startswith = list(/obj/item/grenade/frag = 5)

/obj/item/storage/box/fragshells
	name = "box of frag shells"
	desc = "A box containing 5 military grade fragmentation shells.<br> WARNING: Live explosive munitions. Misuse may result in serious injury or death."
	icon_state = "flashbang"
	startswith = list(/obj/item/grenade/frag/shell = 5)

/obj/item/storage/box/smokes
	name = "box of smoke bombs"
	desc = "A box containing 5 smoke bombs."
	icon_state = "flashbang"
	startswith = list(/obj/item/grenade/smokebomb = 5)

/obj/item/storage/box/anti_photons
	name = "box of anti-photon grenades"
	desc = "A box containing 5 experimental photon disruption grenades."
	icon_state = "flashbang"
	startswith = list(/obj/item/grenade/anti_photon = 5)

/obj/item/storage/box/supermatters
	name = "box of supermatter grenades"
	desc = "A box containing 5 highly experimental supermatter grenades."
	icon_state = "radbox"
	startswith = list(/obj/item/grenade/supermatter = 5)

/obj/item/storage/box/trackimp
	name = "boxed tracking implant kit"
	desc = "Box full of scum-bag tracking utensils."
	icon_state = "implant"
	startswith = list(/obj/item/implantcase/tracking = 4,
		/obj/item/implanter = 1,
		/obj/item/implantpad = 1,
		/obj/item/locator = 1)

/obj/item/storage/box/chemimp
	name = "boxed chemical implant kit"
	desc = "Box of stuff used to implant chemicals."
	icon_state = "implant"
	startswith = list(/obj/item/implantcase/chem = 5,
					/obj/item/implanter = 1,
					/obj/item/implantpad = 1)



/obj/item/storage/box/rxglasses
	name = "box of prescription glasses"
	desc = "This box contains nerd glasses."
	icon_state = "glasses"
	startswith = list(/obj/item/clothing/glasses/regular = 7)

/obj/item/storage/box/cdeathalarm_kit
	name = "death alarm kit"
	desc = "Box of stuff used to implant death alarms."
	icon_state = "implant"
	item_state = "syringe_kit"
	startswith = list(/obj/item/implanter = 1,
				/obj/item/implantcase/death_alarm = 6)

/obj/item/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = "It has a large ketchup smear on it."
	startswith = list(/obj/item/reagent_containers/food/condiment = 6)

/obj/item/storage/box/cups
	name = "box of paper cups"
	desc = "It has pictures of paper cups on the front."
	startswith = list(/obj/item/reagent_containers/food/drinks/sillycup = 7)

/obj/item/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = "<B>Instructions:</B> <I>Heat in microwave. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "donk_kit"
	startswith = list(/obj/item/reagent_containers/food/snacks/donkpocket = 6)

/obj/item/storage/box/sinpockets
	name = "box of sin-pockets"
	desc = "<B>Instructions:</B> <I>Crush bottom of package to initiate chemical heating. Wait for 20 seconds before consumption. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "donk_kit"
	startswith = list(/obj/item/reagent_containers/food/snacks/donkpocket/sinpocket = 6)

/obj/item/storage/box/monkeycubes
	name = "monkey cube box"
	desc = "Drymate brand monkey cubes. Just add water!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	can_hold = list(/obj/item/reagent_containers/food/snacks/monkeycube)
	startswith = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped = 5)

/obj/item/storage/box/monkeycubes/farwacubes
	name = "farwa cube box"
	desc = "Drymate brand farwa cubes, shipped from Ahdomai. Just add water!"
	startswith = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/farwacube = 5)

/obj/item/storage/box/monkeycubes/stokcubes
	name = "stok cube box"
	desc = "Drymate brand stok cubes, shipped from Moghes. Just add water!"
	startswith = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/stokcube = 5)

/obj/item/storage/box/monkeycubes/neaeracubes
	name = "neaera cube box"
	desc = "Drymate brand neaera cubes, shipped from Jargon 4. Just add water!"
	startswith = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube = 5)

/obj/item/storage/box/ids
	name = "box of spare IDs"
	desc = "Has so many empty IDs."
	icon_state = "id"
	startswith = list(/obj/item/card/id = 7)

/obj/item/storage/box/seccarts
	name = "box of spare R.O.B.U.S.T. Cartridges"
	desc = "A box full of R.O.B.U.S.T. Cartridges, used by Security."
	icon_state = "pda"
	startswith = list(/obj/item/cartridge/security = 7)

/obj/item/storage/box/handcuffs
	name = "box of spare handcuffs"
	desc = "A box full of handcuffs."
	icon_state = "handcuff"
	startswith = list(/obj/item/handcuffs = 7)

/obj/item/storage/box/mousetraps
	name = "box of Pest-B-Gon mousetraps"
	desc = "<B><FONT color='red'>WARNING:</FONT></B> <I>Keep out of reach of children</I>."
	icon_state = "mousetraps"
	startswith = list(/obj/item/assembly/mousetrap = 6)

/obj/item/storage/box/pillbottles
	name = "box of pill bottles"
	desc = "It has pictures of pill bottles on its front."
	startswith = list(/obj/item/storage/pill_bottle = 7)

/obj/item/storage/box/snappops
	name = "snap pop box"
	desc = "Eight wrappers of fun! Ages 8 and up. Not suitable for children."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"
	can_hold = list(/obj/item/toy/snappop)
	startswith = list(/obj/item/toy/snappop = 8)

/obj/item/storage/box/autoinjectors
	name = "box of injectors"
	desc = "Contains autoinjectors."
	icon_state = "syringe"

	startswith = list(/obj/item/reagent_containers/hypospray/autoinjector = 7)

/obj/item/storage/box/lights
	name = "box of replacement bulbs"
	icon = 'icons/obj/storage.dmi'
	icon_state = "light"
	desc = "This box is shaped on the inside so that only light tubes and bulbs fit."
	item_state = "syringe_kit"
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/storage/box/lights/New()
	..()
	make_exact_fit()

/obj/item/storage/box/lights/bulbs
	startswith = list(/obj/item/light/bulb = 21)

/obj/item/storage/box/lights/tubes
	name = "box of replacement tubes"
	icon_state = "lighttube"
	startswith = list(/obj/item/light/tube = 21)

/obj/item/storage/box/lights/mixed
	name = "box of replacement lights"
	icon_state = "lightmixed"
	startswith = list(/obj/item/light/tube = 14,
					/obj/item/light/bulb = 7)

/obj/item/storage/box/freezer
	name = "portable freezer"
	desc = "This nifty shock-resistant device will keep your 'groceries' nice and non-spoiled."
	icon = 'icons/obj/storage.dmi'
	icon_state = "portafreezer"
	item_state = "medicalpack"
	foldable = null
	max_w_class = 3
	w_class = 5
	can_hold = list(/obj/item/organ, /obj/item/reagent_containers/food, /obj/item/reagent_containers/glass)
	max_storage_space = DEFAULT_BACKPACK_STORAGE
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/storage/box/checkers
	name = "checkers box"
	desc = "This box holds a nifty portion of checkers. Foam-shaped on the inside so that only checkers may fit."
	icon_state = "checkers"
	max_storage_space = 24
	foldable = null
	can_hold = list(/obj/item/reagent_containers/food/snacks/checker)
	startswith = list(/obj/item/reagent_containers/food/snacks/checker = 12,
					/obj/item/reagent_containers/food/snacks/checker/red = 12)

/obj/item/storage/box/checkers/chess
	name = "black chess box"
	desc = "This box holds all the pieces needed for the black side of the chess board."
	icon_state = "chess_b"
	startswith = list(/obj/item/reagent_containers/food/snacks/checker/pawn = 8,
				/obj/item/reagent_containers/food/snacks/checker/knight = 2,
				/obj/item/reagent_containers/food/snacks/checker/bishop = 2,
				/obj/item/reagent_containers/food/snacks/checker/rook = 2,
				/obj/item/reagent_containers/food/snacks/checker/queen = 1,
				/obj/item/reagent_containers/food/snacks/checker/king = 1)

/obj/item/storage/box/checkers/chess/red
	name = "red chess box"
	desc = "This box holds all the pieces needed for the red side of the chess board."
	icon_state = "chess_r"
	startswith = list(/obj/item/reagent_containers/food/snacks/checker/pawn/red = 8,
				/obj/item/reagent_containers/food/snacks/checker/knight/red = 2,
				/obj/item/reagent_containers/food/snacks/checker/bishop/red = 2,
				/obj/item/reagent_containers/food/snacks/checker/rook/red = 2,
				/obj/item/reagent_containers/food/snacks/checker/queen/red = 1,
				/obj/item/reagent_containers/food/snacks/checker/king/red = 1)
