#!/bin/sh
zig fmt ./build.zig ./src/main.zig \
	&& \
zig build -Dtarget=native-native-musl -Drelease-small
