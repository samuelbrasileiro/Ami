import Foundation
import UIKit
import Charts
class ViewController: UIViewController {
    
    
    var analise = Dados()

    override func viewDidLoad(){
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sessaoIdentifier"{
            if let _ = segue.destination as? SessionPageViewController{
                
                
                
            }
        }
        
        
    }
}




