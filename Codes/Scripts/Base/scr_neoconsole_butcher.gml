 function scr_neoconsole_butcher()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _count = instance_number(o_enemy)
    if (_count > 0)
    {
        with (o_enemy)
            HP = 0
        scr_neoconsole_log("Killed " + string(_count) + " creatures.")
    }
    else
        scr_neoconsole_log("There is no enemy to kill.")

}