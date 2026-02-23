extension CastNotificationTrackNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastNotificationTrackNode (\(self.name))\n"
        
        text += "├─ Keyframes: \(self.keyframeBuffer.count) events\n"
        
        return text
    }
}
