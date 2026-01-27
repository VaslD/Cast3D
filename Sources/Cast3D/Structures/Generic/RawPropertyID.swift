public enum RawPropertyID: UInt16, CaseIterable {
    /// `uint8_t`
    case byte = 0x62 // 'b'
    /// `uint16_t`
    case short = 0x68 // 'h'
    /// `uint32_t`
    case integer32 = 0x69 // 'i'
    /// `uint64_t`
    case integer64 = 0x6C // 'l'
    /// `float`
    case float = 0x66 // 'f'
    /// `double`
    case double = 0x64 // 'd'
    /// Null terminated UTF-8 string
    case string = 0x73 // 's'
    /// Float precision vector: XY
    case vector2 = 0x7632 // 'v2'
    /// Float precision vector: XYZ
    case vector3 = 0x7633 // 'v3'
    /// Float precision vector: XYZW
    case vector4 = 0x7634 // 'v4'

    static let rawCases: [UInt16] = RawPropertyID.allCases.map(\.rawValue)
}
