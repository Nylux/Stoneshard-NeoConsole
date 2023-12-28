 function scr_neoconsole_actionslog()
{
    if (argument[0] != "")
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    if (instance_exists(o_actionsLog))
    {
        var _actionsLog = instance_find(o_actionsLog, 0)
        if _actionsLog.isVisible
        {
            _actionsLog.isVisible = 0
            scr_neoconsole_log("ActionsLog is now hidden.")
        }
        else
        {
            _actionsLog.isVisible = 1
            scr_neoconsole_log("ActionsLog is now visible.")
        }
    }
}