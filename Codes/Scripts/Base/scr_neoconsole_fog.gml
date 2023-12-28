 function scr_neoconsole_fog()
{
    if argument[0] != ""
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    if global.fog
    {
        global.fog = 0
        scr_neoconsole_log("Disabled fog.")
    }
    else
    {
        global.fog = 1
        scr_neoconsole_log("Enabled fog.")
    }
    with (o_fogrender)
    {
        var _roomCellsX = (room_width div 26)
        var _roomCellsY = (room_height div 26)
        for (var _i = 0; _i < _roomCellsX; _i++)
        {
            for (var _j = 0; _j < _roomCellsY; _j++)
                tile_set_alpha(ds_grid_get(fogTiles, _i, _j), global.fog)
        }
    }
    with (o_globalmap)
    {
        with (fogPartsContainer)
        {
            for (_i = 0; _i < guiChildrenCount; _i++)
            {
                with (ds_list_find_value(guiChildrenList, _i))
                    event_user(0)
            }
        }
    }
}