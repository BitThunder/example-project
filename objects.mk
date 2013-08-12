#
#	Add application objects to be build to the objs variable.
#	You may also use objs-y also and therfore config based objects:
#
#	e.g. objs-$(BT_CONFIG_MY_CONFIG_VARIABLE) += $(APP)object.o
#

objs += $(APP)example.o

#include $(APP_DIR)common/objects.mk

$(objs): MODULE_NAME="Example"
$(objs): CFLAGS += -I $(APP_DIR)include
