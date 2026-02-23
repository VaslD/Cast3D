extension CastSkeletonNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastSkeletonNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        if !self.bones.isEmpty {
            text += "├─ Bones (\(self.bones.count)):\n"
            text += self.bones.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.inverseKinematicsHandles.isEmpty {
            text += "├─ Inverse Kinematics Handles (\(self.inverseKinematicsHandles.count)):\n"
            text += self.inverseKinematicsHandles.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        
        return text
    }
}
