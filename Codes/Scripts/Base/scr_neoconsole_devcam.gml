 // Needs a rewrite. NOT STANDALONE.
// Relies on 2 global vars provided by the original console.

 function scr_neoconsole_devcam()
{
    if (argument[0] == "")
    {
        if global.devCamera
        {
            global.devCamera = 0
            global.devCameraSpeed = 2
            scr_neoconsole_log("Devcam is now OFF.")
        }
        else
        {
            global.devCamera = 1
            scr_neoconsole_log("Devcam is now ON. (speed " + string(global.devCameraSpeed) + ")")
        }
    }

    else if (argument[0] == "speed")
    {
        var _speed = 0
        if (argument_count >= 2)
            _speed = string_to_real(argument[1])
        if (_speed <= 0)
        {
            scr_neoconsole_log("Invalid Arguments Exception :")
            scr_neoconsole_log("Devcam speed cannot be null or negative.")
        }
        else
        {
            global.devCameraSpeed = _speed
            scr_neoconsole_log("Devcam speed updated to " + string(global.devCameraSpeed))
        }
    }

    else
    {
        scr_neoconsole_log("Invalid Arguments Exception.")
        scr_neoconsole_log("See 'help devcam' for usage.")
    }
}