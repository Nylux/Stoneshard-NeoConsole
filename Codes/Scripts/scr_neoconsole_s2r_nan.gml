 function scr_neoconsole_s2r_nan() 
{  
    var _string = argument[0]  
    var _number = 0  
    if is_real(_string)  
        _number = _string  
    else  
    {  
        var _stringLength = string_length(_string)  
        var _stringNumber = ""  
        var _digits = 0  
        var _minus = 0  
        var _dot = 0  
        for (var _i = 1; _i <= _stringLength; _i++)  
        {  
            var _char = string_char_at(_string, _i)  
            var _charUnicode = ord(_char)  
            if (_charUnicode < 45 || _charUnicode > 57 || _charUnicode == 47)  
                return NaN;  
            if (_charUnicode >= 48 && _charUnicode <= 57)  
            {  
                _stringNumber += _char  
                _digits++  
            }  
            if (_charUnicode == 45)  
            {  
                if ((!_minus) && (!_digits))  
                {  
                    _stringNumber += _char  
                    _minus = 1  
                }  
            }  
            if (_charUnicode == 46)  
            {  
                if ((!_dot) && _digits)  
                {  
                    _stringNumber += _char  
                    _dot = 1  
                }  
            }  
            if _digits  
                _number = real(_stringNumber)  
        }  
    }  
    return _number;  
}