import Foundation

public struct RawNodeHeader {
    let type: UInt32

    /// Size of all data and sub data following the node
    public let nodeSize: UInt32

    /// Unique hash, like an id, used to link nodes together
    public let nodeHash: UInt64

    /// The count of properties
    public let propertyCount: UInt32

    /// The count of direct children nodes
    public let childCount: UInt32

    /// Used to signify which class this node uses
    public var identifier: RawID { RawID(rawValue: self.type)! }

    public init?(_ data: some DataProtocol) {
        guard data.count >= MemoryLayout<RawNodeHeader>.size else { return nil }
        self = Data(data).withUnsafeBytes {
            $0.load(as: RawNodeHeader.self)
        }
        guard RawID.rawCases.contains(self.type) else { return nil }
    }
}
