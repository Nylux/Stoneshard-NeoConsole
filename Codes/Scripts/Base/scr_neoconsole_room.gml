 // Could probably use a way to easily teleport to useful rooms.

 function scr_neoconsole_room()
{
     if (argument[0] == "" || argument_count != 1)
    {
        scr_neoconsole_log("Invalid number of arguments.")
        return;
    }

    var _roomName = argument[0]
    var _roomId = asset_get_index("r_" + _roomName)
    if (room_exists(_roomId))
    {
        scr_neoconsole_log("Teleporting to " + string(_roomName))
        scr_smoothRoomChange(_roomId, [4], -1, -1)
        global.position_tag = ("r_" + _roomName)
    }
    else
        scr_neoconsole_log("Room " + _roomName + " not found.")
}