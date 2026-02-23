public struct CastCurveNode {
    public let nodeName: String
    public let keyPropertyName: PropertyName
    public let keyframeBuffer: [RawPropertyValue]
    public let keyValueBuffer: [RawPropertyValue]
    public let mode: Mode
    public let additiveBlendWeight: Float?

    public init?(_ node: RawNode) {
        guard node.header.identifier == .curve else { return nil }

        var nodeName: String?
        var keyPropertyName: PropertyName?
        var keyframeBuffer = [RawPropertyValue]()
        var keyValueBuffer = [RawPropertyValue]()
        var mode: Mode?
        var additiveBlendWeight: Float?

        for property in node.properties {
            switch property.name {
            case "nn":
                nodeName = property.values.first?.value as? String
            case "kp":
                guard let string = property.values.first?.value as? String,
                      let propertyName = PropertyName(rawValue: string) else {
                    return nil
                }
                keyPropertyName = propertyName
            case "kb":
                guard [.byte, .short, .integer32].contains(property.header.identifier) else { return nil }
                keyframeBuffer.append(contentsOf: property.values)
            case "kv":
                guard [.byte, .short, .integer32, .float, .vector4].contains(property.header.identifier) else {
                    return nil
                }
                keyValueBuffer.append(contentsOf: property.values)
            case "m":
                guard let string = property.values.first?.value as? String,
                      let typed = Mode(rawValue: string) else {
                    return nil
                }
                mode = typed
            case "ab":
                additiveBlendWeight = property.values.first?.value as? Float
            default:
                return nil
            }
        }

        guard nodeName != nil, keyPropertyName != nil, !keyframeBuffer.isEmpty,
              !keyValueBuffer.isEmpty, mode != nil else {
            return nil
        }
        self.nodeName = nodeName!
        self.keyPropertyName = keyPropertyName!
        self.keyframeBuffer = keyframeBuffer
        self.keyValueBuffer = keyValueBuffer
        self.mode = mode!
        self.additiveBlendWeight = additiveBlendWeight
    }
}

public extension CastCurveNode {
    enum PropertyName: String {
        case quaternionRotation = "rq"
        case translationX = "tx"
        case translationY = "ty"
        case translationZ = "tz"
        case scaleX = "sx"
        case scaleY = "sy"
        case scaleZ = "sz"
        case blendShapeWeight = "bs"
        case visibility = "vb"
    }
}

public extension CastCurveNode {
    enum Mode: String {
        case additive
        case absolute
        case relative
    }
}
