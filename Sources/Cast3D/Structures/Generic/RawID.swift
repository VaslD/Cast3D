public enum RawID: UInt32, CaseIterable {
    case root = 0x746F_6F72
    case model = 0x6C64_6F6D
    case mesh = 0x6873_656D
    case hair = 0x7269_6168
    case blendShape = 0x6873_6C62
    case skeleton = 0x6C65_6B73
    case bone = 0x656E_6F62
    case inverseKinematicsHandle = 0x6468_6B69
    case constraint = 0x7473_6E63
    case animation = 0x6D69_6E61
    case curve = 0x7672_7563
    case curveModeOverride = 0x564F_4D43
    case notificationTrack = 0x6669_746E
    case material = 0x6C74_616D
    case file = 0x656C_6966
    case color = 0x726C_6F63
    case instance = 0x7473_6E69
    case metadata = 0x6174_656D

    static let rawCases: [UInt32] = RawID.allCases.map(\.rawValue)
}
