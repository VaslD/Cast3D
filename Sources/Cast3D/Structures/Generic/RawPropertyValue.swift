public enum RawPropertyValue {
    case byte(UInt8)
    case short(UInt16)
    case integer32(UInt32)
    case integer64(UInt64)
    case float(Float)
    case double(Double)
    case string(String)
    case vector2(Vector2)
    case vector3(Vector3)
    case vector4(Vector4)

    public var value: Any {
        switch self {
        case let .byte(byte):
            return byte
        case let .short(short):
            return short
        case let .integer32(integer32):
            return integer32
        case let .integer64(integer64):
            return integer64
        case let .float(float):
            return float
        case let .double(double):
            return double
        case let .string(string):
            return string
        case let .vector2(vector2):
            return vector2
        case let .vector3(vector3):
            return vector3
        case let .vector4(vector4):
            return vector4
        }
    }
}
