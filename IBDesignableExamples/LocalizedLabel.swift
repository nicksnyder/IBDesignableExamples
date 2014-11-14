//
//  Created by Nick Snyder on 11/13/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

import UIKit

/// A label that displays a localized string that displays a live preview in interface builder.
@IBDesignable
class LocalizedLabel: UILabel {
  @IBInspectable var localizationKey: String = "" {
    didSet {
      log("set localizationKey \(localizationKey)")
      text = localizedString(localizationKey)
    }
  }
}