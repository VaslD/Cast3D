public struct CastColorNode {
    public let name: String?
    public let value: Vector4?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .color else { return nil }

        var name: String?
        var value: Vector4?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "v":
                value = property.values.first?.value as? Vector4
            default:
                break
            }
        }

        self.name = name
        self.value = value
    }
}
