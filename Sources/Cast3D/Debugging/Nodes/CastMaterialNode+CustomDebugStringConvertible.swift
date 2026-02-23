extension CastMaterialNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastMaterialNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        return text
    }
}
