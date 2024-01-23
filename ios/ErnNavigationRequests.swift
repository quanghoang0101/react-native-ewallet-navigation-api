#if swift(>=4.0)
@objcMembers public class ErnNavigationRequests: ErnNavigationAPIRequests {
    public override func registerNavigateRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: ErnNavigationAPI.kRequestNavigate,
                                                                       reqClass: ErnRoute.self,
                                                                       respClass: None.self,
                                                                       requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func unregisterNavigateRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func navigate(route: ErnRoute, responseCompletionHandler: @escaping (None?, ElectrodeFailureMessage?) -> Void) {
        let requestProcessor = ElectrodeRequestProcessor<ErnRoute, None, Any>(
            requestName: ErnNavigationAPI.kRequestNavigate,
            requestPayload: route,
            respClass: None.self,
            responseItemType: nil,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? None, errorMessage) }
        )

        requestProcessor.execute()
    }
}

#else

public class ErnNavigationRequests: ErnNavigationAPIRequests {
    public override func registerNavigateRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID? {
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: ErnNavigationAPI.kRequestNavigate,
                                                                       reqClass: ErnRoute.self,
                                                                       respClass: None.self,
                                                                       requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func unregisterNavigateRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func navigate(route: ErnRoute, responseCompletionHandler: @escaping (None?, ElectrodeFailureMessage?) -> Void) {
        let requestProcessor = ElectrodeRequestProcessor<ErnRoute, None, Any>(
            requestName: ErnNavigationAPI.kRequestNavigate,
            requestPayload: route,
            respClass: None.self,
            responseItemType: nil,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? None, errorMessage) }
        )

        requestProcessor.execute()
    }
}
#endif
