public struct CastCurveModeOverrideNode {
    public let nodeName: String
    public let keyPropertyName: String
    public let mode: CastCurveNode.Mode

    public init?(_ node: RawNode) {
        guard node.header.identifier == .curveModeOverride else { return nil }

        var nodeName: String?
        var keyPropertyName: String?
        var mode: CastCurveNode.Mode?

        for property in node.properties {
            switch property.name {
            case "nn":
                nodeName = property.values.first?.value as? String
            case "kp":
                keyPropertyName = property.values.first?.value as? String
            case "m":
                guard let string = property.values.first?.value as? String,
                      let typed = CastCurveNode.Mode(rawValue: string) else {
                    return nil
                }
                mode = typed
            default:
                break
            }
        }

        guard let name = nodeName, let keyProp = keyPropertyName, let modeValue = mode else {
            return nil
        }
        self.nodeName = name
        self.keyPropertyName = keyProp
        self.mode = modeValue
    }
}
