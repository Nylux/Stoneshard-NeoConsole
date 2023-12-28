 function scr_neoconsole_buff()
{
    if (argument[0] == "" || argument_count > 4)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _buffName = argument[0]
    var _steps = 1
    var _tier = 1
    var _target = asset_get_index("o_player")

    if (argument_count > 1)
    {
        _steps = scr_neoconsole_s2r_nan(argument[1])
        if (is_nan(_steps) || _steps < 0)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("turns must be greater than 0.")
            return;
        }
    }
    if (argument_count > 2)
    {
        _tier = scr_neoconsole_s2r_nan(argument[2])
        if (is_nan(_tier) || _tier < 0)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("tier must be greater than 0.")
            return;
        }
    }
    if (argument_count > 3)
    {
        _target = argument[3]
        switch _target
        {
            case "true":
            case 1:
                _target = collision_point(mouse_x, mouse_y, o_unit, 0, 0)
                break
            case "false":
            case 0:
                _target = asset_get_index("o_player")
                break
            default:
                scr_neoconsole_log("Invalid Arguments Exception :")
                scr_neoconsole_log("target must have a boolean value.")
                return;
        }
    }

    var _buff = asset_get_index("o_" + _buffName)
    if (!_target)
        scr_neoconsole_log("target not found.")
    else if _buff
    {
        if scr_effect_create(_buff, _steps, _target)
            scr_neoconsole_log("Buff " + _buffName + " created for " + string(_steps) + " turns on " + object_get_name(_target))
        else
            scr_neoconsole_log("Buff not created.")
    }
    else
        scr_neoconsole_log("Buff " + _buffName + " not found.")
}