 // REQUIRES scr_neoconsole_getxp() AND scr_neoconsole_setatr()

 function scr_neoconsole_lvl()
{
    if (argument[0] == "" || argument_count != 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _level = scr_neoconsole_s2r_nan(argument[0])
    if (is_nan(_level) || _level < 1 || _level > 30)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("level should be between 1 and 30.")
        return;
    }

    scr_neoconsole_setatr("lvl", string(_level))
}