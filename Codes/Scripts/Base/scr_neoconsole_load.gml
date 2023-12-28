 // Could maybe improve this with an optional parameter to load only the latest save of a given save type.
// Also doesn't seem to do much or event work ?
// Needs to be checked. Maybe check the Load button from the main menu, see how they do it ?

 function scr_neoconsole_load()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    if scr_slotSaveExists(ds_map_find_value(global.slotsMap, "lastCharacter"), ds_map_find_value(global.slotsMap, "lastSave"))
    {
        global.slotLoaded = 0
        scr_neoconsole_log("Loading Save...")
        with (persistentRoomController)
        {
            gameState = 2
            event_user(0)
        }
    }
    else
        scr_neoconsole_log("Loading failed.")
}