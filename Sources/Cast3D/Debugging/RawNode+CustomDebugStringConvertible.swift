extension RawNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = self.header.debugDescription + "\n"
        if !self.properties.isEmpty {
            text += "├─ Properties (\(self.properties.count)):\n"
            text += self.properties.map { "│  \($0.debugDescription)" }.joined(separator: "\n") + "\n"
        }
        if !self.children.isEmpty {
            text += "├─ Children (\(self.children.count)):\n"
            text += self.children.map {
                $0.debugDescription.components(separatedBy: .newlines).map {
                    "│  \($0)"
                }.joined(separator: "\n")
            }.joined(separator: "\n") + "\n"
        }
        return text
    }
}
