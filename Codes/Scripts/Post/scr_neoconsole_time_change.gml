 // REQUIRES scr_neoconsole_time_scale().
// Will need rewrite.
// Unreadable mess.

 function scr_neoconsole_time_change()
{
    if (argument[0] == "change")
    {
        if (argument_count < 2 || argument_count > 6)
        {
            scr_neoconsole_log("Invalid number of arguments.")
            return;
        }
        
        var _seconds = abs(scr_neoconsole_s2r_nan(argument[1]))
        var _minutes = 0
        var _hours = 0
        var _days = 0
        var _months = 0

        if (argument_count > 2)
            _minutes = abs(scr_neoconsole_s2r_nan(argument[2]))
        if (argument_count > 3)
            _hours = abs(scr_neoconsole_s2r_nan(argument[3]))
        if (argument_count > 4)
            _days = abs(scr_neoconsole_s2r_nan(argument[4]))
        if (argument_count > 5)
            _months = abs(scr_neoconsole_s2r_nan(argument[5]))

        if (is_nan(_seconds) || is_nan(_minutes) || is_nan(_hours) || is_nan(_days) || is_nan(_months) || _seconds < 0)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("Arguments must be valid numbers greater or equal to 0.")
            return;
        }

        scr_timeUpdate(_seconds, _minutes, _hours, _days, _months)
        scr_neoconsole_log("Changed time to : day " + string(_days) + " of month " + string(_months) + ", at " + string(_hours) + "h" + string(_minutes) + "m" + string(_seconds) + "s.")        
    }
    else if (argument[0] == "scale")
    {
        if (argument_count != 2)
        {
            scr_neoconsole_log("Invalid number of arguments.")
            return;
        }

        scr_neoconsole_time_scale(argument[1])
    }
    else if (argument[0] == "get")
    {
        if (argument_count > 1)
        {
            scr_neoconsole_log("Invalid number of arguments.")
            return;
        }
        
        scr_neoconsole_log("It is currently day " + string(ds_map_find_value(global.timeDataMap, "days")) + 
        " of month " + string(ds_map_find_value(global.timeDataMap, "months")) + " at " + 
        string(ds_map_find_value(global.timeDataMap, "hours")) + "h" + string(ds_map_find_value(global.timeDataMap, "minutes")) + 
        "m" + string(ds_map_find_value(global.timeDataMap, "seconds")) + "s.")
        
    }
    else
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("mode " + argument[0] + " not found.")
        return;
    }
}