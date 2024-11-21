const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    if (args.len == 0 or args.len < 2) {
        std.debug.print("{any}", .{"Informe dois ou mais parâmetros, para dar sequencia no bagulho!"});
    }

    // mainloop
    var i: usize = 1;
    while (i < args.len) : (i += 1) {
        const arg = args[i];
        if (std.mem.eql(u8, arg, "dev")) {
            std.debug.print("Ambiente: {s}\n", .{args[1]});
        } else if (std.mem.eql(u8, arg, "-h") or std.mem.eql(u8, arg, "--help")) {
            const message = showUsage();
            std.debug.print("{s}\n", .{message});
        }
        break;
    }
}

fn showUsage() []const u8 {
    const usage: []const u8 =
        \\ usage: app <env> 
        \\ <env>     ambiente que deseja realizar uma chamada dev
        \\
        \\
        \\ -h --help esse comando fala por si só, né amigo?
    ;

    return usage;
}
