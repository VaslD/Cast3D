extension CastIKHandleNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastIKHandleNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        return text
    }
}
