 function scr_neoconsole_setmp()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _value = round(scr_neoconsole_s2r_nan(argument[0]))

    if (is_nan(_value) || _value<= 1)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be greater than 1.")
        return;
    }
    if instance_exists(o_player)
    {
        with (o_player)
        {
            if (_value > max_mp)
                _value = max_mp
            MP = _value
        }
        scr_neoconsole_log("Set player's MP to " + string(_value))
    }
    else
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("o_player doesn't exist.")
        return;
    }
}