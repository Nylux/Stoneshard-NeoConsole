 function scr_neoconsole_globalset()
{
    if (argument[0] == "" || argument_count > 2)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _terrainWidth = (global.worldWidth - 1)
    var _terrainHeight = (global.worldHeight - 1)
    var _xx = scr_neoconsole_s2r_nan(argument[0])
    var _yy = 0

    if (argument_count >= 2)
        _yy = scr_neoconsole_s2r_nan(argument[1])
    if (is_nan(_xx) || is_nan(_yy))
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("coordinates must be a valid number.")
        return;
    }

    _xx = round(_xx)
    _yy = round(_yy)
    var stairs_enter = asset_get_index(o_church_enter) // WTF ? Why is this here ? It's never used here ...?

    with (o_controller)
        event_user(15)
    if ((global.playerGridX + _xx) > _terrainWidth)
        global.playerGridX = _terrainWidth
    else if ((global.playerGridX + _xx) < 0)
        global.playerGridX = 0
    else
        global.playerGridX += _xx

    if ((global.playerGridY + _yy) > _terrainHeight)
        global.playerGridY = _terrainHeight
    else if ((global.playerGridY + _yy) < 0)
        global.playerGridY = 0
    else
        global.playerGridY += _yy

    global.floor_counter = 0
    scr_smoothRoomChange(scr_globaltile_get_room())
    scr_neoconsole_log("Teleporting player to coordinates X: " + string(global.playerGridX) + ", Y: " + string(global.playerGridY))
}