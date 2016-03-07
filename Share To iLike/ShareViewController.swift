//
//  ShareViewController.swift
//  Share To iLike
//
//  Created by MichaelMou on 15/8/6.
//  Copyright (c) 2015年 MichaelMou. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {
    
    var token:String?{
        let userDefault = NSUserDefaults(suiteName: GROUP_ID)
        return (userDefault?.objectForKey("token") as? String)
    }

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        

        for inputItem in self.extensionContext!.inputItems{
            if let item: NSExtensionItem = inputItem as? NSExtensionItem{
                
                for attachment in item.attachments!{
                    if let itemProvider = attachment as? NSItemProvider{

                        for type in itemProvider.registeredTypeIdentifiers{

                            if let identifier = type as? String{
                                
                                itemProvider.loadItemForTypeIdentifier(identifier, options: nil, completionHandler: { (data, error) -> Void in
                                    print("identifier:\(identifier)")
                                    print("data:\(data)")
                                    print("error:\(error)")
                                })
                            }
                        }
                    }
                }
            }
        }
        
        let activityIndictorView = UIActivityIndicatorView(activityIndicatorStyle:.Gray)
        activityIndictorView.center = self.view.center
        self.view.addSubview(activityIndictorView)

        
//        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        
        var items = [AnyObject]()
        
        if let token = self.token{
            print("token\(token)")
        }else{
            let item = SLComposeSheetConfigurationItem()
            item.title = "未登录？ 请先打开iLike登录"
            
            items.append(item)
        }
        
        

        return items
     }
    
    func itemsRecieved(userInfo:AnyObject!) -> Void{
        
        print("userInfo:\(userInfo)")
        
    }

}
