 function scr_neoconsole_setcaravan()
{
    if (argument[0] == "" || argument_count != 2)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    var _x = real(argument[0])
    var _y = real(argument[1])

    if (scr_glmap_setCaravanCoord(_x, _y))
    {
        scr_neoconsole_log("Set caravan to coords : " + string(_x) + ":" + string(_y))
        return;
    }
    else
    {
        scr_neoconsole_log("Can't set caravan to coords " + string(_x) + ":" + string(_y))
        return;
    }
}