pub fn isFoo1(comptime T: type) bool {
    return T == void or T == type or T == noreturn;
}
