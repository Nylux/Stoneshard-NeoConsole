 // Broken at the moment ? doesn't toggle off properly.
// See gml_GlobalScript_show_debug_overlay_REBIND

 function scr_neoconsole_overlay()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (get_debug_overlay())
    {
        show_debug_overlay(0)
        scr_neoconsole_log("Debug overlay disabled.")
    }
    else
    {
        show_debug_overlay(1)
        scr_neoconsole_log("Debug overlay enabled.")
    }
}