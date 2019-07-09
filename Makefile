# /home/norbert/sqlite3-android/Makefile
#
.DEFAULT_GOAL		:= build
# TARGET ABI := armeabi armeabi-v7a arm64-v8a x86 x86_64 mips mips64 (or all)
TARGET_ABI		:= armeabi
CHECK_NDKPATH		:= $(shell which ndk-build >/dev/null 2>&1 ; echo $$?)

check-ndk-path:
ifneq ($(CHECK_NDKPATH), 0)
	$(error Cannot find ndk-build in $(PATH). Make sure Android NDK directory is included in your $$PATH variable)
endif

build:	check-ndk-path
	@echo "===> Building..."
	@ndk-build NDK_DEBUG=0 APP_ABI="$(TARGET_ABI)"

clean:
	@echo "===> Cleaning up libs & obj directory"
	@rm -rf obj libs
