 // REQUIRES scr_neoconsole_globalset

 function scr_neoconsole_warp()
{
    if (argument[0] == "" || argument_count != 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _foundName = ""
    var _foundX = 0
    var _foundY = 0

    var _size = ds_map_size(global.locationMap)
    var _key = ds_map_find_first(global.locationMap)


    for (var i = 0; i < _size; i++)
    {
        if (argument[0] == ds_map_find_value(global.locationMap, _key).name)
            _foundName = argument[0]
        else
            _key = ds_map_find_next(global.locationMap, _key)
    }

    if (_foundName == "")
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("location " + argument[0] + " not found.")
        return;   
    }
    
    // get coords
    _foundX = scr_glmap_getLocation(_foundName).x
    _foundY = scr_glmap_getLocation(_foundName).y

    if (is_nan(_foundX) || is_nan(_foundY))
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("No coords found for " + argument[0])
        return;
    }

    // calculate coord difference and call globalset for tp
    scr_neoconsole_globalset(_foundX - global.playerGridX, _foundY - global.playerGridY)
}