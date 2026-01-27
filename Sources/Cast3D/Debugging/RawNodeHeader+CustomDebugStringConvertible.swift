extension RawNodeHeader: CustomDebugStringConvertible {
    public var debugDescription: String {
        "N: \(self.nodeHash), \(self.identifier.debugDescription), \(self.propertyCount), \(self.childCount)"
    }
}
