#define func extern "C"

typedef long long int sint64_t;
typedef unsigned long long int uint64_t;

// INTLIB: gamemaker numbers drive me NUTS

//
// integer comparision since gamemaker can be too finicky for my liking
// 0: a is less than b
// 1: a equals b
// 2: a is greater than b
//
func double compare_int(double a, double b)
{
	unsigned int a_integer = (unsigned int)a;

	unsigned int b_integer = (unsigned int)b;

	double result = 0;

	result = ((a_integer == b_integer) ? 1 : ((a_integer > b_integer) ? 2 : 0));

	return result;
}

func double compare_int_signed(double a, double b)
{
	int a_integer = (int)a;

	int b_integer = (int)b;

	double result = 0;

	result = ((a_integer == b_integer) ? 1 : ((a_integer > b_integer) ? 2 : 0));

	return result;
}

// converts doubles to signed chars
func double sint8_convert(double x)
{
	return (double)((char)x);
}

// unsigned version
func double uint8_convert(double x)
{
	return (double)((unsigned char)x);
}

// stores a uint8 to a buffer
func double uint8_convert_store(double x, char* valbuf)
{
	*valbuf = ((unsigned long long int)(unsigned char)x);

	return (double)((unsigned char)x);


}

// converts doubles to signed shorts
func double sint16_convert(double x)
{
	return (double)((short)x);
}

func double uint16_convert(double x)
{
	return (double)((unsigned short)x);
}

// int32 versions
func double sint32_convert(double x)
{
	return (double)((int)x);
}

func double uint32_convert(double x)
{
	return (double)((unsigned int)x);
}

// int64 versions
func double sint64_convert(double x)
{
	return static_cast<double>(static_cast<sint64_t>(x));
}

func double uint64_convert(double x)
{
	return static_cast<double>(static_cast<uint64_t>(x));
}

// converts doubles to fixed-point precision ints
func double double_to_fixed(double x)
{
	int fixed_convert;

	fixed_convert = (int)(x * 65536);

	return (double)fixed_convert;
}

func double double_to_ufixed(double x)
{
	unsigned int fixed_convert;

	fixed_convert = (unsigned int)(x * 65536);

	return (double)fixed_convert;
}