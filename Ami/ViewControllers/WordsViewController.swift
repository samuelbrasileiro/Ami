
import UIKit
import Charts
class WordsViewController: UIViewController {
    
    var sessao: Dados?
    @IBOutlet weak var graph: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sessao = sessaoGlobal
        
        if let mySessao = sessao{
            setupBarChart(sessao: mySessao)
        }
        graph.animate(yAxisDuration: 4)
        
    }
    func setupBarChart(sessao: Dados){
        
        graph.chartDescription?.enabled = false
        graph.drawBarShadowEnabled = true
        graph.drawValueAboveBarEnabled = true
        graph.backgroundColor = NSUIColor(red: 0, green: 0, blue: 0, alpha: 0)
        graph.isUserInteractionEnabled = false
        graph.backgroundColor = NSUIColor(red: 0, green: 0, blue: 0, alpha: 0)
        graph.xAxis.labelPosition = .bottom
        graph.xAxis.drawGridLinesEnabled = false
        graph.isExclusiveTouch = true
        
        graph.legend.enabled = true
        graph.xAxis.granularityEnabled = true
        graph.xAxis.granularity = 1.0 //default granularity is 1.0, but it is better to be explicit
        graph.xAxis.decimals = 0
        
         

        let leftAxis: YAxis? =  self.graph.leftAxis
        leftAxis?.removeAllLimitLines()

        leftAxis?.axisMaximum = 10.0
        leftAxis?.axisMinimum = 0.0

        leftAxis?.gridLineDashLengths = [5.0, 5.0]
        leftAxis?.drawZeroLineEnabled = false
        leftAxis?.drawLimitLinesBehindDataEnabled = true
         
        self.graph.rightAxis.enabled = false
        graph.viewPortHandler.setMaximumScaleX(5.0)
        
        
        
        var entries: [BarChartDataEntry] = Array()
        entries.append(BarChartDataEntry(x: 0, y: Double(sessao.keys[.Bem]!)))
        entries.append(BarChartDataEntry(x: 1, y: Double(sessao.keys[.Bullying]!)))
        entries.append(BarChartDataEntry(x: 2, y: Double(sessao.keys[.Desafios]!)))
        entries.append(BarChartDataEntry(x: 3, y: Double(sessao.keys[.Detalhes_dia_negativo]!)))
        entries.append(BarChartDataEntry(x: 4, y: Double(sessao.keys[.Detalhes_dia_positivo]!)))
        entries.append(BarChartDataEntry(x: 2, y: Double(sessao.keys[.palavrao]!)))
        entries.append(BarChartDataEntry(x: 3, y: Double(sessao.keys[.Saude_negativa]!)))
        
        
        let dataSet = BarChartDataSet(entries: entries, label: "Palavras-Chave")
        let c1 = NSUIColor(red: 51/255, green: 202/255, blue: 127/255, alpha: 1)
        let c2 = NSUIColor(red: 125/255, green: 207/255, blue: 182/255, alpha: 1)
        let c3 = NSUIColor(red: 251/255, green: 209/255, blue: 162/255, alpha: 1)
        let c4 = NSUIColor(red: 236/255, green: 228/255, blue: 183/255, alpha: 1)
        let c5 = NSUIColor(red: 252/255, green: 159/255, blue: 91/255, alpha: 1)
        let c6 = NSUIColor(hex: 0xACC6AA)
        let c7 = NSUIColor(hex: 0x71A0A5)
        dataSet.colors = [c1,c2,c3,c4,c5,c6,c7]
        dataSet.drawValuesEnabled = false
        
        
        graph.data = BarChartData(dataSet: dataSet)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
