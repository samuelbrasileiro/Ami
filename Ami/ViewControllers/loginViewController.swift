import Foundation
import UIKit
import Charts
class loginViewController: UIViewController, UITextFieldDelegate {
    
    
    var analise = Dados()
    @IBOutlet weak var usuario: UITextField!
    
    @IBOutlet weak var senha: UITextField!
    override func viewDidLoad(){
        super.viewDidLoad()
        usuario.delegate = self
        senha.delegate = self
        senha.isSecureTextEntry = true
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
        
    
}




