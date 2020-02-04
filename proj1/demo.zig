const std = @import("std");

usingnamespace std.testing;

test "test1" {
    const lib1 = @import("api.zig");
    expect(comptime lib1.isFoo1(void));
    expect(comptime lib1.isFoo1(type));
    expect(comptime lib1.isFoo1(noreturn));
    expect(comptime !lib1.isFoo1(i8));
    expect(comptime !lib1.isFoo1([]u8));
    expect(comptime !lib1.isFoo1(bool));
}
