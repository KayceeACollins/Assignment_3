//
//  InboxViewController.swift
//  Assignment_3
//
//  Created by Kaycee Collins on 9/29/15.
//  Copyright © 2015 ___kayceeAcollins___. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {

    //Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var singleMessage: UIImageView!
    @IBOutlet weak var backgrounfColor: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var pageContent: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var feed: UIImageView!


    
    //Global Vars and lets
    var singleMessageInitialCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 320, height: 1455)
        listImage.alpha = 0
        archiveIcon.alpha = 0
        deleteIcon.alpha = 0
        listIcon.alpha = 0
        laterIcon.alpha = 0
        listView.alpha = 0
        rescheduleView.alpha = 0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    // rbgValue - define hex color value
    // alpha - define transparency value
    // returns - CGColor
    
    
    //Paning Gesture
    @IBAction func onPan(sender: UIPanGestureRecognizer) {

        let translation = sender.translationInView(view)
        
        
        
        //BEGINING
        if sender.state == UIGestureRecognizerState.Began {
            
            //SMOOTH OUT MOVEMENT TO BE THE RIGHT CENTER + THE VAR ABOVE
            singleMessageInitialCenter = singleMessage.center
            
        }
        
        //CHANGES
        else
            if sender.state == UIGestureRecognizerState.Changed {
                
                //MOVE LEFT AND RIGHT
                singleMessage.center.x = singleMessageInitialCenter.x + translation.x
                
                
                //Reschedule
                if singleMessage.center.x < -100 {
                    backgrounfColor.backgroundColor = UIColorFromHex(0xD8A675, alpha: 0.9)
                    listIcon.center.x = singleMessage.center.x + 180
                    archiveIcon.alpha = 0
                    deleteIcon.alpha = 0
                    listIcon.alpha = 1
                    laterIcon.alpha = 0
                    
                } else if singleMessage.center.x < 160 && singleMessage.center.x > 100 {
                    backgrounfColor.backgroundColor = UIColorFromHex(0xE3E3E3, alpha: 0.9)
                    laterIcon.center.x = singleMessage.center.x + 180
                    archiveIcon.alpha = 0
                    deleteIcon.alpha = 0
                    listIcon.alpha = 0
                    laterIcon.alpha = 1
                    
                } else if singleMessage.center.x < 100 {
                    backgrounfColor.backgroundColor = UIColorFromHex(0xFAD333, alpha: 1)
                    laterIcon.center.x = singleMessage.center.x + 180
                    archiveIcon.alpha = 0
                    deleteIcon.alpha = 0
                    listIcon.alpha = 0
                    laterIcon.alpha = 1
                    
                    
                    
                    
                //Archiving
                }else if singleMessage.center.x > 340 {
                    backgrounfColor.backgroundColor = UIColorFromHex(0xEB5433, alpha: 1)
                    deleteIcon.center.x = singleMessage.center.x - 180
                    archiveIcon.alpha = 0
                    deleteIcon.alpha = 1
                    listIcon.alpha = 0
                    laterIcon.alpha = 0
                    
                } else if singleMessage.center.x > 220 && singleMessage.center.x < 340 {
                    backgrounfColor.backgroundColor = UIColorFromHex(0x70D962, alpha: 1)
                    archiveIcon.center.x = singleMessage.center.x - 180
                    archiveIcon.alpha = 1
                    deleteIcon.alpha = 0
                    listIcon.alpha = 0
                    laterIcon.alpha = 0
                    
                } else if singleMessage.center.x > 100 && singleMessage.center.x > 160{
                    backgrounfColor.backgroundColor = UIColorFromHex(0xE3E3E3, alpha: 1)
                    archiveIcon.center.x = singleMessage.center.x - 180
                    archiveIcon.alpha = 1
                    deleteIcon.alpha = 0
                    listIcon.alpha = 0
                    laterIcon.alpha = 0
                }
            }
            
        //ENDED
        else
            //Orange
            if sender.state == UIGestureRecognizerState.Ended {
                if singleMessage.center.x < -100 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.listView.alpha = 1
                        self.singleMessage.center.x = self.singleMessage.center.x - 320
                    })
                    UIView.animateWithDuration(2.5, animations: { () -> Void in
                        self.backgrounfColor.center.y = self.backgrounfColor.center.y - 100
                        self.feed.center.y = self.feed.center.y - 90
                    })
                //Yello
                } else if singleMessage.center.x < 100{
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.rescheduleView.alpha = 1
                        self.singleMessage.center.x = self.singleMessage.center.x - 320
                    })
                    UIView.animateWithDuration(2.5, animations: { () -> Void in
                        self.backgrounfColor.center.y = self.backgrounfColor.center.y - 100
                        self.feed.center.y = self.feed.center.y - 90
                    })
                //red
                }else if singleMessage.center.x > 340 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.singleMessage.center.x = self.singleMessageInitialCenter.x
                        self.archiveIcon.alpha = 0
                        self.laterIcon.alpha = 0
                        self.singleMessage.center.x = self.singleMessage.center.x - 100
                        self.backgrounfColor.center.x = self.backgrounfColor.center.x - 100
                        self.feed.center.y = self.feed.center.y - 90
                    })
                //green
                } else if singleMessage.center.x > 220 && singleMessage.center.x < 340{
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.singleMessage.center.x = self.singleMessageInitialCenter.x
                        self.archiveIcon.alpha = 0
                        self.laterIcon.alpha = 0
                        self.singleMessage.center.x = self.singleMessage.center.x - 100
                        self.backgrounfColor.center.x = self.backgrounfColor.center.x - 100
                        self.feed.center.y = self.feed.center.y - 90
                    })
                //grey
                } else if singleMessage.center.x > 100 && singleMessage.center.x > 160 || singleMessage.center.x < 160 && singleMessage.center.x > 100 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.singleMessage.center.x = self.singleMessageInitialCenter.x
                        self.archiveIcon.alpha = 0
                        self.laterIcon.alpha = 0
                    })
                }
                
        }
    }
    //PANNING ENDS
    
    //TAP TO CLOSE MODALS
    @IBAction func onTapClose(sender: UITapGestureRecognizer) {
        rescheduleView.alpha = 0
    }

    @IBAction func onTapCloseListView(sender: UITapGestureRecognizer) {
        listView.alpha = 0
    }
    //ENS TAP TO CLOSE MODALS
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
