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
        //as seguintes conversas servem para simular sessoes antigas
        setOlderPlacebo()
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        cell.data.text = String(conversa.data)
        cell.sessaoID.text = String(conversas.count - indexPath.row)
        var image: String
        switch indexPath.row % 3 {
        case 0:
            image = "amiLightGrey"
        case 1:
            image = "amiBlue"
        default:
            image = "amiBlack"
        }
        cell.amiImage.image = UIImage(named: image)
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("hihi")
            conversas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "conversaDetalhes"{
            
            if let _ = segue.destination as? HistoricoPageViewController {
                
                let selectCell = tableView.indexPathForSelectedRow?.row
                let conversa = conversas[selectCell!]
                
                sessaoGlobal = conversa
                
            }
        }
    }
    
    
    func setOlderPlacebo(){
        conversas.append(Dados(
            data: "03/05/2019",
            humores: [
                .joy : 2, .sadness : 3, .fear : 2, .anger : 1, .disgust : 1
            ],
            chaves: [
                .Bem : 0, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 4, .Detalhes_dia_positivo : 3, .palavrao : 0, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            data: "02/05/2019",
            humores: [
                .joy : 6, .sadness : 2, .fear : 2, .anger : 4, .disgust : 1
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 1, .Detalhes_dia_positivo : 4, .palavrao : 3, .Saude_negativa : 1
            ]))
        conversas.append(Dados(
            data: "01/05/2019",
            humores: [
                .joy : 2, .sadness : 4, .fear : 4, .anger : 2, .disgust : 3
            ],
            chaves: [
                .Bem : 2, .Bullying : 2, .Desafios : 0, .Detalhes_dia_negativo : 3, .Detalhes_dia_positivo : 1, .palavrao : 0, .Saude_negativa : 1
            ]))
        conversas.append(Dados(
            data: "01/05/2019",
            humores: [
                .joy : 5, .sadness : 1, .fear : 3, .anger : 2, .disgust : 1
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 1, .Detalhes_dia_negativo : 0, .Detalhes_dia_positivo : 2, .palavrao : 1, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            data: "30/04/2019",
            humores: [
                .joy : 2, .sadness : 5, .fear : 3, .anger : 1, .disgust : 2
            ],
            chaves: [
                .Bem : 0, .Bullying : 4, .Desafios : 0, .Detalhes_dia_negativo : 2, .Detalhes_dia_positivo : 1, .palavrao : 0, .Saude_negativa : 2
            ]))
        conversas.append(Dados(
            data: "28/04/2019",
            humores: [
                .joy : 3, .sadness : 2.5, .fear : 1, .anger : 1, .disgust : 0.5
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 2, .Detalhes_dia_positivo : 1, .palavrao : 0, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            data: "28/04/2019",
            humores: [
                .joy : 1, .sadness : 2, .fear : 4, .anger : 2, .disgust : 1
            ],
            chaves: [
                .Bem : 1, .Bullying : 3, .Desafios : 1, .Detalhes_dia_negativo : 2, .Detalhes_dia_positivo : 0, .palavrao : 1, .Saude_negativa : 0
            ]))
        conversas.append(Dados(
            data: "27/04/2019",
            humores: [
                .joy : 5, .sadness : 1, .fear : 0.3, .anger : 1, .disgust : 2
            ],
            chaves: [
                .Bem : 4, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 0, .Detalhes_dia_positivo : 5, .palavrao : 0, .Saude_negativa : 2
            ]))
        conversas.append(Dados(
            data: "26/04/2019",
            humores: [
                .joy : 3, .sadness : 2, .fear : 3, .anger : 6, .disgust : 2.5
            ],
            chaves: [
                .Bem : 2, .Bullying : 0, .Desafios : 0, .Detalhes_dia_negativo : 3, .Detalhes_dia_positivo : 1, .palavrao : 4, .Saude_negativa : 3
            ]))
    }
    
}
