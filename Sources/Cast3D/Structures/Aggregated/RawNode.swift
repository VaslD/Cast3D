public struct RawNode {
    public let header: RawNodeHeader
    public let properties: [RawProperty]
    public let children: [RawNode]

    public func specialize() -> CastNode? {
        switch self.header.identifier {
        case .root:
            CastRootNode(self).flatMap(CastNode.root(_:))
        case .model:
            CastModelNode(self).flatMap(CastNode.model(_:))
        case .mesh:
            CastMeshNode(self).flatMap(CastNode.mesh(_:))
        case .hair:
            CastHairNode(self).flatMap(CastNode.hair(_:))
        case .blendShape:
            CastBlendShapeNode(self).flatMap(CastNode.blendShape(_:))
        case .skeleton:
            CastSkeletonNode(self).flatMap(CastNode.skeleton(_:))
        case .bone:
            CastBoneNode(self).flatMap(CastNode.bone(_:))
        case .inverseKinematicsHandle:
            CastIKHandleNode(self).flatMap(CastNode.inverseKinematicsHandle(_:))
        case .constraint:
            CastConstraintNode(self).flatMap(CastNode.constraint(_:))
        case .animation:
            CastAnimationNode(self).flatMap(CastNode.animation(_:))
        case .curve:
            CastCurveNode(self).flatMap(CastNode.curve(_:))
        case .curveModeOverride:
            CastCurveModeOverrideNode(self).flatMap(CastNode.curveModeOverride(_:))
        case .notificationTrack:
            CastNotificationTrackNode(self).flatMap(CastNode.notificationTrack(_:))
        case .material:
            CastMaterialNode(self).flatMap(CastNode.material(_:))
        case .file:
            CastFileNode(self).flatMap(CastNode.file(_:))
        case .color:
            CastColorNode(self).flatMap(CastNode.color(_:))
        case .instance:
            CastInstanceNode(self).flatMap(CastNode.instance(_:))
        case .metadata:
            CastMetadataNode(self).flatMap(CastNode.metadata(_:))
        }
    }
}
