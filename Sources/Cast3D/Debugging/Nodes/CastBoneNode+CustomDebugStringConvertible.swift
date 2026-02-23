extension CastBoneNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "CastBoneNode (\(self.name))\n"
        
        if let parentIndex = self.parentIndex {
            text += "├─ Parent Index: \(parentIndex)\n"
        }
        text += "├─ Segment Scale Compensate: \(self.segmentScaleCompensate)\n"
        if let localPosition = self.localPosition {
            text += "├─ Local Position: \(localPosition)\n"
        }
        if let localRotation = self.localRotation {
            text += "├─ Local Rotation: \(localRotation)\n"
        }
        if let worldPosition = self.worldPosition {
            text += "├─ World Position: \(worldPosition)\n"
        }
        if let worldRotation = self.worldRotation {
            text += "├─ World Rotation: \(worldRotation)\n"
        }
        if let scale = self.scale {
            text += "├─ Scale: \(scale)\n"
        }
        
        return text
    }
}
