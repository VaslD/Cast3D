extension CastInstanceNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastInstanceNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        text += "├─ Reference File: \(self.referenceFile)\n"
        text += "├─ Position: \(self.position)\n"
        text += "├─ Rotation: \(self.rotation)\n"
        text += "├─ Scale: \(self.scale)\n"
        
        return text
    }
}
