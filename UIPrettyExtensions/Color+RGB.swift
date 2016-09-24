import UIKit

public extension UIColor {

    public class func RGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
    
    public class func fromHex(str: String, alpha: CGFloat = 1.0) -> UIColor? {
        
        func hexStringToInt(str: String) -> Int? {
            let scanner = Scanner(string: str)
            scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
            var result: UInt32 = 0
            if scanner.scanHexInt32(&result) {
                return Int(result)
            }
            return nil
        }

        if let hexInt = hexStringToInt(str: str) {
            let red = CGFloat((hexInt & 0xFF0000) >> 16)/255.0
            let green = CGFloat((hexInt & 0xFF00) >> 8)/255.0
            let blue = CGFloat((hexInt & 0xFF)) / 255.0
            
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
        
        return nil
    }

}
