extension CastColorNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastColorNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        if let value = self.value {
            text += "├─ Value: \(value)\n"
        }
        
        return text
    }
}
