//
//  TransactionListViewModel.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/04.
//

import Foundation

final class TransactionListViewModel: ObservableObject {
  @Published var transactions: [Transaction] = []
  
  init() {
    getTransactions()
  }
  
  // Initialise the transaction
  func getTransactions() {
    let url = URL(string: "https://designcode.io/data/transactions.json")!
    URLSession.shared.fetchData(at: url) { (result: Result<[Transaction], Error>) in
        switch result {
        case .success(let transactions):
          dump(transactions)
        case .failure(let error):
          print("Failed to fetch data ", error.localizedDescription)
          break
      }
    }
  }
}
