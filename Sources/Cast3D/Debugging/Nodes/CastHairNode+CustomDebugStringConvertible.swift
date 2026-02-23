extension CastHairNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastHairNode"
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
        
        if !self.vertexColorBuffers.isEmpty {
            text += "├─ Vertex Color Buffers (\(self.vertexColorBuffers.count)):\n"
            for (key, values) in self.vertexColorBuffers {
                text += "│  ├─ \(key): \(values.count) colors\n"
            }
        }
        if !self.vertexUVBuffers.isEmpty {
            text += "├─ Vertex UV Buffers (\(self.vertexUVBuffers.count)):\n"
            for (key, values) in self.vertexUVBuffers {
                text += "│  ├─ \(key): \(values.count) UVs\n"
            }
        }
        
        return text
    }
}
