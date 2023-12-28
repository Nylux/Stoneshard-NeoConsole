 function scr_neoconsole_sethp()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _value = round(scr_neoconsole_s2r_nan(argument[0]))

    if (is_nan(_value))
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be a number.")
        return;
    }
    if instance_exists(o_player)
    {
        with (o_player)
        {
            var _maxHP = math_round(((max_hp * Health_Threshold) / 100))
            if (_value > _maxHP)
                _value = _maxHP
            HP = _value
        }
        scr_neoconsole_log("Set player's HP to " + string(_value))
    }
    else
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("o_player doesn't exist.")
        return;
    }
}