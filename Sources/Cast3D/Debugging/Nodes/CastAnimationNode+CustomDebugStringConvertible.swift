extension CastAnimationNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastAnimationNode"
        if let name = self.name {
            text += " (\(name))"
        }
        text += "\n"
        
        if let frameRate = self.frameRate {
            text += "├─ Frame Rate: \(frameRate)\n"
        }
        if let frameCount = self.frameCount {
            text += "├─ Frame Count: \(frameCount)\n"
        }
        if let loopMode = self.loopMode {
            text += "├─ Loop Mode: \(loopMode.rawValue)\n"
        }
        
        if !self.curves.isEmpty {
            text += "├─ Curves (\(self.curves.count)):\n"
            text += self.curves.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.notificationTracks.isEmpty {
            text += "├─ Notification Tracks (\(self.notificationTracks.count)):\n"
            text += self.notificationTracks.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        if !self.curveModeOverrides.isEmpty {
            text += "├─ Curve Mode Overrides (\(self.curveModeOverrides.count)):\n"
            text += self.curveModeOverrides.map { 
                $0.debugDescription.components(separatedBy: .newlines).map { "│  \($0)" }.joined(separator: "\n") 
            }.joined(separator: "\n") + "\n"
        }
        
        return text
    }
}
