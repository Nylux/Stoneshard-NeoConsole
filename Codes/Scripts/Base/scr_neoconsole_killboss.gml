 // Could use a rewrite.
// Hardcoded. Maybe there is a way to find a list of bosses somewhere to check for ?
// Repetitive. Could create a list and make this fit in 20 lines.

 function scr_neoconsole_killboss()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _found = 0
    var _count = 0

    if (instance_exists(o_statueofsacrifice))
    {
        _count = instance_number(o_statueofsacrifice)
        with (o_statueofsacrifice)
            HP = 0
        scr_neoconsole_log("Killed " + string(_count) + " o_statueofsacrifice.")
        _found = 1
        _count = 0
    }
    if (instance_exists(o_vampire_archont_beast))
    {
        _count = instance_number(o_vampire_archont_beast)
        with (o_vampire_archont_beast)
            HP = 0
        scr_neoconsole_log("Killed " + string(_count) + " o_vampire_archont_beast.")
        _found = 1
        _count = 0
    }
    if (instance_exists(o_ancientTroll))
    {
        _count = instance_number(o_ancientTroll)
        with (o_ancientTroll)
            HP = 0
        scr_neoconsole_log("Killed " + string(_count) + " o_ancientTroll.")
        _found = 1
        _count = 0
    }
    if (instance_exists(o_manticore))
    {
        _count = instance_number(o_manticore)
        with (o_manticore)
            HP = 0
        scr_neoconsole_log("Killed " + string(_count) + " o_manticore.")
        _found = 1
        _count = 0
    }

    if (_found == 0)
        scr_neoconsole_log("There is no boss to kill.")
}