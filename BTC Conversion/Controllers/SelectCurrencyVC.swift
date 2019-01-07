//
//  SelectLanguageVC.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import UIKit
import Foundation
import MBProgressHUD

class SelectCurrencyVC: UIViewController {

    private var currencyList = [Currency]()
    private var filteredCurrencyList = [Currency]()
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currencyTableView: UITableView!
    @IBOutlet weak var currencySearchBar: UISearchBar!
    
    
    // MARK: - Properties
    var selectedCurrency:Currency?
    var conversion:Conversion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        populateCurrencyList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == conversionDetailSegue {
            let conversionDetailVC = segue.destination as! ConversionDetailsVC
            conversionDetailVC.conversion = self.conversion
            conversionDetailVC.currency = self.selectedCurrency
        }
    }
    
    // MARK: - Methods
    private func dismissKeyboard() {
        if self.currencySearchBar.isFirstResponder{
            self.currencySearchBar.resignFirstResponder()
        }
    }
    
    private func configureViews(){
        titleLabel.text = "Hello\n\n\(dataManager.getUserName())"
    }
    
    private func populateCurrencyList(){
        let locale = NSLocale.current
        for code in NSLocale.isoCurrencyCodes{
            if let currencyName = locale.localizedString(forCurrencyCode: code){
                if !currencyName.contains("("){currencyList.append(Currency(name: currencyName, code: code))}
            }
        }
        self.filteredCurrencyList = currencyList
    }
    
    private func filterCurrencies(searchStr:String){
        self.filteredCurrencyList = currencyList.filter({ (currency) -> Bool in
            return currency.name.contains(searchStr) || currency.code.contains(searchStr)
        })
        self.currencyTableView.reloadData()
    }
    
    private func performConversion(selectedCurrency:Currency){
        
        let hud = ProgressHud.showHUDAddedTo(view)
        selectedCurrency.btcValue(success: {[weak self] (conversion) in
            hud.hide()
            guard let weakSelf = self else{return}
            
            weakSelf.conversion = conversion
            weakSelf.performSegue(withIdentifier: conversionDetailSegue, sender: self)
        }) { [weak self] (error) in
            hud.hide()
            guard let weakSelf = self else{return}
            _ = weakSelf.showAlert("Conversion Not Found", message: "Conversion for the selected currency is not available.", buttonsDictionary: [ "OK": {(alertAction) in
                // Can perform any tasks here upon OK if needed
                }], baseController: self, preferredStyle: .alert)
        }
        dismissKeyboard()
    }
}

// MARK: - UITableViewDelegates
extension SelectCurrencyVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCurrencyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)
        cell.textLabel?.text = filteredCurrencyList[indexPath.row].name
        cell.detailTextLabel?.text = filteredCurrencyList[indexPath.row].code
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCurrency = filteredCurrencyList[indexPath.row]
        self.selectedCurrency = selectedCurrency
        performConversion(selectedCurrency: selectedCurrency)
    }
}


// MARK: - UISearchBarDelegate
extension SelectCurrencyVC:UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchQuery = searchBar.text else {return}
        if searchQuery.isEmpty{
            self.filteredCurrencyList = self.currencyList
            self.currencyTableView.reloadData()
        }else{
            self.filterCurrencies(searchStr: searchText)
        }
    }
}
