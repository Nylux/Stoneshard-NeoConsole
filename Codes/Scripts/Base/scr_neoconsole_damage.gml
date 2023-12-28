 // EWWW WTF. Will need a rewrite.
// Doesn't check for bodypart's validity and will crash if it doesn't exist.
// Too many variables, some even unused.
// Could use another argument to specify targets other than o_player.

 function scr_neoconsole_damage()
{
    if (argument[0] == "" || argument_count > 3)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    scr_damage_init()
    owner = o_player
    target = o_player

    var _damageType = argument[0]
    var _amount = real(argument[1])
    var _bodyPart = argument[2]

    switch _damageType
    {
        case "slashing":
            Slashing_Damage = _amount
            break
        case "rending":
            Rending_Damage = _amount
            break
        case "piercing":
            Piercing_Damage = _amount
            break
        case "blunt":
            Blunt_Damage = _amount
            break
        case "fire":
            Fire_Damage = _amount
            break
        case "frost":
            Frost_Damage = _amount
            break
        case "shock":
            Shock_Damage = _amount
            break
        case "poison":
            Poison_Damage = _amount
            break
        case "arcane":
            Arcane_Damage = _amount
            break
        case "sacred":
            Sacred_Damage = _amount
            break
        case "unholy":
            Unholy_Damage = _amount
            break
        case "psionic":
            Psionic_Damage = _amount
            break
        default:
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("damage_type" + _damageType + "not found")
            break
    }

    if (argument_count > 1)
        _amount = scr_neoconsole_s2r_nan(argument[1])
    if (is_nan(_amount) || _amount < 0)
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be greater than 0.")
        return;
    }

    var _target = o_player
    is_crit = 0
    Weapon_Damage = 100
    Bodypart_Damage = 100
    targetBodyPart = _bodyPart
    Body_Part_target = targetBodyPart
    var _attackerName = scr_id_get_name(_target)
    var _targetName = scr_id_get_name(_target)
    var _targetBodyPart = scr_actionsLogGetTargetBodyPart(_target)
    var _targetUnit = scr_actionsLogTargetUnit(_target)
    var _attackType = scr_actionsLogGetAttackType(0)
    var _healthType = scr_actionsLogGetHealthType(_target)
    var DMG = scr_skill_damage(target, 0, 0, _bodyPart)
    scr_actionsLog("attack", [_attackerName, _attackType, _targetBodyPart, _targetName, DMG, _healthType])
    scr_neoconsole_log("Inflicted " + string(_amount) + " " + _damageType + " damage to " + _targetName + "'s " + _targetBodyPart + " for " + string(DMG) + " HP.")
}