//
//  SegueFromLeft.swift
//  Yay! Time for a race.
//
//  Created by Madelin Woods on 7/24/16.
//  Copyright © 2016 Madelin Woods. All rights reserved.
//

import Foundation
import UIKit

class SegueFromLeft: UIStoryboardSegue {
    override func perform() {
        let src = self.sourceViewController
        let dst = self.destinationViewController
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransformMakeTranslation(src.view.frame.size.width, 0)
        
        UIView.animateWithDuration(0.25,
                                   delay: 0.0,
                                   options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {
                                    dst.view.transform = CGAffineTransformMakeTranslation(0, 0)
            },
                                   completion: { finished in
                                    src.presentViewController(dst, animated: false, completion: nil)
            }
        )
    }
}