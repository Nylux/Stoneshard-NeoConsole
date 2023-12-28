 function scr_neoconsole_getobjectname()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _id = scr_neoconsole_s2r_nan(argument[0])
    if (is_nan(_id) || _id < 0)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("id should be a valid number greater or equal to 0.")
        return;
    }
    if (instance_exists(_id))
        scr_neoconsole_log("Object with id " + argument[0] + " has name " + object_get_name(_id.object_index))
    else
    {
        scr_neoconsole_log("Object with id " + argument[0] + " not found.")
        return;
    }
}