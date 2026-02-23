extension RawPropertyHeader: CustomDebugStringConvertible {
    public var debugDescription: String {
        "\(self.arrayLength) \(self.identifier.debugDescription)"
    }
}
