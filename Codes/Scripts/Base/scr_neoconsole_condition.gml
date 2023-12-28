 function scr_neoconsole_condition()
{
    if (argument[0] == "" || argument_count != 2)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _attributeName = argument[0]
    var _amount = scr_neoconsole_s2r_nan(argument[1])

    if (is_nan(_amount) || _amount < 0)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be greater than 0.")
        return;    
    }

    var _valid = 0
    switch _attributeName
    {
        case "Hunger":
        case "hunger":
            _attributeName = "Hunger"
            _valid = 1
            break
        case "Thirsty":
        case "thirsty":
            _attributeName = "Thirsty"
            _valid = 1
            break
        case "Intoxication":
        case "intoxication":
            _attributeName = "Intoxication"
            _valid = 1
            break
        case "Pain":
        case "pain":
            _attributeName = "Pain"
            _valid = 1
            break
        case "Morale":
        case "morale":
            _attributeName = "Morale"
            _valid = 1
            break
        case "Sanity":
        case "sanity":
            _attributeName = "Sanity"
            _valid = 1
            break
        case "Immunity":
        case "immunity":
            _attributeName = "Immunity"
            _valid = 1
            break
        case "Fatigue":
        case "fatigue":
            _attributeName = "Fatigue"
            _valid = 1
            break
        case "Sleep_Scale":
        case "sleep_scale":
            _attributeName = "Sleep_Scale"
            _valid = 1
            break
        
    }

    if (_valid)
    {
        if (_amount > 100)
            _amount = 100
        else if (_amount < 0)
            _amount = 0
        scr_atr_set(_attributeName, _amount)
        scr_neoconsole_log("Condition " + _attributeName + " set to " + string(_amount))
    }
    else
    {
        scr_neoconsole_log("Condition " + _attributeName + " not found.")
        return;
    }
}