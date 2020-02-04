const lib1 = @import("proj1");

pub fn isFoo2(comptime T: type) bool {
    return lib1.isFoo1(T) and isFoo1(T);
}

pub fn isFoo1(comptime T: type) bool {
    return T == void or T == type or T == noreturn;
}
