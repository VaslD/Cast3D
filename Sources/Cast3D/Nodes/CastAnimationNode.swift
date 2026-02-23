public struct CastAnimationNode {
    public let name: String?
    public let frameRate: Float?
    public let frameCount: UInt32?
    public let loopMode: LoopMode?
    
    public let curves: [CastCurveNode]
    public let notificationTracks: [CastNotificationTrackNode]
    public let curveModeOverrides: [CastCurveModeOverrideNode]

    public init?(_ node: RawNode) {
        guard node.header.identifier == .animation else { return nil }

        var name: String?
        var frameRate: Float?
        var frameCount: UInt32?
        var loopMode: LoopMode?

        for property in node.properties {
            switch property.name {
            case "n":
                name = property.values.first?.value as? String
            case "fr":
                frameRate = property.values.first?.value as? Float
            case "fc":
                frameCount = property.values.first?.value as? UInt32
            case "lm":
                guard let string = property.values.first?.value as? String,
                      let mode = LoopMode(rawValue: string) else {
                    return nil
                }
                loopMode = mode
            default:
                break
            }
        }

        var curves = [CastCurveNode]()
        var notificationTracks = [CastNotificationTrackNode]()
        var curveModeOverrides = [CastCurveModeOverrideNode]()

        for child in node.children {
            switch child.header.identifier {
            case .curve:
                if let item = CastCurveNode(child) {
                    curves.append(item)
                }
            case .notificationTrack:
                if let item = CastNotificationTrackNode(child) {
                    notificationTracks.append(item)
                }
            case .curveModeOverride:
                if let item = CastCurveModeOverrideNode(child) {
                    curveModeOverrides.append(item)
                }
            default:
                break
            }
        }

        self.name = name
        self.frameRate = frameRate
        self.frameCount = frameCount
        self.loopMode = loopMode
        
        self.curves = curves
        self.notificationTracks = notificationTracks
        self.curveModeOverrides = curveModeOverrides
    }
}

public extension CastAnimationNode {
    enum LoopMode: String {
        case once
        case loop
        case pingpong
    }
}
