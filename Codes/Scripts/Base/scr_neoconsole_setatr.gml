 // I think main attributes can't be under 10 ?
// Will need to check and correct if true.
// Could use global.attribute to check if the attribute exists, too.
// scr_neoconsole_boost does this.

 function scr_neoconsole_setatr()
{
    if (argument[0] == "" || argument_count > 2)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _attributeName = argument[0]
    var _amount = 1
    var _duration = 0
    var _valid = 0

    switch _attributeName
    {
        case "str":
        case "strength":
            _attributeName = "STR"
            _valid = 1
            break
        case "agl":
        case "agility":
            _attributeName = "AGL"
            _valid = 1
            break
        case "prc":
        case "perception":
            _attributeName = "PRC"
            _valid = 1
            break
        case "vit":
        case "vitality":
            _attributeName = "Vitality"
            _valid = 1
            break
        case "will":
        case "willpower":
            _attributeName = "WIL"
            _valid = 1
            break
        // case "xp":
        // case "lvl":
        // case "level":
        //     scr_neoconsole_log("Using setatr with 'xp' or 'lvl' can cause issues.")
        //     scr_neoconsole_log("Use 'getxp' instead.")
        //     return;
        case "xp":
            _attributeName = "XP"
            _valid = 1
            break
        case "lvl":
        case "level":
            _attributeName = "LVL"
            _valid = 1
            break
    }

    if (!_valid && _attributeName != "reset")
    {
        scr_neoconsole_log("Attribute " + _attributeName + " not found.")
        return;
    }
    if (_attributeName == "reset")
    {
        scr_atr_set_simple("STR", 10)
        scr_atr_set_simple("AGL", 10)
        scr_atr_set_simple("PRC", 10)
        scr_atr_set_simple("Vitality", 10)
        scr_atr_set_simple("WIL", 10)
        scr_atr_set_simple("LVL", 1)
        scr_atr_set_simple("XP", 0)
        return;
    }
    if (argument_count > 1)
        _amount = scr_neoconsole_s2r_nan(argument[1])
    if (is_nan(_amount) || _amount <= 0)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be greater than 0.")
        return;
    }

    scr_atr_set_simple(_attributeName, _amount)
    scr_neoconsole_log("Attribute " + _attributeName + " set to " + string(_amount))
}