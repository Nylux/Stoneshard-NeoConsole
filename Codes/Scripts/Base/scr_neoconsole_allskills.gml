 // Resetting all skills = refunding the points but the skills are still available for purchase.
// Should probably add a "lock" argument, to relock all skills except those the character starts with ?

 function scr_neoconsole_allskills()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    switch argument[0]
    {
        case "all":
            scr_tier_all_free()
            scr_neoconsole_log("All skils unlocked.")
            break

        case "reset":
            with (o_skill_category)
            {
                for (var _i = 0; _i < argument_count; _i++)
                {
                    with (skill[_i])
                        is_open = 0
                }
            }
            with (o_skill_fast_panel)
            {
                var _skillsListSize = ds_list_size(skills)
                for (_i = 0; _i < _skillsListSize; _i++)
                {
                    var _skillList = ds_list_find_value(skills, _i)
                    var _skillListSize = ds_list_size(_skillList)
                    for (var _j = 0; _j < _skillListSize; _j++)
                        ds_list_set(_skillList, _j, -4)
                }
            }
            with (o_skill)
            {
                if (object_index != o_skill_attack_mode_shot)
                    instance_destroy()
            }
            scr_atr_set("SP", (scr_atr("LVL") + 1))
            scr_neoconsole_log("All skills have been reset.")
            break

        default:
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("mode " + argument[0] + " not found.")
    }
}