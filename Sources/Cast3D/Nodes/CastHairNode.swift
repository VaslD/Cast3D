public struct CastHairNode {
    public let name: String?
    public let vertexPositionBuffer: [Vector3]
    public let vertexNormalBuffer: [Vector3]?
    public let vertexTangentBuffer: [Vector3]?
    public let vertexColorBuffers: [String: [RawPropertyValue]]
    public let vertexUVBuffers: [String: [Vector2]]

    public init?(_ node: RawNode) {
        guard node.header.identifier == .hair else { return nil }

        var name: String?
        var vertexPositionBuffer: [Vector3]?
        var vertexNormalBuffer: [Vector3]?
        var vertexTangentBuffer: [Vector3]?
        var vertexColorBuffers = [String: [RawPropertyValue]]()
        var vertexUVBuffers = [String: [Vector2]]()

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
            case let colorKey where colorKey.hasPrefix("c"):
                guard [.integer32, .vector4].contains(property.header.identifier) else { return nil }
                vertexColorBuffers[colorKey] = property.values
            case let uvKey where uvKey.hasPrefix("u"):
                guard property.header.identifier == .vector2 else { return nil }
                let uvValues = property.values.compactMap { $0.value as? Vector2 }
                if !uvValues.isEmpty {
                    vertexUVBuffers[uvKey] = uvValues
                }
            default:
                break
            }
        }

        guard let positionBuffer = vertexPositionBuffer, !positionBuffer.isEmpty else { return nil }
        self.name = name
        self.vertexPositionBuffer = positionBuffer
        self.vertexNormalBuffer = vertexNormalBuffer
        self.vertexTangentBuffer = vertexTangentBuffer
        self.vertexColorBuffers = vertexColorBuffers
        self.vertexUVBuffers = vertexUVBuffers
    }
}
