#if swift(>=4.0)
@objcMembers public class ErnNavigationAPI: NSObject {
    static let kRequestNavigate = "com.ewalletnavigation.ern.api.request.navigate"

    public lazy var requests: ErnNavigationAPIRequests = {
        ErnNavigationRequests()
    }()
}


@objcMembers public class ErnNavigationAPIRequests: NSObject {
    public func registerNavigateRequestHandler(handler _: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        assertionFailure("should override")
        return UUID()
    }

    public func unregisterNavigateRequestHandler(uuid _: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }

    public func navigate(route _: ErnRoute, responseCompletionHandler _: @escaping (None?, ElectrodeFailureMessage?) -> Void) {
        assertionFailure("should override")
    }
}

#else

public class ErnNavigationAPI: NSObject {
    static let kRequestNavigate = "com.ewalletnavigation.ern.api.request.navigate"

    public lazy var requests: ErnNavigationAPIRequests = {
        ErnNavigationRequests()
    }()
}


public class ErnNavigationAPIRequests: NSObject {
    public func registerNavigateRequestHandler(handler _: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        assertionFailure("should override")
        return UUID()
    }

    public func unregisterNavigateRequestHandler(uuid _: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }

    public func navigate(route _: ErnRoute, responseCompletionHandler _: @escaping ElectrodeBridgeResponseCompletionHandler) {
        assertionFailure("should override")
    }
}
#endif
