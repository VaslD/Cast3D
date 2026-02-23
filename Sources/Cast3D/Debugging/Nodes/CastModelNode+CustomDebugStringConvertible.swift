extension CastModelNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastModelNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        if let position = self.position {
            text += "├─ Position: \(position)\n"
        }
        if let rotation = self.rotation {
            text += "├─ Rotation: \(rotation)\n"
        }
        if let scale = self.scale {
            text += "├─ Scale: \(scale)\n"
        }
        
        if !self.skeletons.isEmpty {
            text += "├─ Skeletons (\(self.skeletons.count)):\n"
            text += self.skeletons.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.meshes.isEmpty {
            text += "├─ Meshes (\(self.meshes.count)):\n"
            text += self.meshes.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.hairs.isEmpty {
            text += "├─ Hairs (\(self.hairs.count)):\n"
            text += self.hairs.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.blendShapes.isEmpty {
            text += "├─ BlendShapes (\(self.blendShapes.count)):\n"
            text += self.blendShapes.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.materials.isEmpty {
            text += "├─ Materials (\(self.materials.count)):\n"
            text += self.materials.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        
        return text
    }
}
