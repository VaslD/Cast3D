public struct CastSkeletonNode {
    public let name: String?
    
    public let bones: [CastBoneNode]
    public let inverseKinematicsHandles: [CastIKHandleNode]

    public init?(_ node: RawNode) {
        guard node.header.identifier == .skeleton else { return nil }

        var name: String?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            default:
                break
            }
        }

        var bones = [CastBoneNode]()
        var inverseKinematicsHandles = [CastIKHandleNode]()

        for child in node.children {
            switch child.header.identifier {
            case .bone:
                if let item = CastBoneNode(child) {
                    bones.append(item)
                }
            case .inverseKinematicsHandle:
                if let item = CastIKHandleNode(child) {
                    inverseKinematicsHandles.append(item)
                }
            default:
                break
            }
        }

        self.name = name
        
        self.bones = bones
        self.inverseKinematicsHandles = inverseKinematicsHandles
    }
}
