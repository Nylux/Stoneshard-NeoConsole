 function scr_neoconsole_enemyinfo()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (global.enemyinfo)
    {
        global.enemyinfo = 0
        scr_neoconsole_log("Enemyinfo is now OFF.")
    }
    else
    {
        global.enemyinfo = 1
        scr_neoconsole_log("Enemyinfo is now ON.")
    }
}