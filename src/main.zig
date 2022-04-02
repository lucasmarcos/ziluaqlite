const std = @import("std");

const sqlite = @cImport({
    @cInclude("sqlite3.h");
});

const lua = @cImport({
    @cInclude("lua.h");
});

pub fn main() void {
    const ver = sqlite.sqlite3_libversion_number();

    std.log.info("{}", .{ver});

    var db: ?*sqlite.struct_sqlite3 = undefined;
    const rc = sqlite.sqlite3_open_v2("db.db", &db, sqlite.SQLITE_OPEN_READWRITE | sqlite.SQLITE_OPEN_CREATE, null);
    defer _ = sqlite.sqlite3_close_v2(db);

    std.log.info("foi assim {}", .{rc});
}
