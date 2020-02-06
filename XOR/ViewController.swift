//
//  ViewController.swift
//  XOR
//
//  Created by Admin on 9/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    var mte:String = ""
    var kte:String = ""
    var mte_byteArray : [UInt8] = []
    var kte_byteArray : [UInt8] = []
    var encrypted = [UInt8]()
    var decrypted = [UInt8]()
    var str = ""
    var str1 = ""
    @IBOutlet weak var messageToEncrypt: UITextField!
    @IBOutlet weak var encryptionKey: UITextField!
    @IBOutlet weak var cryptResult: UITextField!
    @IBOutlet weak var decryptResult: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func encryptFunc(_ sender: AnyObject) {
        cryptResult.text = ""
        decryptResult.text = ""
        cryptResult.isUserInteractionEnabled = false
        decryptResult.isUserInteractionEnabled = false
        mte = messageToEncrypt.text!
        kte = encryptionKey.text!
        mte_byteArray = Array(mte.utf8)
        kte_byteArray = Array(kte.utf8)
        
        for t in mte_byteArray.enumerated() {
            encrypted.append(t.element ^ kte_byteArray[t.offset%kte_byteArray.count])
        }
        str = String(bytes: encrypted, encoding: String.Encoding.utf8)!
        cryptResult.text = str
    }
    
    @IBAction func decryptFunc(_ sender: AnyObject) {
        for t in encrypted.enumerated() {
            decrypted.append(t.element ^ kte_byteArray[t.offset%kte_byteArray.count])
        }
        str1 = String(bytes: decrypted, encoding: String.Encoding.utf8)!
        decryptResult.text = str1
    }
}

