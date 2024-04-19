/// \file  scr_integer.gml
/// \brief Handling of integers and intlib.dll

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

// make_s32
// simulates a 32 bit signed integer
function make_s32(num)
{
	var _num = num & 0xFFFFFFFF;
	return (_num >= (1 << 31) ? (_num - (1<<32)) : _num);	
}

show_debug_message(intlib_initmsg);
if (INTLIB_RUNTEST)
	intlib_test();