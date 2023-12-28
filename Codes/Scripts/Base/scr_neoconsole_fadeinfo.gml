 function scr_neoconsole_fadeinfo()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (global.fadeInfo)
    {
        global.fadeInfo = 0
        scr_neoconsole_log("Fade information is now OFF.")
    }
    else
    {
        global.fadeInfo = 1
        scr_neoconsole_log("Fade information is now ON.")
    }
}