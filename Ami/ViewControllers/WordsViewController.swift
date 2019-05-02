
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
        
        graph.isUserInteractionEnabled = false
        graph.backgroundColor = NSUIColor.white
        
        //graph.setXAxisMinWidth(XAxis.AxisDependency.left, width: 0)
        graph.isExclusiveTouch = true
        
        graph.legend.enabled = true
        
        // x-axis limit line
        
        let llXAxis = ChartLimitLine(limit: 10.0, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [(10.0), (10.0), (0.0)]
        llXAxis.labelPosition = ChartLimitLine.LabelPosition.bottomRight
        llXAxis.valueFont = UIFont.systemFont(ofSize: 10.0)
        
         //[_chartView.xAxis addLimitLine:llXAxis];
         
        self.graph.xAxis.gridLineDashLengths = [10.0, 10.0]
        self.graph.xAxis.gridLineDashPhase = 0.0
         
         
        let ll1 = ChartLimitLine(limit: 11.0, label: "Upper Limit")
        ll1.lineWidth = 4.0
        ll1.lineDashLengths = [5.0, 5.0]
        ll1.labelPosition = ChartLimitLine.LabelPosition.topRight //ChartLimitLabelPositionRightTop
        ll1.valueFont = UIFont.systemFont(ofSize: 10.0)
         
        let ll2 = ChartLimitLine(limit: -1.0, label: "Lower Limit")
        ll2.lineWidth = 5.0
        ll2.lineDashLengths = [5.0, 5.0]
        ll2.labelPosition = ChartLimitLine.LabelPosition.bottomRight//ChartLimitLabelPositionRightBottom
        ll2.valueFont = UIFont.systemFont(ofSize: 10.0)
         
        let leftAxis: YAxis? =  self.graph.leftAxis
        leftAxis?.removeAllLimitLines()
         
        leftAxis?.addLimitLine(ll1)
        leftAxis?.addLimitLine(ll2)

        leftAxis?.axisMaximum = 10.0
        leftAxis?.axisMinimum = 0.0

        leftAxis?.gridLineDashLengths = [5.0, 5.0]
        leftAxis?.drawZeroLineEnabled = false
        leftAxis?.drawLimitLinesBehindDataEnabled = true
         
        self.graph.rightAxis.enabled = false
        graph.viewPortHandler.setMaximumScaleX(5.0)
         //[_chartView.viewPortHandler setMaximumScaleY: 2.f];
         //[_chartView.viewPortHandler setMaximumScaleX: 2.f];
 
        
        
        var entries: [BarChartDataEntry] = Array()
        entries.append(BarChartDataEntry(x: 0, y: Double(sessao.keys[.Bem]!)))
        entries.append(BarChartDataEntry(x: 1, y: Double(sessao.keys[.Bullying]!)))
        entries.append(BarChartDataEntry(x: 2, y: Double(sessao.keys[.Desafios]!)))
        entries.append(BarChartDataEntry(x: 3, y: Double(sessao.keys[.Detalhes_dia_negativo]!)))
        entries.append(BarChartDataEntry(x: 4, y: Double(sessao.keys[.Detalhes_dia_positivo]!)))
        
        
        let dataSet = BarChartDataSet(entries: entries, label: "Palavras-Chave")
        let c1 = NSUIColor(red: 51/255, green: 202/255, blue: 127/255, alpha: 1)
        let c2 = NSUIColor(red: 125/255, green: 207/255, blue: 182/255, alpha: 1)
        let c3 = NSUIColor(red: 251/255, green: 209/255, blue: 162/255, alpha: 1)
        let c4 = NSUIColor(red: 236/255, green: 228/255, blue: 183/255, alpha: 1)
        let c5 = NSUIColor(red: 252/255, green: 159/255, blue: 91/255, alpha: 1)
        dataSet.colors = [c1,c2,c3,c4,c5]
        dataSet.drawValuesEnabled = false
        
        dataSet.stackLabels = ["Bem", "Bullying", "Desafios", "dn", "dp"]
    
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
