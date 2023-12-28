 function scr_neoconsole_dsDebugger()
{
    if (argument[0] == "" || argument_count != 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    switch argument[0]
    {
        case "create":
            scr_neoconsole_log("[DS_DEBUGGER] Saving \"create\" data...")
            dsDebuggerPrintEvent(1, "CREATE")
            dsDebuggerPrintEvent(2, "CREATE")
            dsDebuggerPrintEvent(5, "CREATE")
            break
        case "destroy":
            scr_neoconsole_log("[DS_DEBUGGER] Saving \"destroy\" data...")
            dsDebuggerPrintEvent(1, "DESTROY")
            dsDebuggerPrintEvent(2, "DESTROY")
            dsDebuggerPrintEvent(5, "DESTROY")
            break
        default:
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("mode should be 'create' or 'destroy'.")
            break
    }
}