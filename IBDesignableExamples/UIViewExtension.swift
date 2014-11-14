//
//  Created by Nick Snyder on 11/13/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

import UIKit

public extension UIView {
  /// Returns the localized string.
  /// Explicitly passes the bundle so strings will appear in interface builder preview.
  func localizedString(key: String) -> String {
    return NSLocalizedString(key, tableName: nil, bundle: NSBundle(forClass: self.dynamicType), value: "", comment: "")
  }
  
  /// Adds a nib that fills the entire view.
  func addNibSubview(nibName: String) -> UIView {
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
    view.frame = CGRect(origin: CGPointZero, size: bounds.size)
    view.autoresizingMask = .FlexibleHeight | .FlexibleWidth
    addSubview(view)
    return view
  }
  
  /// For debugging interface builder previews
  public func log(message: String) {
    NSLog(message) // This won't be visible when debugging interface builder. Instead, tail logPath on the command line.
    let logPath = "/tmp/XcodeLiveRendering.log"
    if !NSFileManager.defaultManager().fileExistsAtPath(logPath) {
      NSFileManager.defaultManager().createFileAtPath(logPath, contents: NSData(), attributes: nil)
    }
    
    let fileHandle = NSFileHandle(forWritingAtPath: logPath)!
    fileHandle.seekToEndOfFile()
    
    let date = NSDate()
    let bundle = NSBundle(forClass: self.dynamicType)
    let application: AnyObject = bundle.objectForInfoDictionaryKey("CFBundleName")!
    let data = "\(date) \(application) \(message)\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
    fileHandle.writeData(data!)
  }
}
