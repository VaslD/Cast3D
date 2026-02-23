public struct CastMaterialNode {
    public let name: String?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .material else { return nil }

        var name: String?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            default:
                break
            }
        }

        self.name = name
    }
}
