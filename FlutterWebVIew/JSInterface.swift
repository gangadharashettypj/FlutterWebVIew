//
//  JSInterface.swift
//  FlutterWebVIew
//
//  Created by Gangadharan on 10/03/21.
//

import Foundation
import JavaScriptCore
import UIKit

@objc protocol MyExport : JSExport
{
    func askContactPermission() -> Bool
}


class JSInterface : NSObject, MyExport
{
    func askContactPermission() -> Bool{
        print("ios: asking contact permission")
        return false
    }
}
