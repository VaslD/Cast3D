public struct CastBlendShapeNode {
    public let name: String?
    public let vertexPositionBuffer: [Vector3]
    public let vertexNormalBuffer: [Vector3]?
    public let vertexTangentBuffer: [Vector3]?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .blendShape else { return nil }

        var name: String?
        var vertexPositionBuffer: [Vector3]?
        var vertexNormalBuffer: [Vector3]?
        var vertexTangentBuffer: [Vector3]?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "vp":
                guard property.header.identifier == .vector3 else { return nil }
                vertexPositionBuffer = property.values.compactMap { $0.value as? Vector3 }
            case "vn":
                guard property.header.identifier == .vector3 else { return nil }
                vertexNormalBuffer = property.values.compactMap { $0.value as? Vector3 }
            case "vt":
                guard property.header.identifier == .vector3 else { return nil }
                vertexTangentBuffer = property.values.compactMap { $0.value as? Vector3 }
            default:
                break
            }
        }

        guard let positionBuffer = vertexPositionBuffer, !positionBuffer.isEmpty else { return nil }
        self.name = name
        self.vertexPositionBuffer = positionBuffer
        self.vertexNormalBuffer = vertexNormalBuffer
        self.vertexTangentBuffer = vertexTangentBuffer
    }
}
