import Foundation
import UIKit

extension UICollectionView {
    
    public func registerNibCell<T: UICollectionViewCell>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = Bundle(for: nibClass)
        self.register(UINib(nibName: nibName, bundle: bundle), forCellWithReuseIdentifier: nibName)
    }
    
    public func registerNibHeader<T: UICollectionReusableView>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = Bundle(for: nibClass)
        self.register(UINib(nibName: nibName, bundle: bundle),
                         forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: nibName)
    }
    
    public func registerNibFooter<T: UICollectionReusableView>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = Bundle(for: nibClass)
        self.register(UINib(nibName: nibName, bundle: bundle),
                         forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: nibName)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(className: T.Type, for indexPath: IndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("Error: cell with identifier: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    public func dequeueReusableHeader<T: UICollectionReusableView>(className: T.Type, for indexPath: IndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("Error: dequeueReusableSupplementaryViewOfKind with identifier: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    public func dequeueReusableFooter<T: UICollectionReusableView>(className: T.Type, for indexPath: IndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter,
                                                                withReuseIdentifier: name, for: indexPath) as? T else {
            fatalError("Error: dequeueReusableSupplementaryViewOfKind with identifier: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
}

extension UITableView {
    
    public func registerNibCell<T: UITableViewCell>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = Bundle(for: nibClass)
        self.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
    }
    
    public func registerNibHeaderFooter<T: UITableViewHeaderFooterView>(nibClass: T.Type) {
        let nibName = "\(T.self)"
        let bundle = Bundle(for: nibClass)
        self.register(UINib(nibName: nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: nibName)
    }
    
    public func registerClassHeaderFooter<T: UITableViewHeaderFooterView>(className classItem: T.Type) {
        let className = "\(T.self)"
        self.register(classItem, forHeaderFooterViewReuseIdentifier: className)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(className: T.Type, for indexPath: IndexPath) -> T {
        let name = "\(T.self)"
        guard let cell = self.dequeueReusableCell(withIdentifier: name, for: indexPath) as? T else {
            fatalError("Error: dequeueReusableCell: \(NSStringFromClass(T.self)) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    public func dequeueResuableHeaderFooterView<T: UITableViewHeaderFooterView>(className: T.Type) -> T {
        let name = "\(T.self)"
        guard let resultView = dequeueReusableHeaderFooterView(withIdentifier: name) as? T else {
            fatalError("Error: dequeueResuableHeaderFooterView: \(NSStringFromClass(T.self)) is not \(T.self)")
        }
        return resultView
    }
    
}
