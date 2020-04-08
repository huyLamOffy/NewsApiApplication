
import UIKit
import RxCocoa
import RxSwift

extension UIViewController {
    private struct AssociatedKeys {
        static var mbProgressHud: UInt8 = 0
    }
    
    // using class name to define style
    var progressHUD: MBProgressHUD? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.mbProgressHud) as? MBProgressHUD
        }
        
        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.mbProgressHud, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showHud(message: String = "Đang tải") {
        if progressHUD == nil {
            progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        progressHUD?.label.text = message
    }
    
    func dismissHud() {
        progressHUD?.hide(animated: true)
        progressHUD = nil
    }
    
    func progressHudHide(animated: Bool = true) {
        progressHUD?.hide(animated: animated)
    }
    
    /// Show loading progress
    /// - Parameter message: `default` = "Đang tải"
    /// - Parameter view: `default` = self.view
    /// - Parameter animated: `default` = true
    @discardableResult
    func progressHudShowLoading(withMessage message: String? = nil, toView view: UIView? = nil, animated: Bool = true) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view ?? self.view, animated: animated)
        hud.label.text = message ?? "Loading"
        hud.label.numberOfLines = 0
        hud.mode = .indeterminate
        return hud
    }
    
    /// Show a successful hud
    /// - Parameter message: `default` = "Hoàn thành"
    /// - Parameter view: `default` = self.view
    /// - Parameter delayHide: specify a time delay to hide, pass `0` if don't want to hide automatically
    /// - Parameter animated: `default` = true
    @discardableResult
    func progressHudShowDone(message: String? = nil, toView view: UIView? = nil, delayHide: Double = 2, animated: Bool = true) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view ?? self.view, animated: animated)
        hud.mode = .customView
        let doneLabel = UILabel()
        doneLabel.font = UIFont.systemFont(ofSize: 60)
        doneLabel.text = "✓"
        hud.customView = doneLabel
        hud.label.text = message ?? "Success"
        hud.label.numberOfLines = 0
        if delayHide > 0 {
            hud.hide(animated: true, afterDelay: TimeInterval(delayHide))
        }
        return hud
    }
    
    /// Show an error hud
    /// - Parameter message: `default` = "Thất bại"
    /// - Parameter view: `default` = self.view
    /// - Parameter delayHide: specify a time delay to hide, pass `0` if don't want to hide automatically
    /// - Parameter animated: `default` = true
    @discardableResult
    func progressHudShowError(message: String? = nil, toView view: UIView? = nil, delayHide: Double = 2, animated: Bool = true) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view ?? self.view, animated: animated)
        hud.mode = .customView
        let doneLabel = UILabel()
        doneLabel.font = UIFont.systemFont(ofSize: 60)
        doneLabel.text = "⚠︎"
        hud.customView = doneLabel
        hud.label.text = message ?? "Failed"
        hud.label.numberOfLines = 0
        if delayHide > 0 {
            hud.hide(animated: true, afterDelay: TimeInterval(delayHide))
        }
        return hud
    }
}
