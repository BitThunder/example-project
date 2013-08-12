#include <bitthunder.h>

int main(void) {

	// This is a kernel thread with FULL priviliges.

	// Use the BT_CreateThread() function to create other threads,

	// Use the BT_CreateProcess() function to create a full-blown process.

	// Use the GPIO API:

	BT_GpioSetDirection(0, BT_GPIO_DIR_OUTPUT);	// Set GPIO 0 as output.
	BT_GpioSet(0, BT_TRUE);						// Set GPIO 0 high.

	while(1);

	return 0;
}
