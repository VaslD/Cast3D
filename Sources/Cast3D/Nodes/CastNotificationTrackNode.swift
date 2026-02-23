public struct CastNotificationTrackNode {
    public let name: String
    public let keyframeBuffer: [RawPropertyValue]

    public init?(_ node: RawNode) {
        guard node.header.identifier == .notificationTrack else { return nil }

        var name: String?
        var keyframeBuffer = [RawPropertyValue]()

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "kb":
                guard [.byte, .short, .integer32].contains(property.header.identifier) else { return nil }
                keyframeBuffer.append(contentsOf: property.values)
            default:
                break
            }
        }

        guard name != nil, !keyframeBuffer.isEmpty else { return nil }
        self.name = name!
        self.keyframeBuffer = keyframeBuffer
    }
}
