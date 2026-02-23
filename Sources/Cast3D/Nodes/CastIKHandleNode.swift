public struct CastIKHandleNode {
    public let name: String?
    public let parentIndex: UInt32?
    public let effectorIndex: UInt32?
    public let solver: String?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .inverseKinematicsHandle else { return nil }

        var name: String?
        var parentIndex: UInt32?
        var effectorIndex: UInt32?
        var solver: String?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "p":
                parentIndex = property.values.first?.value as? UInt32
            case "e":
                effectorIndex = property.values.first?.value as? UInt32
            case "s":
                solver = property.values.first?.value as? String
            default:
                break
            }
        }

        self.name = name
        self.parentIndex = parentIndex
        self.effectorIndex = effectorIndex
        self.solver = solver
    }
}
