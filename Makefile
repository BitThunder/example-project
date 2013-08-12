#
#	Example Makefile for a BitThunder Project.
#

# Get a clean make.
MAKEFLAGS += --no-print-directory

# Set the APP_DIR path (i.e. the current directory).
APP_DIR="$(shell pwd)/"

# Ensure a .config file has been created and copied to the bitthunder root.
# APP_DIR is passed to the sub-make, and APP_CONFIG is set (allowing use of application config).
all: .config
	@cp .config bitthunder/.config
	@$(MAKE) -C bitthunder APP_DIR=$(APP_DIR) APP_CONFIG=y

# Proxy command to invoke the menuconfig correctly etc.
# APP_BSP_CONFIG allows a separate BSP Kconfig to be used, and APP_BSP_DIR is the path to it.
menuconfig:
	-@cp -f .config bitthunder/.config
	@$(MAKE) -C bitthunder APP_DIR=$(APP_DIR) APP_CONFIG=y menuconfig APP_BSP_CONFIG=y APP_BSP_DIR=../bsp
	@cp bitthunder/.config .config

# Call make with menuconfig to produce a valid configuration file.
.config:
	@$(MAKE) menuconfig APP_DIR=$(APP_DIR)

# Proxy command for cleaning.
clean:
	@$(MAKE) -C bitthunder APP_DIR=$(APP_DIR) APP_CONFIG=y clean
