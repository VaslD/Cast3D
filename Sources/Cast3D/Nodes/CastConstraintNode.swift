public struct CastConstraintNode {
    public let name: String?
    public let constraintType: ConstraintType?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .constraint else { return nil }

        var name: String?
        var constraintType: ConstraintType?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "ct":
                guard let string = property.values.first?.value as? String,
                      let type = ConstraintType(rawValue: string) else {
                    return nil
                }
                constraintType = type
            default:
                break
            }
        }

        self.name = name
        self.constraintType = constraintType
    }
}

public extension CastConstraintNode {
    enum ConstraintType: String {
        case aim
        case orient
        case parent
        case point
        case scale
        case poleVector = "pole_vector"
    }
}
