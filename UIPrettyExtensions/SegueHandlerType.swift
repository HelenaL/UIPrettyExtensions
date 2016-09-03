import UIKit

public protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {

    public func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }

    public func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier,
        segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Couldn't handle segue identifier \(segue.identifier) for view controller of type \(self.dynamicType).")
        }

        return segueIdentifier
    }
    
}
