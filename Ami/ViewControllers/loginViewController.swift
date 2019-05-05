import Foundation
import UIKit
import Charts
class loginViewController: UIViewController, UITextFieldDelegate {
    
    
    var analise = Dados()
    @IBOutlet weak var usuario: UITextField!
    
    @IBOutlet weak var senha: UITextField!
    
    var activityIndicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        usuario.delegate = self
        senha.delegate = self
        senha.isSecureTextEntry = true
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.hidesWhenStopped = true
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 180)
        view.addConstraint(verticalConstraint)
        
    }
    @IBAction func button(_ sender: Any) {
        activityIndicator.startAnimating()
        
        dadosDAO.getEmotions (callback: { (analise) in
            sessaoGlobal.humor = analise.humor
        })
        dadosDAO.getWords (callback: { (analise) in
            sessaoGlobal.keys = analise.keys
        })
        //activityIndicator.stopAnimating()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
        
    
}




