extension RawID: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .root: "Root"
        case .model: "Model"
        case .mesh: "Mesh"
        case .hair: "Hair"
        case .blendShape: "BlendShape"
        case .skeleton: "Skeleton"
        case .bone: "Bone"
        case .inverseKinematicsHandle: "IKHandle"
        case .constraint: "Constraint"
        case .animation: "Animation"
        case .curve: "Curve"
        case .curveModeOverride: "CurveModeOverride"
        case .notificationTrack: "NotificationTrack"
        case .material: "Material"
        case .file: "File"
        case .color: "Color"
        case .instance: "Instance"
        case .metadata: "Metadata"
        }
    }
}
