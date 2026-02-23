extension CastCurveNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastCurveNode (\(self.nodeName))\n"
        
        text += "├─ Key Property: \(self.keyPropertyName.rawValue)\n"
        text += "├─ Mode: \(self.mode.rawValue)\n"
        text += "├─ Keyframes: \(self.keyframeBuffer.count) keyframes\n"
        text += "├─ Key Values: \(self.keyValueBuffer.count) values\n"
        
        if let additiveBlendWeight = self.additiveBlendWeight {
            text += "├─ Additive Blend Weight: \(additiveBlendWeight)\n"
        }
        
        return text
    }
}
