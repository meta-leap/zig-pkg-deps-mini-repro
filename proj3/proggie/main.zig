const std = @import("std");

const lib3 = @import("proj3");

pub fn main() void {
    std.debug.warn("Hola Welt {}\n", .{lib3.isFoo3(void)});
}
