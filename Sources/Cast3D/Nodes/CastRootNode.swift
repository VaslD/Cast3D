public struct CastRootNode {
    // public let models: [CastModelNode]
    // public let animations: [CastAnimationNode]
    // public let instances: [CastInstanceNode]
    public let metadata: [CastMetadataNode]

    public init?(_ node: RawNode) {
        guard node.header.identifier == .root else { return nil }

        // var models = [CastModelNode]()
        // var animations = [CastAnimationNode]()
        // var instances = [CastInstanceNode]()
        var metadata = [CastMetadataNode]()

        for child in node.children {
            switch child.header.identifier {
            case .model, .animation, .instance:
                break
            case .metadata:
                guard let item = CastMetadataNode(child) else { return nil }
                metadata.append(item)
            default:
                break
            }
        }

        // self.models = models
        // self.animations = animations
        // self.instances = instances
        self.metadata = metadata
    }
}
