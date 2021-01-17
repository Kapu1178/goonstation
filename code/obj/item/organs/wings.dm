//FUCK
/obj/item/organ/wings
	name = "wings"
	organ_holder_name = "wings"
	organ_holder_location = "chest" //(back)
	organ_holder_required_op_stage = 12.0 //i've transcended mortality. I comprehend op_stage code. God bless america.
	edible = 1
	organ_image_icon = 'icons/mob/moth.dmi' //FUUUUUUUUUUUUCK
	icon_state = "wings-moth" //FUUUUUUUUUCK
	made_from = "flesh"
	var/wings_num = WINGS_MOTH

	var/image/wings_image_1
	var/image/wings_image_oversuit



	attach_organ(var/mob/living/carbon/M as mob, var/mob/user as mob)
		var/mob/living/carbon/human/H = M
		var/attachment_successful = 0


		if (!H.organHolder.wings && H.organHolder.chest.op_stage == 12.0 && src.can_attach_organ(H, user))
			attachment_successful = 1

			var/fluff = pick("slap", "shove", "place", "press", "jam")

			H.tri_message("<span class='alert'><b>[user]</b> [fluff][fluff == "smoosh" || fluff == "squish" ? "es" : "s"] [src] up against [H == user ? "[his_or_her(H)]" : "[H]'s"] shoulder blades!</span>",\
			user, "<span class='alert'>You [fluff] [src] up against [user == H ? "your" : "[H]'s"] shoulder blades!</span>",\
			H, "<span class='alert'>[H == user ? "You" : "<b>[user]</b>"] [fluff][fluff == "smoosh" || fluff == "squish" ? "es" : "s"] [src] up against your shoulder blades!</span>")

			if (attachment_successful)
				if (user.find_in_hand(src))
					user.u_equip(src)
				H.organHolder.receive_organ(src, "wings", 3.0)
				H.update_body()
				return 1


/obj/item/organ/wings/moth
	name = "moth wings"
	desc = "soft and fluffy wings"
	icon_state = "wings-moth"
	wings_num = WINGS_MOTH
	wings_image_oversuit = "moth_over_suit"
	wings_image_1 = "moth_under_suit"
