/// \file  scr_integer.gml
/// \brief Handling of integers and intlib.dll

//
// integer macros, this'll make setting stuff up with them way easier
// I've written all of the max/min macros here in hexadecimal (base 16)
//
// the windows calculator (in programmer mode) can very easily convert hex values to standard
// decimal values
//
// do note that it probably won't make these any easier to read :sweat_drop:
//

// 8-bit
#macro INT8_MAX 0x7F
#macro INT8_MIN 0x80
#macro UINT8_MAX 0xFF

// 16-bit
#macro INT16_MAX 0x7FFF
#macro INT16_MIN 0x8000
#macro UINT16_MAX 0xFFFF

// 32-bit
#macro INT32_MAX 0x7FFFFFFF
#macro INT32_MIN 0x80000000
#macro UINT32_MAX 0xFFFFFFFF

// fixed-point rescale, for make_fixedpoint
#macro FIXEDPT_VAL 65536
#macro FIXEDPT_BITS 16

#macro FRACBITS 8
#macro FRACUNIT (1 << FRACBITS)

#macro FIXEDTOFRACSHIFT (FIXEDPT_BITS - FRACBITS)

#macro INTLIB_VERSION "1.0.0"
#macro INTLIB_RUNTEST false

var intlib_initmsg = "[INTLIB v" + INTLIB_VERSION + " by chearii]\nwelcome to intlib! please make sure to read the README for a list of all functions";

function intlib_test()
{
	show_debug_message("[INTLIB TESTS]");

	show_debug_message("comparisons");
	show_debug_message(intlib_compare(1,1));
	show_debug_message(intlib_compare(1,2));
	show_debug_message(intlib_compare(1,0));

	show_debug_message("integer conversions");
	show_debug_message(intlib_make_u8(65538));	// should overflow
	show_debug_message(intlib_make_u16(65538)); // should overflow
	show_debug_message(intlib_make_u32(65538));

	show_debug_message("decimal to fixed-point");
	show_debug_message(intlib_make_fixedpoint(0.5));
}

show_debug_message(intlib_initmsg);
if (INTLIB_RUNTEST)
	intlib_test();
	
//
// signed integer simulations; converts numbers into integers without using external plugins
//
// probably not necessary in the long run (it's outright redundant with intlib) but it'd be best
// to have these arounds in the off chance that either intlib doesn't work out, or for the sake
// of convenience
//

// make_s8
// simulates an 8-bit signed integer
function make_s8(num)
{
	var _num = num & 0xFF;
	return (_num >= (1 << 7) ? (_num - (1<<8)) : _num);	
}

function make_u8(num)
{
	return num & 0xFF;
}

// make_s16
// simulates a 16-bit signed integer
function make_s16(num)
{
	var _num = num & 0xFFFF;
	return (_num >= (1 << 15) ? (_num - (1<<16)) : _num);	
}

// make_u16
// simulates a 16 bit unsigned integer
function make_u16(num)
{
	var _num = num & 0xFFFF;
	return _num;
}

// make_s32
// simulates a 32 bit signed integer
function make_s32(num)
{
	var _num = num & 0xFFFFFFFF;
	return (_num >= (1 << 31) ? (_num - (1<<32)) : _num);	
}

function make_u32(num)
{
	return num & 0xFFFFFFFF;
}

// simulation of the ARM assembly instruction LDRSH (load register signed halfword)
/*
 * Load Register Signed Halfword (register) calculates an address from a base register value
 * and an offset register value, loads a halfword from memory, sign-extends it to form
 * a 32-bit word, and writes it to a register.
 */
function ldrsh(num)
{
    return make_s32(make_s16(num));
}

// mainly done to convert values to 16-bit integers
function roundtrip_shift(num, bits)
{
    var _bits = clamp(bits, 0, 32);
    return (make_u32(num << _bits) >> _bits);
}

function roundtrip_ashift(num, bits)
{
    var _bits = clamp(bits, 0, 32);
    return make_u32(make_s32(num << _bits) / (1 << _bits));
}

function roundtrip_ashift_signed(num, bits)
{
	return make_s32(roundtrip_ashift(num, bits));
}

// arithmetic shift right, preserves the sign of the shifted value
function asr(num, bits)
{
    return make_u32(make_s32(num) / (1 << bits));
}

function asr64(num, bits)
{
    return num / (1 << bits);
}

// make_fixedpoint
// resizes a number to a 32-bit fixed-point integer value
//
// floating-point values can sometimes be fucky with precision, so this might be handy...
//
// FIXEDPT_VAL is usually 65536 (1<<16), so only 16-bit bounds are supported
// (-32768 to 32767)
function make_fixedpoint(num)
{
	return make_s32(num * FIXEDPT_VAL);
}