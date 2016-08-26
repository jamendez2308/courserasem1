//
//  ViewController.swift
//  peticion
//
//  Created by Mendez, Arturo {LALA} on 26/08/16.
//  Copyright © 2016 Mendez, Arturo {LALA}. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtIsbn: UITextField!
    @IBOutlet weak var txtvRespuesta: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.txtIsbn.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true);
        
        //Metodo sincrono
        self.txtvRespuesta.text = ""
        let url1 = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let url2 = self.txtIsbn.text!
        let urls = url1 + url2
        
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        
        if (datos != nil) {
            let texto = NSString(data:datos!, encoding: NSUTF8StringEncoding)
            self.txtvRespuesta.text = String(texto)
        }
        else{
            let alert = UIAlertController(title: "Petición", message: "Error de comunicación!!!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        return false;
    }
}

