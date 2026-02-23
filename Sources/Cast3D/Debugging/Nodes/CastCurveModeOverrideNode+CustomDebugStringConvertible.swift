extension CastCurveModeOverrideNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastCurveModeOverrideNode\n"
        
        text += "├─ Node Name: \(self.nodeName)\n"
        text += "├─ Key Property Name: \(self.keyPropertyName)\n"
        text += "├─ Mode: \(self.mode.rawValue)\n"
        
        return text
    }
}
