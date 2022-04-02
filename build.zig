pub fn build(b: *@import("std").build.Builder) void {
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});
    const exe = b.addExecutable("main", "src/main.zig");

    const sqlitePath = "dep/sqlite-amalgamation-3380200";
    const luaPath = "dep/lua-5.4.4/src";
    const luaSrcFiles = .{
        "lapi.c",
        "lauxlib.c",
        "lbaselib.c",
        "lcode.c",
        "lcorolib.c",
        "lctype.c",
        "ldblib.c",
        "ldebug.c",
        "ldo.c",
        "ldump.c",
        "lfunc.c",
        "lgc.c",
        "linit.c",
        "liolib.c",
        "llex.c",
        "lmathlib.c",
        "lmem.c",
        "loadlib.c",
        "lobject.c",
        "lopcodes.c",
        "loslib.c",
        "lparser.c",
        "lstate.c",
        "lstring.c",
        "lstrlib.c",
        "ltable.c",
        "ltablib.c",
        "ltm.c",
        // "lua.c",
        // "luac.c",
        "lundump.c",
        "lutf8lib.c",
        "lvm.c",
        "lzio.c",
    };
    exe.addIncludeDir(sqlitePath);
    exe.addIncludeDir(luaPath);

    const cflags = [_][]const u8{"-Os"};
    exe.addCSourceFile(sqlitePath ++ "/" ++ "sqlite3.c", &cflags);
    inline for (luaSrcFiles) |file| {
        exe.addCSourceFile(luaPath ++ "/" ++ file, &cflags);
    }

    exe.setBuildMode(mode);
    exe.setTarget(target);
    exe.linkLibC();
    exe.install();
}

// pub fn build(b: *Builder) void {
//
//
// 	const lua_src = [_][]const u8 {
// 		"lapi.c",
// 		"lauxlib.c",
// 		"lbaselib.c",
// 		"lcode.c",
// 		"lcorolib.c",
// 		"lctype.c",
// 		"ldblib.c",
// 		"ldebug.c",
// 		"ldo.c",
// 		"ldump.c",
// 		"lfunc.c",
// 		"lgc.c",
// 		"linit.c",
// 		"liolib.c",
// 		"llex.c",
// 		"lmathlib.c",
// 		"lmem.c",
// 		"loadlib.c",
// 		"lobject.c",
// 		"lopcodes.c",
// 		"loslib.c",
// 		"lparser.c",
// 		"lstate.c",
// 		"lstring.c",
// 		"lstrlib.c",
// 		"ltable.c",
// 		"ltablib.c",
// 		"ltm.c",
// 		"lundump.c",
// 		"lutf8lib.c",
// 		"lvm.c",
// 		"lzio.c"
// 	};
//
// 	const cflags = [_][]const u8 {
// 		"-Ofast",
// 		"-march=native",
// 		"-flto=thin",
// 		"-DLUA_USE_LINUX"
// 	};
//
// 	inline for (lua_src) |file| {
// 		exe.addCSourceFile("lua-5.4.4/src/" ++ file, &cflags);
// 	}
//
// 	exe.install();
// }

