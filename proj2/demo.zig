const std = @import("std");

usingnamespace std.testing;

test "test2" {
    const lib2 = @import("api.zig");
    expect(comptime lib2.isFoo2(void));
    expect(comptime lib2.isFoo2(type));
    expect(comptime lib2.isFoo2(noreturn));
    expect(comptime !lib2.isFoo2(i8));
    expect(comptime !lib2.isFoo2([]u8));
    expect(comptime !lib2.isFoo2(bool));
}
