 function scr_neoconsole_getxp()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _value = round(scr_neoconsole_s2r_nan(argument[0]))

    if (is_nan(_value) || _value <= 0)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be greater than 0.")
        return;
    }
    if (instance_exists(o_player))
    {
        with (o_player)
            scr_get_XP(_value)
        scr_neoconsole_log("Added " + string(_value) + " xp.")
    }
    else
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("o_player doesn't exist.")
        return;
    }
}