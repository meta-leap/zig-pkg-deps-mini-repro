const std = @import("std");

const lib1 = std.build.Pkg{
    .name = "proj1",
    .path = "../proj1/api.zig",
};
const lib2 = std.build.Pkg{
    .name = "proj2",
    .path = "../proj2/api.zig",
    .dependencies = &[_]std.build.Pkg{lib1},
};
const lib3 = std.build.Pkg{
    .name = "proj3",
    .path = "./api.zig",
    .dependencies = &[_]std.build.Pkg{ lib1, lib2 },
};

fn addPackageDepsTo(it: *std.build.LibExeObjStep) void {
    it.addPackage(lib1);
    it.addPackage(lib2);
    it.addPackage(lib3);
}

pub fn build(bld: *std.build.Builder) void {
    const mode = bld.standardReleaseOptions();

    const demo = bld.addTest("tests.zig");
    demo.setBuildMode(mode);
    addPackageDepsTo(demo);
    bld.step("demo", "..........").dependOn(&demo.step);

    const prog = bld.addExecutable("prog3", "proggie/main.zig");
    prog.setBuildMode(mode);
    addPackageDepsTo(prog);
    prog.install();
}
