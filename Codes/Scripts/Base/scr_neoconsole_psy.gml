 // Doesn't seem to work with all conditions for now ?
// The place where those are stored could have changed since 0.8.1.7
// Needs more research.


 function scr_neoconsole_psy()
{
    if (argument[0] == "" || argument_count > 2)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _attributeName = argument[0]
    var _attributeMacro = -1
    var _amount = 0

    if (argument_count > 1)
    {
        _amount = scr_neoconsole_s2r_nan(argument[1])
        if (is_nan(_amount) || _amount < 0)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("amount should be greater than 1.")
            return;
        }
    }

    switch _attributeName
    {
        case "optimism":  
            _attributeMacro = 0  
            break  
        case "heroism":  
            _attributeMacro = 1  
            break  
        case "secondwind":  
            _attributeMacro = 2  
            break  
        case "prudence":  
            _attributeMacro = 3  
            break  
        case "masochism":  
            _attributeMacro = 6  
            break  
        case "sadism":  
            _attributeMacro = 5  
            break  
        case "megalomania":  
            _attributeMacro = 4  
            break  
        case "frenzy":  
            _attributeMacro = 7  
            break  
        case "apathy":  
            _attributeMacro = 8  
            break  
        case "despair":  
            _attributeMacro = 10  
            break  
        case "anxiety":  
            _attributeMacro = 9  
            break  
        case "hypochondria":  
            _attributeMacro = 11  
            break  
        default:  
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("state " + _attributeName + " not found.")
            return;  
    }

    if (_attributeMacro >= 0)
    {
        var _newAmount = (o_player.chance[_attributeMacro] + _amount)
        if (_newAmount > 100)
            _newAmount = 100
        else if (_newAmount < 0)
            _newAmount = 0
        o_player.chance[_attributeMacro] = _newAmount
        o_player.CD[_attributeMacro] = 0
        scr_neoconsole_log("Attribute " + _attributeName + " set to " + string(_newAmount))
    }
    else
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("state " + _attributeName + " not found.")
        return;  
    }
}