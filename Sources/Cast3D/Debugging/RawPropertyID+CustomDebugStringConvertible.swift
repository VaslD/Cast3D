extension RawPropertyID: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .byte: "UInt8"
        case .short: "UInt16"
        case .integer32: "UInt32"
        case .integer64: "UInt64"
        case .float: "Float"
        case .double: "Double"
        case .string: "CChar[]"
        case .vector2: "Float[2]"
        case .vector3: "Float[3]"
        case .vector4: "Float[4]"
        }
    }
}
