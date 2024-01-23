#if swift(>=4.0)
@objcMembers public class ErnRoute: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Path of the Route. Mostly the name of the container(defined by the native app) or the miniapp name. The content of the path is mainly determined by the native implemenation of the API
     */
    public let path: String
    /**
     Optional Payload (respresented as JSON String) needed by the screen you are trying to navigate to.
     */
    public let jsonPayload: String?
    public let navBar: NavBar?

    public init(path: String, jsonPayload: String?, navBar: NavBar?) {
        self.path = path
        self.jsonPayload = jsonPayload
        self.navBar = navBar
        super.init()
    }

    public override init() {
        self.path = String()
        self.jsonPayload = nil
        self.navBar = nil
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let path = dictionary["path"] as? String {
            self.path = path
        } else {
            assertionFailure("\(ErnRoute.tag) missing one or more required properties [path]")
            self.path = dictionary["path"] as! String
        }

        if let jsonPayload = dictionary["jsonPayload"] as? String {
            self.jsonPayload = jsonPayload
        } else {
            self.jsonPayload = nil
        }
        if let navBarDict = dictionary["navBar"] as? [AnyHashable: Any] {
            self.navBar = NavBar(dictionary: navBarDict)
        } else {
            self.navBar = nil
        }

        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["path"] = self.path

        if let nonNullJsonPayload = self.jsonPayload {
            dict["jsonPayload"] = nonNullJsonPayload
        }
        if let nonNullNavBar = self.navBar {
            dict["navBar"] = nonNullNavBar.toDictionary()
        }
        return dict as NSDictionary
    }
}

#else

public class ErnRoute: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Path of the Route. Mostly the name of the container(defined by the native app) or the miniapp name. The content of the path is mainly determined by the native implemenation of the API
     */
    public let path: String
    /**
     Optional Payload (respresented as JSON String) needed by the screen you are trying to navigate to.
     */
    public let jsonPayload: String?
    public let navBar: NavBar?

    public init(path: String, jsonPayload: String?, navBar: NavBar?) {
        self.path = path
        self.jsonPayload = jsonPayload
        self.navBar = navBar
        super.init()
    }

    public override init() {
        self.path = String()
        self.jsonPayload = nil
        self.navBar = nil
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let path = dictionary["path"] as? String {
            self.path = path
        } else {
            assertionFailure("\(ErnRoute.tag) missing one or more required properties [path]")
            self.path = dictionary["path"] as! String
        }

        if let jsonPayload = dictionary["jsonPayload"] as? String {
            self.jsonPayload = jsonPayload
        } else {
            self.jsonPayload = nil
        }
        if let navBarDict = dictionary["navBar"] as? [AnyHashable: Any] {
            self.navBar = NavBar(dictionary: navBarDict)
        } else {
            self.navBar = nil
        }

        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["path"] = self.path

        if let nonNullJsonPayload = self.jsonPayload {
            dict["jsonPayload"] = nonNullJsonPayload
        }
        if let nonNullNavBar = self.navBar {
            dict["navBar"] = nonNullNavBar.toDictionary()
        }
        return dict as NSDictionary
    }
}
#endif
