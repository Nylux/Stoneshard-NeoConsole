 function scr_neoconsole_find()
{
    if (argument[0] == "" || argument_count != 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _found = 0
    var _key = ds_map_find_first(commandsMap)
    while (!is_undefined(_key))
    {
        if (string_pos(argument[0], _key) > 0)
        {
            scr_neoconsole_log(_key)
            _found++
        }
        _key = ds_map_find_next(commandsMap, _key)
    }
    scr_neoconsole_log("Found " + string(_found) + " command(s) with '" + argument[0] + "'.")
}