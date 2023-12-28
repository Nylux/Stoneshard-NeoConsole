 function scr_neoconsole_help()
{
    if (!ds_exists(helpSyntaxMap, ds_type_map) || !ds_exists(helpUsageMap, ds_type_map))
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("Help wasn't initialized.")
        return;
    }
    if (argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (argument[0] == "")
    {
        var _key = ds_map_find_first(helpSyntaxMap)
        while(!is_undefined(_key))
        {
            scr_neoconsole_log(ds_map_find_value(helpSyntaxMap, _key))
            _key = ds_map_find_next(helpSyntaxMap, _key)
        }
        scr_neoconsole_log("")
    }
    else
    {
        if (!ds_map_exists(helpUsageMap, argument[0]))
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("No help found for command " + argument[0])
            return;
        }

        var _usageArray = ds_map_find_value(helpUsageMap, argument[0])
        scr_neoconsole_log("Syntax :")
        scr_neoconsole_log("    " + ds_map_find_value(helpSyntaxMap, argument[0]))
        for (var _i = 0; _i < array_length(_usageArray); _i++)
            scr_neoconsole_log(_usageArray[_i])
    }
}