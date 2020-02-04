const lib2 = @import("proj2");

pub fn isFoo3(comptime T: type) bool {
    return lib2.isFoo2(T) and isFoo1(T);
}

pub fn isFoo1(comptime T: type) bool {
    return T == void or T == type or T == noreturn;
}
