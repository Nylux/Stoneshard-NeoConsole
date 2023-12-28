 function scr_neoconsole_save()
{
    if (argument[0] == "" || argument_count > 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _saveType = scr_stringTransform(argument[0]) // Not sure what this does exactly ? Formats the string somehow...
    var _saveTypeName = "N/A"
    var _saveTypeEvent = -4

    switch _saveType
    {
        case "0":
        case "sleep":
            _saveTypeName = "Sleep"
            _saveTypeEvent = 5
            break
        case "1":
        case "auto":
            _saveTypeName = "Auto"
            _saveTypeEvent = 6
            break
        case "2":
        case "exit":
            _saveTypeName = "Exit"
            _saveTypeEvent = 7
            break
        default:
            scr_neoconsole_log("Save type " + _saveType + " not found.")
            break
    }

    if (_saveTypeEvent != -4)
    {
        var _smoothChanger = scr_smoothRoomChange(-4, [4, _saveTypeEvent], -1, 0)
        if (_smoothChanger != -4)
        {
            scr_slotSaveTitleKeyPrepare()
            scr_slotSaveScreenshotPrepare()
            scr_neoconsole_log(_saveTypeName + " - Saving...")
        }
        else
            scr_neoconsole_log("Saving already in progress !")
    }
}