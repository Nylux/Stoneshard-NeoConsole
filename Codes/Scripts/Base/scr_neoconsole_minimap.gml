 // No idea what the fuck this does ?
// Needs more research

 function scr_neoconsole_minimap()
{
    if argument[0] != ""
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    if global.minimap_is_on
    {
        global.minimap_is_on = 0
        scr_neoconsole_log("Mark on map is now OFF.")
    }
    else
    {
        global.minimap_is_on = 1
        scr_neoconsole_log("Mark on map is now ON.")
    }
}