 function scr_neoconsole_gold() 
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }
    
      var _amount = scr_neoconsole_s2r_nan(argument[0])

    if (is_nan(_amount))
    {
        scr_neoconsole_log("Invalid Arguments Exception :")
        scr_neoconsole_log("amount should be a number.")
        return;
    }

    if (instance_exists(o_player) && !is_nan(_amount))
    {
        with (o_inventory)
        {  
            var bags = _amount / 2000
            var remainder =  _amount % 2000

            if (bags > 1)
            {
                repeat(bags)
                {
                    with (scr_inventory_add_item(asset_get_index("o_inv_moneybag")))
                        ds_map_replace(data, "Stack", 2000)
                }
            }
            
            if (remainder > 100)
            {
                with (scr_inventory_add_item(asset_get_index("o_inv_moneybag")))
                    ds_map_replace(data, "Stack", remainder)    
            }
            else
                scr_inventory_add_item(asset_get_index("o_inv_gold"), id, remainder)
        }
        scr_neoconsole_log("Added " + string(_amount) + " gold to player's inventory.")
    }
    else
    {
        scr_neoconsole_log("Execution Exception :")
        scr_neoconsole_log("o_player doesn't exist.")
        return;
    }
}