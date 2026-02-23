extension CastBlendShapeNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastBlendShapeNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        text += "├─ Vertex Position Buffer: \(self.vertexPositionBuffer.count) vertices\n"
        
        if let normals = self.vertexNormalBuffer, !normals.isEmpty {
            text += "├─ Vertex Normal Buffer: \(normals.count) normals\n"
        }
        if let tangents = self.vertexTangentBuffer, !tangents.isEmpty {
            text += "├─ Vertex Tangent Buffer: \(tangents.count) tangents\n"
        }
        
        return text
    }
}
