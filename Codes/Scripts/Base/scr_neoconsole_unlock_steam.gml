 // Could probably merge this with scr_neoconsole_clear_steam
// Could use a way to fetch achievements automatically.
// Maybe using https://achievementstats.com/index.php?action=api with http request ?

 function scr_neoconsole_unlock_steam()
{
    if (argument[0] == "" || argument_count > 2 )
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    achievementMap = ds_map_create()
    ds_map_add(achievementMap, "steel_for_humans", "Steel for Humans")
    ds_map_add(achievementMap, "axegrinder", "Axegrinder")
    ds_map_add(achievementMap, "razor_sharp_daggers", "Razor Sharp Daggers")
    ds_map_add(achievementMap, "get_maced", "Get Maced")
    ds_map_add(achievementMap, "that's_the_point", "That's the Point")
    ds_map_add(achievementMap, "there_can_be_only_one", "There Can Be Only One")
    ds_map_add(achievementMap, "rest_in_pieces", "Rest in Pieces")
    ds_map_add(achievementMap, "total_warhammer", "Total Warhammer")
    ds_map_add(achievementMap, "duck_and_cover", "Duck and Cover")
    ds_map_add(achievementMap, "arrowheads_arrowheads_arrowheads", "Arrowheads Arrowheads Arrowheads")
    ds_map_add(achievementMap, "long_end_of_the_stick", "Long End of the Stick")
    ds_map_add(achievementMap, "destination:_blood!", "Destination: Blood!")
    ds_map_add(achievementMap, "do_you_even_lift?", "Do You Even Lift?")
    ds_map_add(achievementMap, "sun_tzu_said_that!", "Sun Tzu Said That!")
    ds_map_add(achievementMap, "yeah,_rip", "Yeah, RIP")
    ds_map_add(achievementMap, "don't_feed_the_troll", "Don't Feed the Troll")
    ds_map_add(achievementMap, "this_squalid_hamlet", "This Squalid Hamlet")
    ds_map_add(achievementMap, "in_vino_veritas", "In Vino Veritas")
    ds_map_add(achievementMap, "totally_bear-able", "Totally Bear-able")
    ds_map_add(achievementMap, "don't_lose_your_head", "Don't Lose your Head")
    ds_map_add(achievementMap, "aspiring_mercenary", "Aspiring Mercenary")
    ds_map_add(achievementMap, "dr._phlogiston,_i_presume", "Dr. Phlogiston, I Presume")
    ds_map_add(achievementMap, "i_have_no_arms_and_i_must_kill", "I Have No Arms, and I Must Kill")
    ds_map_add(achievementMap, "a_matter_of_principle", "A Matter of Principle")
    ds_map_add(achievementMap, "city_of_gold", "City of Gold")
    ds_map_add(achievementMap, "leechfeast", "Leechfeast")
    ds_map_add(achievementMap, "watch_me_rise", "Watch Me Rise")
    ds_map_add(achievementMap, "bela_lugosi_is_dead", "Bela Lugosi is Dead")
    ds_map_add(achievementMap, "that's_brutal!", "That's Brutal!")
    ds_map_add(achievementMap, "eternal_hunger", "Eternal Hunger")
    ds_map_add(achievementMap, "comeback!", "Comeback!")
    ds_map_add(achievementMap, "legalise_drugs_and_murder", "Legalise Drugs and Murder")
    ds_map_add(achievementMap, "the_bitter_beginning", "The Bitter Beginning")
    ds_map_add(achievementMap, "what_a_time_to_be_alive", "What a Time to be Alive")
    ds_map_add(achievementMap, "handle_with_care", "Handle with Care")
    ds_map_add(achievementMap, "the_only_thing_they_fear_is_you", "The Only Thing They Fear is You")
    ds_map_add(achievementMap, "shovel_knight", "Shovel Knight")
    ds_map_add(achievementMap, "veteran_hireling", "Veteran Hireling")
    ds_map_add(achievementMap, "reputable_sellsword", "Reputable Sellsword")
    ds_map_add(achievementMap, "weekend_at_the_fire_academy", "Weekend at the Fire Academy")
    ds_map_add(achievementMap, "can't_cheat_the_mountain", "Can't Cheat the Mountain")
    ds_map_add(achievementMap, "outlaw_anthems", "Outlaw Anthems")
    ds_map_add(achievementMap, "the_fittest", "The Fittest")
    ds_map_add(achievementMap, "that_belongs_in_a_museum", "That Belongs In A Museum")
    ds_map_add(achievementMap, "tomb_raider", "Tomb Raider")
    ds_map_add(achievementMap, "trapmaker's_art", "Trapmaker's Art")
    ds_map_add(achievementMap, "i.c.b.m.", "I.C.B.M.")
    ds_map_add(achievementMap, "fetch_this!", "Fetch This!")
    ds_map_add(achievementMap, "master_tracker", "Gotta Skin 'Em All")
    ds_map_add(achievementMap, "ups_and_downs", "Ups and Downs")
    ds_map_add(achievementMap, "theory_&_praxis", "Theory & Praxis")
    ds_map_add(achievementMap, "drink_and_be_merry", "Drink And Be Merry")
    ds_map_add(achievementMap, "right_back_at_you", "Right Back at You")
    ds_map_add(achievementMap, "my_precious", "My Precious")
    ds_map_add(achievementMap, "ride_the_lightning", "Ride The Lightning")
    ds_map_add(achievementMap, "yer_a_wizard", "Yer a Wizard")
    ds_map_add(achievementMap, "some_kind_of_monster", "Some Kind of Monster")
    ds_map_add(achievementMap, "bestial_burden", "Bestial Burden")
    ds_map_add(achievementMap, "enemies_closer", "Enemies Closer")
    
    if (argument[0] == "list")
    {
        var _key = ds_map_find_first(achievementMap)
        while(!is_undefined(_key))
        {
            var value = ds_map_find_value(achievementMap, _key)
            scr_neoconsole_log(value + " : " + _key)
            _key = ds_map_find_next(achievementMap, _key)
        }
    }
    else if (argument[0] == "all")
    {
        var _key = ds_map_find_first(achievementMap)
        var _err = 0
        while(!is_undefined(_key))
        {
            if !steam_get_achievement(_key) 
                steam_set_achievement(_key)
            if !steam_get_achievement(_key)
            {
                scr_neoconsole_log("Couldn't add achievement " + _key)
                _err++
            }
            _key = ds_map_find_next(achievementMap, _key)
        }
        scr_neoconsole_log("Added " + string(ds_map_size(achievementMap) - _err) + " achievements.")
    }
    else if (!is_undefined(ds_map_find_value(achievementMap, argument[0])))
    {
        if !steam_get_achievement(argument[0]) 
            steam_set_achievement(argument[0])
        if !steam_get_achievement(argument[0])
            scr_neoconsole_log("Couldn't add achievement " + argument[0])
    }
    else
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("Achievement " + argument[0] + " not found.")
    }

    ds_map_destroy(achievementMap)
    achievementMap = 0
}