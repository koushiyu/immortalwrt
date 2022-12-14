include $(TOPDIR)/rules.mk

PKG_NAME:=umbim
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=$(PROJECT_GIT)/project/umbim.git
PKG_SOURCE_DATE:=2021-08-18
PKG_SOURCE_VERSION:=de5623104baee6e0c13c92f05c15bf4b4145c0b1
PKG_MIRROR_HASH:=2d4a75d2b53c8413521a2fd138895e327bff3f4b4d29a540342b2d2e1e009852
PKG_MAINTAINER:=John Crispin <john@phrozen.org>

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/umbim
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=WWAN
  DEPENDS:=+libubox +kmod-usb-net +kmod-usb-net-cdc-mbim +wwan
  TITLE:=Control utility for mobile broadband modems
endef

define Package/umbim/description
  umbim is a command line tool for controlling mobile broadband modems using
  the MBIM-protocol.
endef

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/include -ffunction-sections -fdata-sections

# Disable GCC 9 warning about pointers to members of a packed struct
GCCV_GE = $(filter $(1),$(shell echo -e "$(1)\n$(GCCV)" | sort -V | head -n1))
TARGET_CFLAGS += $(if $(call GCCV_GE,9),-Wno-address-of-packed-member)

TARGET_LDFLAGS += -Wl,--gc-sections

define Package/umbim/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/umbim $(1)/sbin/
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,umbim))
