import Foundation

public struct RawHeader {
    public static let magicNumber: UInt32 = 0x74736163
    public static let supportedVersions: [UInt32] = [0x1]

    /// `"cast"` (`0x74736163`)
    public let magic: UInt32

    /// `0x1`
    public let version: UInt32

    /// Number of root nodes, which contain various sub nodes if necessary.
    public let rootNodes: UInt32

    /// Reserved for flags, or padding, whichever is needed.
    public let flags: UInt32

    public init?(_ data: some DataProtocol) {
        guard data.count >= MemoryLayout<RawHeader>.size else { return nil }
        self = Data(data).withUnsafeBytes {
            $0.load(as: RawHeader.self)
        }
        guard self.magic == RawHeader.magicNumber,
              RawHeader.supportedVersions.contains(self.version) else {
            return nil
        }
    }
}
