 function scr_neoconsole_init()
{
    ds_map_add(commandsMap, "log", "scr_neoconsole_log")
    ds_map_add(commandsMap, "help", "scr_neoconsole_help")
    ds_map_add(commandsMap, "enable", "scr_neoconsole_enable")
    ds_map_add(commandsMap, "clear", "scr_neoconsole_clear")
    ds_map_add(commandsMap, "drop", "scr_neoconsole_drop")
    ds_map_add(commandsMap, "devinfo", "scr_neoconsole_devinfo")
    ds_map_add(commandsMap, "devcam", "scr_neoconsole_devcam")
    ds_map_add(commandsMap, "spawn", "scr_neoconsole_spawn")
    ds_map_add(commandsMap, "debugmap", "scr_neoconsole_debugmap")
    ds_map_add(commandsMap, "room", "scr_neoconsole_room")
    ds_map_add(commandsMap, "buff", "scr_neoconsole_buff")
    ds_map_add(commandsMap, "time_scale", "scr_neoconsole_time_scale")
    ds_map_add(commandsMap, "toggleUI", "scr_neoconsole_UI_visible")
    ds_map_add(commandsMap, "toggleMarker", "scr_neoconsole_minimap")
    ds_map_add(commandsMap, "toggleFog", "scr_neoconsole_fog")
    ds_map_add(commandsMap, "weather", "scr_neoconsole_weather")
    ds_map_add(commandsMap, "enemyinfo", "scr_neoconsole_enemyinfo")
    ds_map_add(commandsMap, "god", "scr_neoconsole_godmode")
    ds_map_add(commandsMap, "nodeath", "scr_neoconsole_nodeathmode")
    ds_map_add(commandsMap, "getxp", "scr_neoconsole_getxp")
    ds_map_add(commandsMap, "sethp", "scr_neoconsole_sethp")
    ds_map_add(commandsMap, "setmp", "scr_neoconsole_setmp")
    ds_map_add(commandsMap, "save", "scr_neoconsole_save")
    ds_map_add(commandsMap, "load", "scr_neoconsole_load")
    ds_map_add(commandsMap, "killboss", "scr_neoconsole_killboss")
    ds_map_add(commandsMap, "butcher", "scr_neoconsole_butcher")
    ds_map_add(commandsMap, "skill", "scr_neoconsole_allskills")
    ds_map_add(commandsMap, "setcondition", "scr_neoconsole_condition")
    ds_map_add(commandsMap, "setpsy", "scr_neoconsole_psy")
    ds_map_add(commandsMap, "setrep", "scr_neoconsole_reputation")
    ds_map_add(commandsMap, "exit", "scr_neoconsole_exit")
    ds_map_add(commandsMap, "inj", "scr_neoconsole_injury")
    ds_map_add(commandsMap, "setatr", "scr_neoconsole_setatr")
    ds_map_add(commandsMap, "setlvl", "scr_neoconsole_lvl")
    ds_map_add(commandsMap, "tp", "scr_neoconsole_tp")
    ds_map_add(commandsMap, "boost", "scr_neoconsole_boost")
    ds_map_add(commandsMap, "globalset", "scr_neoconsole_globalset")
    ds_map_add(commandsMap, "warp", "scr_neoconsole_warp")
    ds_map_add(commandsMap, "getobjname", "scr_neoconsole_getobjectname")
    ds_map_add(commandsMap, "getassetid", "scr_neoconsole_getassetid")
    ds_map_add(commandsMap, "mapstat", "scr_neoconsole_mapstat")
    ds_map_add(commandsMap, "preset", "scr_neoconsole_preset")
    ds_map_add(commandsMap, "dsDebug", "scr_neoconsole_dsDebugger")
    ds_map_add(commandsMap, "npcanim", "scr_neoconsole_npc_animation")
    ds_map_add(commandsMap, "spriteorigin", "scr_neoconsole_spriteorigin")
    ds_map_add(commandsMap, "spl", "scr_neoconsole_sightplacelist")
    ds_map_add(commandsMap, "damage", "scr_neoconsole_damage")
    ds_map_add(commandsMap, "setcaravan", "scr_neoconsole_setcaravan")
    ds_map_add(commandsMap, "overlay", "scr_neoconsole_overlay")
    ds_map_add(commandsMap, "skilltest", "scr_neoconsole_skilltest")
    ds_map_add(commandsMap, "locatetraps", "scr_neoconsole_locate_traps")
    ds_map_add(commandsMap, "actionslog", "scr_neoconsole_actionslog")
    ds_map_add(commandsMap, "time", "scr_neoconsole_time_change")
    ds_map_add(commandsMap, "fadeinfo", "scr_neoconsole_fadeinfo")
    ds_map_add(commandsMap, "questsettarget", "scr_neoconsole_questsettarget")
    ds_map_add(commandsMap, "questnexttarget", "scr_neoconsole_questnexttarget")
    ds_map_add(commandsMap, "consolesize", "scr_neoconsole_consolesize")
    ds_map_add(commandsMap, "find", "scr_neoconsole_find")
    ds_map_add(commandsMap, "getseed", "scr_neoconsole_getseed")
    ds_map_add(commandsMap, "nocd", "scr_neoconsole_nocd")
    ds_map_add(commandsMap, "gold", "scr_neoconsole_gold")
    ds_map_add(commandsMap, "setobjatr", "scr_neoconsole_setobjectatr")


    ds_map_add(helpSyntaxMap, "log", "log [message]")
    ds_map_add(helpSyntaxMap, "help", "help [command]")
    ds_map_add(helpSyntaxMap, "enable", "enable")
    ds_map_add(helpSyntaxMap, "clear", "clear")
    ds_map_add(helpSyntaxMap, "drop", "drop [inv] [id | name | [slot rarity... lvl]] [amount] [condition...] [durability]")
    ds_map_add(helpSyntaxMap, "devinfo", "devinfo")
    ds_map_add(helpSyntaxMap, "devcam", "devcam [speed] [speed_value]")
    ds_map_add(helpSyntaxMap, "spawn", "spawn [enemy] [ai]")
    ds_map_add(helpSyntaxMap, "debugmap", "debugmap")
    ds_map_add(helpSyntaxMap, "room", "room [room_name]")
    ds_map_add(helpSyntaxMap, "buff", "buff [buff_name] [duration] [tier] [target]")
    ds_map_add(helpSyntaxMap, "time_scale", "time_scale [scale]")
    ds_map_add(helpSyntaxMap, "toggleUI", "toggleUI")
    ds_map_add(helpSyntaxMap, "toggleMarker", "toggleMarker")
    ds_map_add(helpSyntaxMap, "toggleFog", "toggleFog")
    ds_map_add(helpSyntaxMap, "weather", "weather [weather_name]")
    ds_map_add(helpSyntaxMap, "enemyinfo", "enemyinfo")
    ds_map_add(helpSyntaxMap, "god", "god")
    ds_map_add(helpSyntaxMap, "nodeath", "nodeath")
    ds_map_add(helpSyntaxMap, "getxp", "getxp [amount]")
    ds_map_add(helpSyntaxMap, "save", "save [save_type]")
    ds_map_add(helpSyntaxMap, "load", "load")
    ds_map_add(helpSyntaxMap, "killboss", "killboss")
    ds_map_add(helpSyntaxMap, "butcher", "butcher")
    ds_map_add(helpSyntaxMap, "skill", "skill [mode]")
    ds_map_add(helpSyntaxMap, "setcondition", "setcondition [condition_name] [amount]")
    ds_map_add(helpSyntaxMap, "setpsy", "setpsy [condition_name] [amount]")
    ds_map_add(helpSyntaxMap, "setrep", "setrep [city_name] [amount]")
    ds_map_add(helpSyntaxMap, "inj", "inj [limb_name] [mode] [amount]")
    ds_map_add(helpSyntaxMap, "setatr", "setatr [attribute_name] [value]")
    ds_map_add(helpSyntaxMap, "setlvl", "setlvl [value]")
    ds_map_add(helpSyntaxMap, "tp", "tp")
    ds_map_add(helpSyntaxMap, "boost", "boost [attribute_name] [amount] [duration]")
    ds_map_add(helpSyntaxMap, "globalset", "globalset [x] [y]")
    ds_map_add(helpSyntaxMap, "warp", "warp [location_name]")
    ds_map_add(helpSyntaxMap, "getobjname", "getobjname [id]")
    ds_map_add(helpSyntaxMap, "getassetid", "getassetid [asset_name]")
    ds_map_add(helpSyntaxMap, "mapstat", "mapstat")
    ds_map_add(helpSyntaxMap, "preset", "preset [preset_name]")
    ds_map_add(helpSyntaxMap, "dsDebug", "dsDebug [mode_name]")
    ds_map_add(helpSyntaxMap, "npcanim", "npcanim")
    ds_map_add(helpSyntaxMap, "spriteorigin", "spriteorigin")
    ds_map_add(helpSyntaxMap, "spl", "spl")
    ds_map_add(helpSyntaxMap, "damage", "damage [type] [amount] [bodypart]")
    ds_map_add(helpSyntaxMap, "setcaravan", "setcaravan [x] [y]")
    ds_map_add(helpSyntaxMap, "overlay", "overlay")
    ds_map_add(helpSyntaxMap, "skilltest", "skilltest")
    ds_map_add(helpSyntaxMap, "locatetraps", "locatetraps")
    ds_map_add(helpSyntaxMap, "actionsLog", "actionsLog")
    ds_map_add(helpSyntaxMap, "time", "time [mode] [scale_value | seconds] [minutes] [hours] [days] [months]")
    ds_map_add(helpSyntaxMap, "fadeinfo", "fadeinfo")
    ds_map_add(helpSyntaxMap, "questsettarget", "questsettarget [quest_key] [quest_target] [value]")
    ds_map_add(helpSyntaxMap, "questnexttarget", "questnexttarget [quest_key]")
    ds_map_add(helpSyntaxMap, "consolesize", "consolesize [size]")
    ds_map_add(helpSyntaxMap, "find", "find [string]")
    ds_map_add(helpSyntaxMap, "getseed", "getseed")
    ds_map_add(helpSyntaxMap, "nocd", "nocd")
    ds_map_add(helpSyntaxMap, "sethp", "sethp [amount]")
    ds_map_add(helpSyntaxMap, "setmp", "setmp [amount]")
    ds_map_add(helpSyntaxMap, "gold", "gold [amount]")
    ds_map_add(helpSyntaxMap, "setobjatr", "setobjatr [object] [attribute_name] [value]")

    ds_map_add(helpUsageMap, "log", ["Arguments :", "    message : The message to log to the console.", "Description :", "Logs given message to the console."])
    ds_map_add(helpUsageMap, "help", ["Arguments :", "    command : Optional. The command you want to know more about", "Description :", "Displays all available command or help about a specific command if one was provided."])
    ds_map_add(helpUsageMap, "enable", ["Description :", "Toggles NeoConsole on or off."])
    ds_map_add(helpUsageMap, "drop", ["See drop.txt"])
    ds_map_add(helpUsageMap, "devinfo", ["Description :", "Toggles the debug overlay on or off."])
    ds_map_add(helpUsageMap, "devcam", ["Arguments :", "    speed :  Optional. If provided, takes the next argument as a value to set new camera speed.", "    speedValue : Required if speed was provided. The new speed for the devcam.", "Description :", "Toggles the devcam, which allows detaching the camera from the player and moving it around with the arrow keys."])
    ds_map_add(helpUsageMap, "spawn", ["Arguments :", "    enemy : The name of the enemy to spawn.", "    ai : Optional. Whether to enable the ai of the spawned enemy or not.", "Description : ", "Spawns specified enemy at the mouse cursor's location."])
    ds_map_add(helpUsageMap, "debugmap", ["Description :", "Creates a global var that is probably used somewhere ? I think ?", "Needs more research."])
    ds_map_add(helpUsageMap, "room", ["Arguments :", "    room_name : The name of the room to tp to.", "Description :", "Teleports the player to the specified room."])
    ds_map_add(helpUsageMap, "buff", ["Arguments :", "    buff_name : Name of the buff to apply. Example : db_bad_trip", "    duration : Optional. The amount of turns / steps the buff will last.", "    tier : Optional. The tier of the buff if applicable.", "target : Optional. Whether or not to apply the buff to the target under your mouse cursor instead of the player.", "Description :", "Applies provided buff to target."])
    ds_map_add(helpUsageMap, "time_scale", ["Arguments :", "    scale : The multiplier for how fast the day/night cycle happens. Default is 1.", "Description :", "Changes how fast or how slow the day/night cycle goes."])
    ds_map_add(helpUsageMap, "toggleUI", ["Description :", "Toggles the UI on or off."])
    ds_map_add(helpUsageMap, "togglerMarker", ["Description :", "Not sure ? Probably something to do with a 'Mark on the map'."])
    ds_map_add(helpUsageMap, "toggleFog", ["Description :", "Toggles fog of war on or off."])
    ds_map_add(helpUsageMap, "weather", ["Arguments :", "    weather_name : The weather to change to. ('rain', 'clear', 'info')", "Description :", "Changes the weather to the provided one."])
    ds_map_add(helpUsageMap, "enemyinfo", ["Description :", "Toggles showing the enemy stats on or off."])
    ds_map_add(helpUsageMap, "godmode", ["Description :", "Toggles god mode on or off."])
    ds_map_add(helpUsageMap, "nodeath", ["Description :", "Toggles the possiblity to die on or off."])
    ds_map_add(helpUsageMap, "getxp", ["Arguments :", "    amount : The amount of xp to add to the player.", "Description :", "Adds xp to the player."])
    ds_map_add(helpUsageMap, "save", ["Arguments :", "    save_type : The type of save to create. ('sleep', 'auto', 'exit')", "Description :", "Creates a save of the provided type."])
    ds_map_add(helpUsageMap, "load", ["Description :", "Loads the latest save if found.", "Doesn't seem to work at the moment."])
    ds_map_add(helpUsageMap, "killboss", ["Description :", "Kills any alive bosse."])
    ds_map_add(helpUsageMap, "butcher", ["Description :", "Kills any alive creature."])
    ds_map_add(helpUsageMap, "skill", ["Arguments :", "    mode : Whether to unlock or reset all skills. ('all', 'reset')", "Description :", "Unlocks or resets all skills for the player."])
    ds_map_add(helpUsageMap, "setcondition", ["Arguments :", "    condition_name : The condition you want to change. ('hunger', 'thirsty', 'intoxication', 'pain', 'morale', 'sanity', 'immunity', 'fatigue', 'sleep_scale')", "    amount : The new value for the condition.", "Description :", "Changes the value for the provided condition."])
    ds_map_add(helpUsageMap, "setpsy", ["Arguments :", "    condition_name : The psychological condition to apply. ('optimism', 'heroism', 'secondwind', 'prudence', 'masochism', 'sadism', 'megalomania', 'frenzy', 'apathy', 'despair', 'anxiety','hypoochondria')", "    amount : The new value for the condition.", "Description :", "Sets psychological conditions to the player.", "Doesn't seem to work at the moment."])
    ds_map_add(helpUsageMap, "setrep", ["Arguments :", "    city_name : The name of the city with which you want to change your reputation. ('osbrook', 'mannshire', 'willow', 'brynn', 'all')", "    amount : The amount of reputation. Can be negative.", "Description :", "Changes reputation with the specified city."])
    ds_map_add(helpUsageMap, "inj", ["Arguments :", "    limb_name : What limb to apply the injury to. ('head', 'tors', 'legs', 'rlegs', 'lhand', 'rhand')", "    amount : Optional. The % of health the limb should have if using inj mode, or the amount of turns the bleed will last if using the mode blood.", "Description :", "Applies bleed or changes health on provided limb."])
    ds_map_add(helpUsageMap, "setatr", ["Arguments :", "    attribute_name : The name of the attribute to modify. ('str', 'agl', 'prc', 'vit', 'will', 'reset')", "    value : The new value for the provided attribute. Not needed with 'reset'.", "Description :", "Sets given attribute to provided value or resets attributes and level."])
    ds_map_add(helpUsageMap, "setlvl", ["Arguments :", "    value : The level to set the player to.", "Description :", "Sets player's level to provided value."])
    ds_map_add(helpUsageMap, "tp", ["Description :", "Toggles the ability to teleport to a place on the journal map by clicking on it, or to the mouse cursor location by pressing F1.", "Doesn't work at the moment, so temporarily replaced with a tp to cursor feature."])
    ds_map_add(helpUsageMap, "boost", ["Arguments :", "    attribute_name : The attribute you want to temporarily buff / debuff.", "    amount : The amount to add to the given attribute.", "    duration : The amount of turns the buff / debuff should last", "Description :", "Adds the provided value to the given attribute temporarily.", "See attributes.txt for a full list."])
    ds_map_add(helpUsageMap, "globalset", ["Arguments :", "    x : The value to add to the player's current X coordinate.", "    y : Optional. The value to add to the player's current Y coordinate.", "Description :", "Adds given value to the player's coordinates."])
    ds_map_add(helpUsageMap, "warp", ["Arguments :", "    location_name : The place to teleport to.", "Description :", "Teleports the player to the given named place.", "See locations.txt for a full list."])
    ds_map_add(helpUsageMap, "getobjname", ["Arguments :", "    id : The id of the object to get the name from.", "Description :", "Checks if instance with given id exists and if it does, logs its name."])
    ds_map_add(helpUsageMap, "getassetid", ["Arguments :", "   asset_name : The name of the asset to get the id from.", "Description :", "Gets the id associated with given object name if it exists."])
    ds_map_add(helpUsageMap, "mapstat", ["Description :", "Lists the amount of each location type generated."])
    ds_map_add(helpUsageMap, "preset", ["Arguments :", "    preset_name : The name of the preset to create.", "Description :", "Creates specified preset."])
    ds_map_add(helpUsageMap, "dsDebug", ["Arguments :", "    mode_name : 'create' or 'destroy'", "Description :", "Saves debugger mode's data.", "Not sure what this really does to be honest."])
    ds_map_add(helpUsageMap, "npcanim", ["Description :", "Toggles NPC animation mode on or off."])
    ds_map_add(helpUsageMap, "spriteorigin", ["Description :", "Toggles the sprite origin editor on or off."])
    ds_map_add(helpUsageMap, "spl", ["Description :", "Toggles the sight placelist editor on or off."])
    ds_map_add(helpUsageMap, "damage", ["Arguments :", "    type : The type of damage to deal. ('slashing', 'rending', 'percing', 'blunt', 'fire', 'frost', 'shock', 'poison', 'arcane', 'sacred', 'unholy', 'psionic')", "    amount : The amount of damage to inflict.", "    bodypart : The bodypart to inflict damage to.", "Description :", "Inflicts specified damage to the player."])
    ds_map_add(helpUsageMap, "setcaravan", ["Arguments :", "    x : The x coordinate for the caravan's new location.", "y : The u coordinate for the caravan's new location.", "Description :", "Moves caravan to given coordinates if possible."])
    ds_map_add(helpUsageMap, "overlay", ["Description :", "Toggles the debug overlay on or off."])
    ds_map_add(helpUsageMap, "skilltest", ["Description :", "Toggles the enemy skill test mode on or off."])
    ds_map_add(helpUsageMap, "locatetraps", ["Description :", "Locates any nearby trap."])
    ds_map_add(helpUsageMap, "actionslog", ["Description :", "Toggles visibility of the actions log on or off."])
    ds_map_add(helpUsageMap, "time", ["Arguments :", "    mode : Whether to 'change' the time, 'get' it or change the world's 'scale'.", "    scale_value : The multiplier for how fast the day/night cycle happens. Default is 1.", "Description :", "Changes or gets the current time or changes the world's time scale."])
    ds_map_add(helpUsageMap, "fadeinfo", ["Description :", "Toggles the visiblity of the fade information on or off."])
    ds_map_add(helpUsageMap, "questsettarget", ["Arguments :", "    quest_key : Quest identifier.", "    quest_target : New target for the quest.", "    value : ????", "Description :", "Changes the target of the given quest."])
    ds_map_add(helpUsageMap, "questnexttarget", ["Arguments :", "    quest_key : Quest identifier.", "Description :", "Makes given quest change target for the next one. (?)"])
    ds_map_add(helpUsageMap, "consolesize", ["Arguments :", "    size : The height in pixels for the NeoConsole", "Description :", "Changes the vertical size of the console to the provided value."])
    ds_map_add(helpUsageMap, "find", ["Arguments :", "    string : The string to find in existing commands.", "Description :", "Finds commands that contain the given string in their name."])
    ds_map_add(helpUsageMap, "getseed", ["Description :", "Prints seed for this world."])
    ds_map_add(helpUsageMap, "nocd", ["Description :", "Toggles the no cooldown mode on or off."])
    ds_map_add(helpUsageMap, "sethp", ["Arguments :", "    amount : The amount of health to set the player to.", "Description :", "Sets player's health to provided value."])
    ds_map_add(helpUsageMap, "setmp", ["Arguments :", "    amount : The amount of mana to set the player to.", "Description :", "Sets player's mana to provided value."])
    ds_map_add(helpUsageMap, "gold", ["Arguments :", "    amount : The amount of gold to add to the player.", "Description :", "Adds specified amount of gold to the player."])
    ds_map_add(helpUsageMap, "setobjatr", ["Arguments :", "    object_id : The id of the object to modify.", "    attribute_name : The name of the attribute to modify.", "    value : The new value for the provided attribute.", "Description :", "Sets an object's given attribute to provided value."])
}