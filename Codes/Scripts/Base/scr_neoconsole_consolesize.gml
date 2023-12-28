 function scr_neoconsole_consolesize()
{
    if (argument[0] = "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _size = scr_neoconsole_s2r_nan(argument[0])

    if (is_nan(_size) || _size <= 0)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("size should be greater than 0.")
        return;
    }

    if (_size < 20)
        _size = 20
    else if (_size > window_get_height())
        _size = window_get_height()

    if (string(object_get_name(self.object_index)) == "o_neoconsole") 
    {
        vsize = _size
        scr_neoconsole_log("Set NeoConsole's size to " + string(_size) + " pixels.")
    }
    else
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("scr_neoconsole_consolesize was called from an unexpected object.")
        return;
    }
}