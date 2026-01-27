import Foundation
import Testing
@testable import Cast3D

@Test(arguments: Bundle.module.urls(forResourcesWithExtension: "cast", subdirectory: "Casts")!)
func readCast(_ path: URL) async throws {
    let reader = try CastReader(path)
    let header = try reader.readRawHeader()
    let roots = try reader.readRawRootNodes(header: header)
    for node in roots {
        debugPrint(node)
        let typed = CastRootNode(node)
        try #require(typed != nil)
        debugPrint(typed!)
    }
}
