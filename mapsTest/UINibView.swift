//
//  UINibView.swift
//  scatch-ios
//
import UIKit

class UINibView: UIView {
    var view: UIView!
    override init(frame: CGRect) {
        var topPadding:CGFloat = UIApplication.shared.statusBarFrame.size.height
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                topPadding += window.safeAreaInsets.top
            }
        }
        let he = 96/800*UIScreen.main.bounds.width
        let f = CGRect(x: 0, y: topPadding, width: UIScreen.main.bounds.width, height: he + 0)
        
        super.init(frame: f)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view from .xib file
        xibSetup()
    }
    
}

private extension UINibView {
    
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Adding custom subview on top of our view
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
    }
}

extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
