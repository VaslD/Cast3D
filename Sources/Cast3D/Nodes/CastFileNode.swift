public struct CastFileNode {
    public let name: String?
    public let fileType: FileType?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .file else { return nil }

        var name: String?
        var fileType: FileType?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "ft":
                guard let string = property.values.first?.value as? String,
                      let type = FileType(rawValue: string) else {
                    return nil
                }
                fileType = type
            default:
                break
            }
        }

        self.name = name
        self.fileType = fileType
    }
}

public extension CastFileNode {
    enum FileType: String {
        case texture
        case model
        case animation
        case audio
        case video
        case other
    }
}
