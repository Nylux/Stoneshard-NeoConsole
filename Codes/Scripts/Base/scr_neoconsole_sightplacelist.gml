 function scr_neoconsole_sightplacelist()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (global.sightPlacelistEditor)
    {
        if (!global.fog)
            scr_neoconsole_fog("")
        if (!global.UI_is_on)
            scr_neoconsole_UI_visible("")
        global.sightPlacelistEditor = 0
        instance_destroy(o_sightPlacelistEditor)
        scr_neoconsole_log("Sight placelist editor is now OFF.")
    }
    else
    {
        if (global.fog)
            scr_neoconsole_fog("")
        if (global.UI_is_on)
            scr_neoconsole_UI_visible("")
        global.sightPlacelistEditor = 1
        instance_create_depth(-50, -50, 0, o_sightPlacelistEditor)
        scr_neoconsole_log("Sight placelist editor is now ON.")
    }
}