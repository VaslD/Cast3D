import Foundation

public struct RawPropertyHeader {
    let type: UInt16

    /// The size of the name of this property
    public let nameSize: UInt16

    /// The number of elements this property contains
    public let arrayLength: UInt32

    /// The element type of this property
    public var identifier: RawPropertyID { RawPropertyID(rawValue: self.type)! }

    public init?(_ data: some DataProtocol) {
        guard data.count >= MemoryLayout<RawPropertyHeader>.size else { return nil }
        self = Data(data).withUnsafeBytes {
            $0.load(as: RawPropertyHeader.self)
        }
        guard RawPropertyID.rawCases.contains(self.type) else { return nil }
    }
}
