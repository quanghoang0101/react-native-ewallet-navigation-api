#if swift(>=4.0)
@objcMembers public class NavBar: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Title of Nav Bar
     */
    public let title: String
    /**
     Right button properties
     */
    public let buttons: [NavBarButton]?

    public init(title: String, buttons: [NavBarButton]?) {
        self.title = title
        self.buttons = buttons
        super.init()
    }

    public override init() {
        self.title = String()
        self.buttons = nil
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let title = dictionary["title"] as? String {
            self.title = title
        } else {
            assertionFailure("\(NavBar.tag) missing one or more required properties [title]")
            self.title = dictionary["title"] as! String
        }

        if let validButtons = try? NSObject.generateObject(data: dictionary["buttons"], classType: [Any].self, itemType: NavBarButton.self),
            let buttonsList = validButtons as? [NavBarButton] {
            self.buttons = buttonsList
        } else {
            self.buttons = nil
        }

        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["title"] = self.title

        if let nonNullButtons = self.buttons {
            dict["buttons"] = nonNullButtons.map { $0.toDictionary() }
        }
        return dict as NSDictionary
    }
}

#else

public class NavBar: ElectrodeObject, Bridgeable {
    private static let tag = String(describing: type(of: self))

    /**
     Title of Nav Bar
     */
    public let title: String
    /**
     Right button properties
     */
    public let buttons: [NavBarButton]?

    public init(title: String, buttons: [NavBarButton]?) {
        self.title = title
        self.buttons = buttons
        super.init()
    }

    public override init() {
        self.title = String()
        self.buttons = nil
        super.init()
    }

    public required init(dictionary: [AnyHashable: Any]) {
        if let title = dictionary["title"] as? String {
            self.title = title
        } else {
            assertionFailure("\(NavBar.tag) missing one or more required properties [title]")
            self.title = dictionary["title"] as! String
        }

        if let validButtons = try? NSObject.generateObject(data: dictionary["buttons"], classType: [Any].self, itemType: NavBarButton.self),
            let buttonsList = validButtons as? [NavBarButton] {
            self.buttons = buttonsList
        } else {
            self.buttons = nil
        }

        super.init(dictionary: dictionary)
    }

    public func toDictionary() -> NSDictionary {
        var dict = [:] as [AnyHashable: Any]

        dict["title"] = self.title

        if let nonNullButtons = self.buttons {
            dict["buttons"] = nonNullButtons.map { $0.toDictionary() }
        }
        return dict as NSDictionary
    }
}
#endif
