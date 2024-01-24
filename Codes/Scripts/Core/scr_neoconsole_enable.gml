 function scr_neoconsole_enable()
{
    if (string(object_get_name(self.object_index)) == "o_neoconsole")
    {
        global.neoconsole_enabled = !global.neoconsole_enabled
        //global.consoleEnabled = global.neoconsole_enabled // Dirty hack until we can edit assembly through MSL
    }
    else
        scr_actionsLogUpdate("scr_neoconsole_enable was called from an unexpected object : " + string(object_get_name(self.object_index)) + ".")
}
