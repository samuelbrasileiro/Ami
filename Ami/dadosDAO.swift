import Foundation

enum Humor : String{
    case joy = "joy"
    case sadness = "sadness"
    case fear = "fear"
    case disgust = "disgust"
    case anger = "anger"
    case other
    
}
enum PalavrasChave : String{
    case Bem = "Bem"
    case Bullying = "Bullying"
    case Desafios = "Desafios"
    case Detalhes_dia_negativo = "Detalhes_dia_negativo"
    case Detalhes_dia_positivo = "Detalhes_dia_positivo"
    case palavrao = "palavrao"
    case Saude_negativa = "Saude_negativa"
    case other
    
}

class Dados{
    var data: String
    var humor: [Humor: Double]//doc//features//emotion//document//emotion
    var keys: [PalavrasChave: Int]//doc//payload
    init(){
        self.data = "03/05/2019"
        self.humor = [
            .joy : 0,
            .sadness : 0,
            .fear : 0,
            .anger : 0,
            .disgust : 0,
            .other : 0
        ]
        self.keys = [
            .Bem : 0,
            .Bullying : 0,
            .Desafios : 0,
            .Detalhes_dia_negativo : 0,
            .Detalhes_dia_positivo : 0,
            .palavrao : 0,
            .Saude_negativa : 0,
            .other : 0
        ]
    }
    
    init(data: String, humores: [Humor:Double], chaves: [PalavrasChave:Int]){
        self.data = data
        self.humor = [
            .joy : humores[.joy]!,
            .sadness : humores[.sadness]!,
            .fear : humores[.fear]!,
            .anger : humores[.anger]!,
            .disgust : humores[.disgust]!,
            .other : 0
        ]
        self.keys = [
            .Bem : chaves[.Bem]!,
            .Bullying : chaves[.Bullying]!,
            .Desafios : chaves[.Desafios]!,
            .Detalhes_dia_negativo : chaves[.Detalhes_dia_negativo]!,
            .Detalhes_dia_positivo : chaves[.Detalhes_dia_positivo]!,
            .palavrao : chaves[.palavrao]!,
            .Saude_negativa : chaves[.Saude_negativa]!,
            .other : 0
        ]
        
    }
    func addEmotions(json: [String: AnyObject]){
        print("aaa")
        if let jsonFeatures = json["features"] as? [String:AnyObject]{
            print("ccc")
            if let jsonEmotions = jsonFeatures["emotion"] as? [String:AnyObject]{
                print("ddd")
                if let jsonDocument = jsonEmotions["document"] as? [String:AnyObject]{
                    print("eee")
                    if let jsonEmotion = jsonDocument["emotion"] as? [String:AnyObject]{
                        print("fff")
                        self.humor[.joy] = self.humor[.joy]! + Double(jsonEmotion["joy"] as? Double ?? 0)
                        self.humor[.sadness] = self.humor[.sadness]! + Double(jsonEmotion["sadness"] as? Double ?? 0)
                        self.humor[.fear] = self.humor[.fear]! + Double(jsonEmotion["fear"] as? Double ?? 0)
                        self.humor[.disgust] = self.humor[.disgust]! + Double(jsonEmotion["disgust"] as? Double ?? 0)
                        self.humor[.anger] = self.humor[.anger]! + Double(jsonEmotion["anger"] as? Double ?? 0)
                        print(self.humor[.joy]!)
                        print(self.humor[.sadness]!)
                        print(self.humor[.fear]!)
                        print(self.humor[.disgust]!)
                        print(self.humor[.anger]!)
                    }
                }
            }
        }
    }
    func addWord(json: [String: AnyObject]){
        print("aaa")
        let myWord = json["payload"] as? String ?? ""
            let myEnum = PalavrasChave(rawValue: myWord) ?? .other
            self.keys[myEnum] = self.keys[myEnum]! + 1
    }
    
}

class dadosDAO {
    
    static func getEmotions(callback: @escaping ((Dados) -> Void)) {
        
        let endpoint: String = "https://nodered-ami.mybluemix.net/getEmotions"
        
        guard let url = URL(string: endpoint) else {
            print("Cannot create Emotions URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let group = DispatchGroup()
        group.enter()
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
        
            DispatchQueue.global(qos: .default).async {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        let analise = Dados()
                        
                        for i in 0..<json.count{
                            analise.addEmotions(json: json[i])
                        }
                        callback(analise)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
                group.leave()
            }
            
            
        })
        task.resume()
        group.wait()
    }
    static func getWords (callback: @escaping ((Dados) -> Void)){
        let endpoint: String = "https://nodered-ami.mybluemix.net/getWords"
        
        guard let url = URL(string: endpoint) else {
            print("Cannot create Words URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let group = DispatchGroup()
        group.enter()
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.global(qos: .default).async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        let analise = Dados()
                        
                        for i in 0..<json.count{
                            analise.addWord(json: json[i])
                        }
                        callback (analise)
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
                group.leave()
            }
            
            
        })
        task.resume()
        group.wait()
    }
    
    
}
