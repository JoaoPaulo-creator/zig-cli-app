const std = @import("std");
const http = std.http;

const serviceUri = "https://economia.awesomeapi.com.br/json/last/USD-BRL";

pub fn get(url: []const u8) ![]8 {
    _ = url; // autofix
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(gpa.deinit() == .ok);
    const allocator = gpa.allocator();

    const client = http.Client{ .allocator = allocator };
    defer client.deinit();

    const uri = std.Uri.parse(serviceUri) catch unreachable;

    _ = uri; // autofix
    var headers = http.Header{ .allocator = allocator };
    defer headers.deinit();

    try headers.append("accept", "*/*");
}
