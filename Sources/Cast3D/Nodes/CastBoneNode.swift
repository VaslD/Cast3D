public struct CastBoneNode {
    public let name: String
    public let parentIndex: UInt32?
    public let segmentScaleCompensate: Bool
    public let localPosition: Vector3?
    public let localRotation: Vector4?
    public let worldPosition: Vector3?
    public let worldRotation: Vector4?
    public let scale: Vector3?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .bone else { return nil }

        var name: String?
        var parentIndex: UInt32?
        var segmentScaleCompensate: Bool = true
        var localPosition: Vector3?
        var localRotation: Vector4?
        var worldPosition: Vector3?
        var worldRotation: Vector4?
        var scale: Vector3?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "p":
                parentIndex = property.values.first?.value as? UInt32
            case "ssc":
                guard let bool = property.values.first?.value as? UInt8, [0, 1].contains(bool) else { return nil }
                segmentScaleCompensate = bool == 0 ? false : true
            case "lp":
                localPosition = property.values.first?.value as? Vector3
            case "lr":
                localRotation = property.values.first?.value as? Vector4
            case "wp":
                worldPosition = property.values.first?.value as? Vector3
            case "wr":
                worldRotation = property.values.first?.value as? Vector4
            case "s":
                scale = property.values.first?.value as? Vector3
            default:
                return nil
            }
        }

        guard name != nil else { return nil }
        self.name = name!
        self.parentIndex = parentIndex
        self.segmentScaleCompensate = segmentScaleCompensate
        self.localPosition = localPosition
        self.localRotation = localRotation
        self.worldPosition = worldPosition
        self.worldRotation = worldRotation
        self.scale = scale
    }
}
