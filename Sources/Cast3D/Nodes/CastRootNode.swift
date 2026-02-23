public struct CastRootNode {
    public let models: [CastModelNode]
    public let animations: [CastAnimationNode]
    public let instances: [CastInstanceNode]
    public let metadata: [CastMetadataNode]

    public init?(_ node: RawNode) {
        guard node.header.identifier == .root else { return nil }

        var models = [CastModelNode]()
        var animations = [CastAnimationNode]()
        var instances = [CastInstanceNode]()
        var metadata = [CastMetadataNode]()

        for child in node.children {
            switch child.header.identifier {
            case .model:
                guard let item = CastModelNode(child) else { return nil }
                models.append(item)
            case .animation:
                guard let item = CastAnimationNode(child) else { return nil }
                animations.append(item)
            case .instance:
                guard let item = CastInstanceNode(child) else { return nil }
                instances.append(item)
            case .metadata:
                guard let item = CastMetadataNode(child) else { return nil }
                metadata.append(item)
            default:
                break
            }
        }

        self.models = models
        self.animations = animations
        self.instances = instances
        self.metadata = metadata
    }
}
