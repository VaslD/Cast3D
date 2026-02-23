public struct CastModelNode {
    public let name: String?
    public let position: Vector3?
    public let rotation: Vector4?
    public let scale: Vector3?
    
    public let skeletons: [CastSkeletonNode]
    public let meshes: [CastMeshNode]
    public let hairs: [CastHairNode]
    public let blendShapes: [CastBlendShapeNode]
    public let materials: [CastMaterialNode]

    public init?(_ node: RawNode) {
        guard node.header.identifier == .model else { return nil }

        var name: String?
        var position: Vector3?
        var rotation: Vector4?
        var scale: Vector3?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
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

        var skeletons = [CastSkeletonNode]()
        var meshes = [CastMeshNode]()
        var hairs = [CastHairNode]()
        var blendShapes = [CastBlendShapeNode]()
        var materials = [CastMaterialNode]()

        for child in node.children {
            switch child.header.identifier {
            case .skeleton:
                if let item = CastSkeletonNode(child) {
                    skeletons.append(item)
                }
            case .mesh:
                if let item = CastMeshNode(child) {
                    meshes.append(item)
                }
            case .hair:
                if let item = CastHairNode(child) {
                    hairs.append(item)
                }
            case .blendShape:
                if let item = CastBlendShapeNode(child) {
                    blendShapes.append(item)
                }
            case .material:
                if let item = CastMaterialNode(child) {
                    materials.append(item)
                }
            default:
                break
            }
        }

        self.name = name
        self.position = position
        self.rotation = rotation
        self.scale = scale
        
        self.skeletons = skeletons
        self.meshes = meshes
        self.hairs = hairs
        self.blendShapes = blendShapes
        self.materials = materials
    }
}
