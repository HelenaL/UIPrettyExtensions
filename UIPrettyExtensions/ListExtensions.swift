import Foundation
import UIKit

extension UICollectionView {
    
    public func registerNibCell<T: UICollectionViewCell>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = NSBundle(forClass: nibClass)
        self.registerNib(UINib(nibName: nibName, bundle: bundle), forCellWithReuseIdentifier: nibName)
    }
    
    public func registerNibHeader<T: UICollectionReusableView>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = NSBundle(forClass: nibClass)
        self.registerNib(UINib(nibName: nibName, bundle: bundle),
                         forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: nibName)
    }
    
    public func registerNibFooter<T: UICollectionReusableView>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = NSBundle(forClass: nibClass)
        self.registerNib(UINib(nibName: nibName, bundle: bundle),
                         forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: nibName)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(className: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = dequeueReusableCellWithReuseIdentifier(name, forIndexPath: indexPath) as? T else {
            fatalError("Error: cell with identifier: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    public func dequeueReusableHeader<T: UICollectionReusableView>(className: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                                                                withReuseIdentifier: name, forIndexPath: indexPath) as? T else {
            fatalError("Error: dequeueReusableSupplementaryViewOfKind with identifier: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    public func dequeueReusableFooter<T: UICollectionReusableView>(className: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter,
                                                                withReuseIdentifier: name, forIndexPath: indexPath) as? T else {
            fatalError("Error: dequeueReusableSupplementaryViewOfKind with identifier: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
}

extension UITableView {
    
    public func registerNibCell<T: UITableViewCell>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = NSBundle(forClass: nibClass)
        self.registerNib(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
    }
    
    public func registerNibHeaderFooter<T: UITableViewHeaderFooterView>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = NSBundle(forClass: nibClass)
        self.registerNib(UINib(nibName: nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: nibName)
    }
    
    public func registerClassHeaderFooter<T: UITableViewHeaderFooterView>(classItem: T.Type) {
        let className = "\(T.self)"
        self.registerClass(classItem, forHeaderFooterViewReuseIdentifier: className)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(className: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = dequeueReusableCellWithIdentifier(name, forIndexPath: indexPath) as? T else {
            fatalError("Error: dequeueReusableCell: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    public func dequeueResuableHeaderFooterView<T: UITableViewHeaderFooterView>(className: T.Type) -> T {
        let name = "\(T.self)"
        guard let resultView = dequeueReusableHeaderFooterViewWithIdentifier(name) as? T else {
            fatalError("Error: dequeueResuableHeaderFooterView: \(NSStringFromClass(T.self)) is not \(T.self)")
        }
        return resultView
    }
    
}
