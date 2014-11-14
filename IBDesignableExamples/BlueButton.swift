//
//  Created by Nick Snyder on 10/23/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

import UIKit

/// A standard blue button (it is actually just a control).
@IBDesignable
class BlueButton: UIControl {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBInspectable var localizedTitleKey: String = "" {
    didSet {
      log("set localizedTitleKey \(localizedTitleKey)")
      titleLabel?.text = localizedString(localizedTitleKey)
    }
  }
  
  override var highlighted: Bool {
    didSet {
      titleLabel.alpha = highlighted ? 0.5 : 1.0
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    log("initWithFrame")
    setup()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    log("initWithCoder")
    setup()
  }
  
  private func setup() {
    let view = addNibSubview("BlueButton")
    view.layer.cornerRadius = 10
    backgroundColor = UIColor.clearColor()
  }

  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    log("prepareForInterfaceBuilder")
  }
}