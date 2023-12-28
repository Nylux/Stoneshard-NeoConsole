 // Needs a rewrite. NOT STANDALONE.
// Relies on a global var provided by the original console.

 function scr_neoconsole_devinfo()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    else if global.is_devinfo
    {
        show_debug_overlay(0)
        global.is_devinfo = 0
        scr_neoconsole_log("Developer Information is now OFF.")
    }
    else
    {
        show_debug_overlay(1)
        global.is_devinfo = 1
        scr_neoconsole_log("Developer Information is now ON.")
    }
}