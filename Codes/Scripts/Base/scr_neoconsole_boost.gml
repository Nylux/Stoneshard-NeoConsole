 function scr_neoconsole_boost()
{
   if (argument[0] == "" || argument_count > 3)
   {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
   }

    var _attributeName = argument[0]
    var _amount = 0
    var _duration = 1

    if (argument_count > 1)
        _amount = scr_neoconsole_s2r_nan(argument[1])
    if (argument_count > 2)
        _duration = scr_neoconsole_s2r_nan(argument[2])

    if (is_nan(_amount))
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be a valid number.")
        return;
    }
    if (is_nan(_duration) || _duration < 1)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("duration should be greater than 0.")
        return;
    }

    if (!(is_undefined(ds_map_find_value(global.attribute, _attributeName))))
    {
        with (scr_temp_incr_atr(_attributeName, _amount, _duration))
            can_save = 0
        scr_neoconsole_log("Attribute " + _attributeName + " set to " + string(_amount) + " for " + string(_duration) + " turns.")
    }
    else
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("argument " + _attributeName + " not found.")
        return;
    }
}