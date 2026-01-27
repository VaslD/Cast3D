public struct CastMetadataNode {
    public let author: String?
    public let software: String?
    public let upAxis: String?
    public let sceneRoot: String?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .metadata else { return nil }

        var author: String?
        var software: String?
        var upAxis: String?
        var sceneRoot: String?

        for property in node.properties {
            switch property.name {
            case "a":
                author = property.values.first?.value as? String
            case "s":
                software = property.values.first?.value as? String
            case "up":
                upAxis = property.values.first?.value as? String
            case "sr":
                sceneRoot = property.values.first?.value as? String
            default:
                break
            }
        }

        self.author = author
        self.software = software
        self.upAxis = upAxis
        self.sceneRoot = sceneRoot
    }
}
