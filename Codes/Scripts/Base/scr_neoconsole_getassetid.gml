 function scr_neoconsole_getassetid()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _id = asset_get_index(argument[0])
    if (_id >= 0)
        scr_neoconsole_log("Object with name " + argument[0] + " has id " + string(_id))
    else
    {
        scr_neoconsole_log("Object with name " + argument[0] + " not found.")
        return;
    }
}