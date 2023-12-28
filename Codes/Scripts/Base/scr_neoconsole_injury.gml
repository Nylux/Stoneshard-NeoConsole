 // Holy shit this code is bad.
// ABSOLUTELY needs a rewrite ASAP.
// A lot of repeat code. Barely readable.
// inj mode does not work. Check scr_injuryChange()
// RELIES ON SCR_NEOCONSOLE_BUFF. Maybe make buff install first ?

 function scr_neoconsole_injury()
{
    if (argument_count < 2 || argument_count > 3)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _limb = argument[0]
    var _inj = argument[1]
    var _amount = 1

    switch _limb
    {
        case "rleg":
            _limb = "rlegs"
            break
        case "lleg":
            _limb = "legs"
            break
        case "torso":
            _limb = "tors"
            break
    }

    if (_limb == 0 || _limb == "" || (_limb != "head" && _limb != "tors" && _limb != "legs" && _limb != "rlegs" && _limb != "lhand" && _limb != "rhand"))
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("limb " + _limb + " not found.")
        return;
    }

    if (_inj != "blood" && _inj != "inj")
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("mode " + _inj + " not found.")
        return;
    }

    if (argument_count > 2)
    {
        _amount = scr_neoconsole_s2r_nan(argument[2])
        if (_inj == "inj")
        {
            if (is_nan(_amount))
            {
                scr_neoconsole_log("Invalid Arguments Exception :")
                scr_neoconsole_log("amount should be a number.")
                return; 
            }
        }
        else if (is_nan(_amount) || _amount < 0)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("amount should be a number greater than 0.")
            return; 
        }
    }

    if (!instance_exists(o_player))
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("Player instance not found.")
        return; 
    }
    if (_inj == "inj")
    {
        var _existsBodyPart = ds_map_find_value(o_player.Body_Parts_map, _limb)
        if (!is_undefined(_existsBodyPart))
        {
            scr_injuryChange(o_player, _limb, _amount)
            scr_neoconsole_log("Bodypart " + _limb + " set to " + string(ds_map_find_value(o_player.Body_Parts_map, _limb)) + "%")
        }
        else
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("limb " + _limb + " not found.")
            return; 
        }
    }
    else
    {
        var _buff = ""
        switch _limb
        {
            case "head":
                _buff = "db_bleed_head"
                break
            case "tors":
                _buff = "db_bleed_tors"
                break
            case "legs":
                _buff = "db_bleed_legs"
                break
            case "rlegs":
                _buff = "db_bleed_rlegs"
                break
            case "lhand":
                _buff = "db_bleed_lhand"
                break
            case "rhand":
                _buff = "db_bleed_rhand"
                break
            default:
                scr_neoconsole_log("limb " + _limb + " not found.")
                return;
        }
        scr_neoconsole_buff(_buff, _amount)
    }
}