public struct RawNode {
    public let header: RawNodeHeader
    public let properties: [RawProperty]
    public let children: [RawNode]

    public func specialize() -> CastNode? {
        switch self.header.identifier {
        /*
        case .root:
            <#code#>
        case .model:
            <#code#>
        case .mesh:
            <#code#>
        case .hair:
            <#code#>
        case .blendShape:
            <#code#>
        case .skeleton:
            <#code#>
        case .bone:
            <#code#>
        case .inverseKinematicsHandle:
            <#code#>
        case .constraint:
            <#code#>
        case .animation:
            <#code#>
        case .curve:
            <#code#>
        case .curveModeOverride:
            <#code#>
        case .notificationTrack:
            <#code#>
        case .material:
            <#code#>
        case .file:
            <#code#>
        case .color:
            <#code#>
        case .instance:
            <#code#>
        */
        case .metadata:
            CastMetadataNode(self).flatMap(CastNode.metadata(_:))
        default:
            nil
        }
    }
}
