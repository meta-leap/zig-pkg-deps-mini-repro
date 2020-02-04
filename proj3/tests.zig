const std = @import("std");

usingnamespace std.testing;

test "test3" {
    const lib3 = @import("api.zig");
    expect(comptime lib3.isFoo3(void));
    expect(comptime lib3.isFoo3(type));
    expect(comptime lib3.isFoo3(noreturn));
    expect(comptime !lib3.isFoo3(i8));
    expect(comptime !lib3.isFoo3([]u8));
    expect(comptime !lib3.isFoo3(bool));
}
