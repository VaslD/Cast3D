extension CastFileNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastFileNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        if let fileType = self.fileType {
            text += "├─ File Type: \(fileType.rawValue)\n"
        }
        
        return text
    }
}
