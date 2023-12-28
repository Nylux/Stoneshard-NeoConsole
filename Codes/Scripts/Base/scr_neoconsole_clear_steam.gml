 // Could probably merge this with scr_neoconsole_unlock_steam

 function scr_neoconsole_clear_steam()
{
    steam_reset_all_stats_achievements()
    scr_neoconsole_log("All Steam achievements have been reset.")
}