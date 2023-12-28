 function scr_neoconsole_UI_visible()
{
    if (argument[0] != "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (global.UI_is_on)
    {
        global.UI_is_on = 0
        scr_neoconsole_log("GUI is now OFF.")
    }
    else
    {
        global.UI_is_on = 1
        scr_neoconsole_log("GUI is now ON.")
    }
}