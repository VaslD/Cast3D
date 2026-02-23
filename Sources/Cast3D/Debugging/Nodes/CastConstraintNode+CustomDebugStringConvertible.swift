extension CastConstraintNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastConstraintNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        if let constraintType = self.constraintType {
            text += "├─ Constraint Type: \(constraintType.rawValue)\n"
        }
        
        return text
    }
}
