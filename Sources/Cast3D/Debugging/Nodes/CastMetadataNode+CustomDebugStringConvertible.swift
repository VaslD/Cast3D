extension CastMetadataNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastMetadataNode\n"
        
        if let author = self.author {
            text += "├─ Author: \(author)\n"
        }
        if let software = self.software {
            text += "├─ Software: \(software)\n"
        }
        if let upAxis = self.upAxis {
            text += "├─ Up Axis: \(upAxis)\n"
        }
        if let sceneRoot = self.sceneRoot {
            text += "├─ Scene Root: \(sceneRoot)\n"
        }
        
        return text
    }
}
