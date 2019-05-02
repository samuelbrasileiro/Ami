//
//  ConversaTableViewController.swift
//  AmiProject
//
//  Created by student on 27/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class HistoricoTableViewController: UITableViewController {
    
    var conversas = [Dados]()
    var exportConversa:Dados?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conversas.append(sessaoGlobal)
        conversas.append(Dados(
            humores: [
                .joy : 0, .sadness : 0, .fear : 0, .anger : 0, .disgust : 0
            ],
            chaves: [
                .Bem : 0, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 0, .Detalhes_dia_positivo : 0, .palavrao : 0, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 6, .sadness : 2, .fear : 2, .anger : 4, .disgust : 1
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 1, .Detalhes_dia_positivo : 4, .palavrao : 3, .Saude_negativa : 1
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 2, .sadness : 4, .fear : 4, .anger : 2, .disgust : 3
            ],
            chaves: [
                .Bem : 2, .Bullying : 2, .Desafios : 0, .Detalhes_dia_negativo : 3, .Detalhes_dia_positivo : 1, .palavrao : 0, .Saude_negativa : 1
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 5, .sadness : 1, .fear : 3, .anger : 2, .disgust : 1
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 1, .Detalhes_dia_negativo : 0, .Detalhes_dia_positivo : 2, .palavrao : 1, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 2, .sadness : 5, .fear : 3, .anger : 1, .disgust : 2
            ],
            chaves: [
                .Bem : 0, .Bullying : 4, .Desafios : 0, .Detalhes_dia_negativo : 2, .Detalhes_dia_positivo : 1, .palavrao : 0, .Saude_negativa : 2
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 3, .sadness : 2.5, .fear : 1, .anger : 1, .disgust : 0.5
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 2, .Detalhes_dia_positivo : 1, .palavrao : 0, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 1, .sadness : 2, .fear : 4, .anger : 2, .disgust : 1
            ],
            chaves: [
                .Bem : 1, .Bullying : 3, .Desafios : 1, .Detalhes_dia_negativo : 2, .Detalhes_dia_positivo : 0, .palavrao : 1, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 5, .sadness : 1, .fear : 0.3, .anger : 1, .disgust : 2
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 0, .Detalhes_dia_positivo : 5, .palavrao : 0, .Saude_negativa : 2
            ]))
        conversas.append(Dados(
            humores: [
                .joy : 3, .sadness : 2, .fear : 3, .anger : 6, .disgust : 2.5
            ],
            chaves: [
                .Bem : 2, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 3, .Detalhes_dia_positivo : 1, .palavrao : 4, .Saude_negativa : 3
            ]))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return conversas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HistoricoTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoricoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let conversa = conversas[indexPath.row]
        cell.data.text = String(conversa.humor[.disgust]!)
        //cell.
        // Configure the cell...
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        exportConversa = conversas[indexPath.row]
//        performSegue(withIdentifier: "conversaDetalhes", sender: self)
//    }
    
 

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("haha1")
        if segue.identifier == "conversaDetalhes"{
            
            
            print("haha")
            if let _ = segue.destination as? HistoricoPageViewController {
                
//                vc.conversa = exportConversa
                
                let selectCell = tableView.indexPathForSelectedRow?.row
                let conversa = conversas[selectCell!]
                
                sessaoGlobal = conversa
                
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    
}
