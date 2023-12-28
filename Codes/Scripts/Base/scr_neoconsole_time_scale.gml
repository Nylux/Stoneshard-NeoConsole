 function scr_neoconsole_time_scale()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    else if (string_to_real(argument[0]) < 0)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("scale should be greater than 0.")
    }

    var _scale = string_to_real(argument[0])
    global.timeScale = _scale
    scr_neoconsole_log("Time scale changed to " + string(_scale))
}