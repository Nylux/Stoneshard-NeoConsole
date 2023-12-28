 // Probably needs a rewrite for better clarity.
// Could split it into 2 different functions instead of the weird syntax.
// Also high maintenance as it is, since the random spawning by category is hardcoded.
// It also misses some weapons / armours because of the way it's implemented right now.
// Could try looking up tables directly and making a ds_map here for each category ?

 function scr_neoconsole_drop()
{
    if (argument[0] == "" || (argument[0] != "inv" && argument_count > 4))
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var MAXWEAPONLEVEL = 30
    var _nameId = 0
    var _amount = 1
    var _amountId = 1
    var _condition = 1
    var _conditionId = 2
    var _durability = 100
    var _durabilityId = 3
    var _lvl = MAXWEAPONLEVEL
    var _target = o_player
    var _rarity = 1
    var _dropInstance = noone
    var _isSlot = 0
    var _isInventory = 0

    if (argument[0] == "inv")
    {
        if (argument_count < 2 || argument[1] == "" || argument_count > 5)
        {
            scr_neoconsole_log("Invalid number of arguments.")
            return;
        }

        _target = o_inventory
        _isInventory = 1
        _nameId += 1
        _amountId += 1
        _conditionId += 1
        _durabilityId += 1
    }

    var _name = argument[_nameId]
    switch _name
    {
        case "sword":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 38)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "axe":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 25)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "mace":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 43)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "dagger":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 13)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "gsword":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 17)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "gaxe":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 29)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "gmace":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 23)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "bow":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 15)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "crossbow":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 17)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "staff":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 34)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "spear":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 24)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "head":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 64)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "chest":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 63)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "arms":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 23)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "shield":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 32)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "boots":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 26)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "belt":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 23)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "ring":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 30)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "neck":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 29)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "cloak":
            _isSlot = 1
            _amountId += 2
            _conditionId += 2
            _durabilityId += 2
            var _random = irandom_range(1, 9)
            var _randomStr = _random < 9 ? ("0" + string(_random)) : string(_random)
            _name =  _name + _randomStr
            break
        case "arrows01":  
            _name = "arrows"  
            break  
        case "arrows02":  
            _name = "broadhead_arrows"  
            break  
        case "arrows03":  
            _name = "bodkin_arrows"  
            break  
        case "bolts":  
        case "bolts01":  
            _name = "leafshaped_bolts"  
            break  
        case "bolts02":  
            _name = "broadhead_bolts"  
            break  
        case "bolts03":  
            _name = "bodkin_bolts"  
            break  
        case "scroll01":  
            _name = "scroll_identification"  
            break  
        case "scroll02":  
            _name = "scroll_enchant"  
            break  
        case "scroll03":  
            _name = "scroll_disenchant"  
            break  
    }

    if _isSlot
    {
        if (argument_count > 1)
        {
            _rarity = argument[1]
            switch _rarity
            {
                case "common":
                    _rarity = (1 << 0)
                    break
                case "uncommon":
                    _rarity = (2 << 0)
                    break
                case "rare":
                    _rarity = (3 << 0)
                    break
                case "cursed":
                    _rarity = (5 << 0)
                    break
                case "legendary":
                case "unique":
                    _rarity = (6 << 0)
                    break
                default:
                    _rarity = scr_neoconsole_s2r_nan(argument[1])
                    break
            }

            if (is_nan(_rarity) || _rarity > (7 << 0))
            {
                scr_neoconsole_log("Invalid Arguments Exception for rarity.")
                return;
            }
        }
        if(argument_count > 2)
        {
            _lvl = argument[2]
            switch _lvl
            {
                case "max":
                    _lvl = MAXWEAPONLEVEL
                    break
                default :
                    _lvl = scr_neoconsole_s2r_nan(argument[2])
                    break
            }

            if (is_nan(_lvl) || _lvl < 1)
            {
                scr_neoconsole_log("Invalid Arguments Exception :")
                scr_neoconsole_log("level should be greater than 0.")
                return;
            }
            else if (_lvl > MAXWEAPONLEVEL)
                _lvl = MAXWEAPONLEVEL
        }
    }

    if (argument_count > _amountId)
    {
        _amount = scr_neoconsole_s2r_nan(argument[_amountId])
        if (is_nan(_amount) || _amount < 0)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("amount should be greater than 0.")
            return;
        }
        else if (_name != "gold") // wtf why ?
        {
            if (_amount > 10)
                _amount = 10
        }
        else
            _amount = floor((_amount / 100)) // Again why ??
    }

    if (argument_count > _conditionId)
    {
        _condition = argument[_conditionId]
        switch _condition
        {
            case "common":
                _condition = (1 << 0)
                break
            case "uncommon":
                _condition = (2 << 0)
                break
            case "rare":
                _condition = (3 << 0)
                break
            case "cursed":
                _condition = (5 << 0)
                break
            default :
                _condition = scr_neoconsole_s2r_nan(argument[_conditionId])
                break
        }

        if (is_nan(_condition) || _condition < (1 << 0) || _condition > (5 << 0))
        {
            scr_neoconsole_log("Invalid Arguments Exception for condition.")
            return;
        }
    }

    if (argument_count > _durabilityId)
    {
        _durability = scr_neoconsole_s2r_nan(argument[_durabilityId])
        if (is_nan(_durability) || _durability < 0 || _durability > 100)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("durability should be between 0 and 100.")
            return;
        }
    }

    with (_target)
    {
        repeat _amount
        {
            var _determined_quality = ((!_isSlot) ? _condition : _rarity)
            if _isInventory
            {
                _dropInstance = scr_inventory_add_weapon(string_replace_all(_name, "_", " "), _determined_quality)
                if (!_dropInstance)
                    _dropInstance = scr_inventory_add_weapon(scr_weapon_id_get_name(_name), _determined_quality)
            }
            else
            {
                _dropInstance = scr_weapon_loot(string_replace_all(_name, "_", " "), x, y, 100, _determined_quality)
                if (!_dropInstance)
                    _dropInstance = scr_weapon_loot(scr_weapon_id_get_name(_name, 1), x, y, 100, _determined_quality) 
            }
            if _dropInstance
            {
                with (_dropInstance)
                    ds_map_replace(data, "Duration", ((_durability * scr_inv_atr("MaxDuration")) / 100))
            }
            else if _isInventory
            {
                if asset_get_index(("o_inv_" + string(_name)))
                    _dropInstance = scr_inventory_add_item(asset_get_index(("o_inv_" + string(_name))))
            }
            else
                _dropInstance = scr_loot(asset_get_index(("o_loot_" + string(_name))), x, y, 100)
        }
    }
    
    if _dropInstance
    {
        if _isInventory
            scr_neoconsole_log("Spawned " + string(_name) + " in your inventory.")
        else
            scr_neoconsole_log("Spawned " + string(_name) + " on the ground.")
    }
    else
        scr_neoconsole_log("Item " + string(_name) + " not found.")
}