extension CastRootNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastRootNode\n"
        
        if !self.models.isEmpty {
            text += "├─ Models (\(self.models.count)):\n"
            text += self.models.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.animations.isEmpty {
            text += "├─ Animations (\(self.animations.count)):\n"
            text += self.animations.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.instances.isEmpty {
            text += "├─ Instances (\(self.instances.count)):\n"
            text += self.instances.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.metadata.isEmpty {
            text += "├─ Metadata (\(self.metadata.count)):\n"
            text += self.metadata.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        
        return text
    }
}
