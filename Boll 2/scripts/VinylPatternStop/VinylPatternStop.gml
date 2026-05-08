// Feather disable all

/// Immediately stops playback of a voice.
/// 
/// @param voice

function VinylPatternStop(_pattern)
{
	static _patternDict = __VinylSystem().__patternDict;
    
    if (is_handle(_pattern))
    {
        audio_stop_sound(_pattern);
    }
    else if (is_string(_pattern))
    {
        var _patternStruct = _patternDict[$ _pattern];
        if (_patternStruct != undefined)
        {
            _patternStruct.__Stop();
        }
        else
        {
            __VinylError("Pattern \"", _pattern, "\" not found");
        }
    }
    else
    {
        __VinylError("Datatype not supported (", typeof(_pattern), ")");
    }
}