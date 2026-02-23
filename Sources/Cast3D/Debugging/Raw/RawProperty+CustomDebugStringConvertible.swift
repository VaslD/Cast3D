extension RawProperty: CustomDebugStringConvertible {
    public var debugDescription: String {
        "P: \"\(self.name)\", \(self.header.debugDescription)"
    }
}
