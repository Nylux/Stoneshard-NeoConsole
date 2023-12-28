 // Will need to be rewritten.
// High maintenance because of hardcoded enemy spawnlist.
// Should find a way to look up tables and hold data in a ds_map here.
// Could also add args to spawn at passed location instead of at the mouse cursor's.

 function scr_neoconsole_spawn()
{
    if (argument[0] == "" || argument_count > 2)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _ai = 1

    if(argument_count > 1)
    {
        _ai = argument[1]
        switch _ai
        {
            case "true":
            case 1:
                _ai = 1
                break
            case "false":
            case 0:
                _ai = 0
                break
            default:
                scr_neoconsole_log("Invalid Arguments Exception.")
                scr_neoconsole_log("ai must have a boolean value.")
                return;
        }
    }

    var _unitName = argument[0]
    var _unit = -4
    switch _unitName
    {
        case "bandit01":  
            _unitName = "bandit_goon_club"  
            break  
        case "bandit02":  
            _unitName = "bandit_goon_cleaver"  
            break  
        case "bandit03":  
            _unitName = "bandit_thug_club"  
            break  
        case "bandit04":  
            _unitName = "bandit_rioter"  
            break  
        case "bandit05":  
            _unitName = "bandit_trasher"  
            break  
        case "bandit06":  
            _unitName = "bandit_poacher"  
            break  
        case "bandit_boss01":  
            _unitName = "bandit_kingpin"  
            break  
        case "bandit07":  
            _unitName = "bandit_henchman_axe"  
            break  
        case "bandit08":  
            _unitName = "bandit_sidekick_mace"  
            break  
        case "bandit09":  
            _unitName = "bandit_mancatcher"  
            break  
        case "bandit10":  
            _unitName = "bandit_renegade"  
            break  
        case "bandit11":  
            _unitName = "bandit_crook"  
            break  
        case "bandit12":  
            _unitName = "bandit_rogue_mage"  
            break  
        case "bandit13":  
            _unitName = "bandit_outlaw"  
            break  
        case "bandit_boss02":  
            _unitName = "bandit_freak"  
            break  
        case "bandit14":  
            _unitName = "bandit_soldier_sword"  
            break  
        case "bandit15":  
            _unitName = "bandit_soldier_axe"  
            break  
        case "bandit16":  
            _unitName = "bandit_soldier_mace"  
            break  
        case "bandit17":  
            _unitName = "bandit_sergeant_hammer"  
            break  
        case "bandit18":  
            _unitName = "bandit_sergeant_sword"  
            break  
        case "bandit19":  
            _unitName = "bandit_halberdier"  
            break  
        case "bandit20":  
            _unitName = "bandit_cutthroat"  
            break  
        case "bandit21":  
            _unitName = "bandit_arbalester"  
            break  
        case "bandit22":  
            _unitName = "bandit_conjurer"  
            break  
        case "bandit_boss03":  
            _unitName = "bandit_warlock"  
            break  
        case "bandit_boss04":  
            _unitName = "bandit_ringleader_2hsword"  
            break  
        case "bandit_boss05":  
            _unitName = "bandit_ringleader_shield"  
            break  
        case "bandit_dog":  
            _unitName = "bandit_dog01"  
            break  
        case "skeleton01":  
            _unitName = "skeleton_swordsman"  
            break  
        case "skeleton02":  
            _unitName = "skeleton_axeman"  
            break  
        case "skeleton03":  
            _unitName = "skeleton_guard"  
            break  
        case "skeleton04":  
            _unitName = "skeleton_knight"  
            break  
        case "skeleton05":  
            _unitName = "skeleton_ranger"  
            break  
        case "skeleton06":  
            _unitName = "skeleton_mage"  
            break  
        case "skeleton07":  
            _unitName = "skeleton_paladin"  
            break  
        case "ghoul01":  
            _unitName = "ghoul_small"  
            break  
        case "ghoul02":  
            _unitName = "ghoul_medium"  
            break  
        case "ghoul03":  
            _unitName = "ghoul_large"  
            break  
        case "necr_boss01":  
            _unitName = "necromancer_boss"  
            break  
        case "necr_boss02":  
            _unitName = "zombie_summon"  
            break  
        case "zombie":  
            _unitName = "zombie"  
            break  
        case "ez":  
            _unitName = "hedgehog"  
            break  
        case "buzzer01":  
            _unitName = "buzzer"  
            break  
        case "buzzer02":  
            _unitName = "buzzer_hive"  
            break  
        case "spider":  
            _unitName = "spiderling"  
            break  
        case "troll":  
            _unitName = "ancientTroll"  
            break  
        case "vampire01":  
            _unitName = "vampire_guard"  
            break  
        case "prosel01":  
            _unitName = "proselyte_outcast"  
            break  
        case "prosel02":  
            _unitName = "proselyte_tormentor"  
            break  
        case "prosel03":  
            _unitName = "proselyte_adept"  
            break  
        case "prosel04":  
            _unitName = "proselyte_hierarch"  
            break  
        case "prosel05":  
            _unitName = "proselyte_champion"  
            break  
        case "prosel06":  
            _unitName = "proselyte_flagellant"  
            break  
        case "prosel07":  
            _unitName = "proselyte_immolated"  
            break  
        case "prosel08":  
            _unitName = "proselyte_harbinger"  
            break  
        case "blood_golem":  
            _unitName = "blood_golem"  
            break  
        case "prosel_boss01":  
            _unitName = "proselyte_apostate"  
            break  
        case "prosel_boss02":  
            _unitName = "proselyte_matriarch"  
            break  
        case "prosel_boss03":  
            _unitName = "proselyte_abomination"  
            break  
        case "archont01":  
            _unitName = "vampire_archont"  
            break  
        case "archont02":  
            _unitName = "archont_reborn"  
        break  
    }

    _unit = asset_get_index("o_" + _unitName)
    if (!_unit)
    {
        var _unitsArray = global.enemy_balance_csv
        var _unitsArrayHeight = array_height_2d(_unitsArray)
        var _unitNameTable = string_replace_all(_unitName, "_", " ")

        var _i = 0
        while (_i < _unitsArrayHeight)
        {
            if (_unitNameTable == _unitsArray[_i][0])
            {
                _unit = asset_get_index(_unitsArray[_i][1])
                break
            }
            else
            {
                _i++
                continue
            }
        }
    }

    if _unit
    {
        with(scr_enemy_create(mouse_x, mouse_y, _unit, 0))
            ai_is_on = _ai
        scr_neoconsole_log("Unit " + _unitName + " spawned at cursor location.")
    }
    else
        scr_neoconsole_log("Unit " + _unitName + " not found.")
}