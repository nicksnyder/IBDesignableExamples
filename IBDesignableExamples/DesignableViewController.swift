//
//  Created by Nick Snyder on 11/12/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

import UIKit

class DesignableViewController: UIViewController {
  
  override init() {
    super.init(nibName: "DesignableViewController", bundle: nil)
  }
  
  @IBAction func tapBlueButton() {
    UIAlertView(title: "Blue button tapped", message: "", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "Ok").show()
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
