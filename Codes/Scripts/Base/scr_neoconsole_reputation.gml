 function scr_neoconsole_reputation()
{
    if (argument_count != 1 && argument_count != 2 || argument[0] == "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _villageKey = string_lower(argument[0])
    var _villageRep = []
    var _amount = 0
    var _count = 1

    if (argument_count > 1)
    {
        _amount = scr_neoconsole_s2r_nan(argument[1])
        if (is_nan(_amount))
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("amount should be a number.")
            return;
        }
    }

    var _osbrookData = scr_glmap_getLocation("Osbrook")
    var _mannshireData = scr_glmap_getLocation("Mannshire")
    var _willowData = scr_glmap_getLocation("RottenWillow")
    var _brynn = scr_glmap_getLocation("Brynn")

    _villageRep[0][0] = "osbrook"
    _villageRep[0][1] = 1
    _villageRep[0][2] = _osbrookData.x
    _villageRep[0][3] = _osbrookData.y
    _villageRep[1][0] = "mannshire"
    _villageRep[1][1] = 2
    _villageRep[1][2] = _mannshireData.x
    _villageRep[1][3] = _mannshireData.y
    _villageRep[2][0] = "willow"
    _villageRep[2][1] = 3
    _villageRep[2][2] = _willowData.x
    _villageRep[2][3] = _willowData.y
    _villageRep[3][0] = "brynn"
    _villageRep[3][1] = 4
    _villageRep[3][2] = _brynn.x
    _villageRep[3][3] = _brynn.y

    switch _villageKey
    {
        case "osbrook":
            var _villageIndex = 0
            _count = 1
            break
        case "mannshire":
            var _villageIndex = 1
            _count = 2
            break
        case "willow":
            var _villageIndex = 2
            _count = 3
            break
        case "brynn":
            var _villageIndex = 3
            _count = 4
            break
        case "all":
            var _villageIndex = 0
            _count = array_length(_villageRep)
            break
        default:
            scr_neoconsole_log("Village " + _villageKey + " not found.")
            return;
    }

    if (_amount != 0)
    {
        for (var _i = _villageIndex; _i < _count; _i++)
        {
            scr_village_reputation_add(_amount, _villageRep[_i][1], _villageRep[_i][2], _villageRep[_i][3])
            scr_neoconsole_log("Reputation with " + _villageRep[_i][0] + " changed by " + string(_amount))
        }
    }

    for (_i = _villageIndex; _i < _count; _i++)
        scr_neoconsole_log("Current reputation with " + _villageRep[_i][0] + " : " + string(scr_globaltile_get("reputation", _villageRep[_i][2], _villageRep[_i][3])))
}