
import UIKit
import Charts
class EmotionsViewController: UIViewController {
    var sessao: Dados?
    var inMotion: Bool = false
    //@IBOutlet weak var graph: RSPizzaGraphView!
    @IBOutlet var graph: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sessao = sessaoGlobal
        
        if let mySessao = sessao{
           setupPieChart(sessao: mySessao)
        }
        graph.animate(yAxisDuration: 2)
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        inMotion = true
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        inMotion = false
    }
    
    func setupPieChart(sessao: Dados){
        
        graph.chartDescription?.enabled = false
        graph.drawHoleEnabled = true
        graph.rotationAngle = 270
        graph.holeColor = NSUIColor.white
        graph.rotationEnabled = true
        graph.isUserInteractionEnabled = true
        graph.isExclusiveTouch = true
        
        //graph.legend.enabled = false
        
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: sessao.humor[.joy]!, label: "Felicidade"))
        entries.append(PieChartDataEntry(value: sessao.humor[.sadness]!, label: "Tristeza"))
        entries.append(PieChartDataEntry(value: sessao.humor[.fear]!, label: "Medo"))
        entries.append(PieChartDataEntry(value: sessao.humor[.disgust]!, label: "Desprezo "))
        entries.append(PieChartDataEntry(value: sessao.humor[.anger]!, label: "Raiva"))
        let dataSet = PieChartDataSet(entries: entries, label: "")
        let c1 = NSUIColor(red: 51/255, green: 202/255, blue: 127/255, alpha: 1)
        let c2 = NSUIColor(red: 125/255, green: 207/255, blue: 182/255, alpha: 1)
        let c3 = NSUIColor(red: 251/255, green: 209/255, blue: 162/255, alpha: 1)
        let c4 = NSUIColor(red: 236/255, green: 228/255, blue: 183/255, alpha: 1)
        let c5 = NSUIColor(red: 252/255, green: 159/255, blue: 91/255, alpha: 1)
        dataSet.colors = [c1,c2,c3,c4,c5]
        dataSet.drawValuesEnabled = false
        graph.data = PieChartData(dataSet: dataSet)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
