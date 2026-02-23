public struct CastInstanceNode {
    public let name: String?
    public let referenceFile: UInt64
    public let position: Vector3
    public let rotation: Vector4
    public let scale: Vector3

    public init?(_ node: RawNode) {
        guard node.header.identifier == .instance else { return nil }

        var name: String?
        var referenceFile: UInt64?
        var position: Vector3?
        var rotation: Vector4?
        var scale: Vector3?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "rf":
                referenceFile = property.values.first?.value as? UInt64
            case "p":
                position = property.values.first?.value as? Vector3
            case "r":
                rotation = property.values.first?.value as? Vector4
            case "s":
                scale = property.values.first?.value as? Vector3
            default:
                break
            }
        }

        guard referenceFile != nil, position != nil, rotation != nil, scale != nil else { return nil }
        self.name = name
        self.referenceFile = referenceFile!
        self.position = position!
        self.rotation = rotation!
        self.scale = scale!
    }
}
