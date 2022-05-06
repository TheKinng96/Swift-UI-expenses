//
//  TransactionListViewModel.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/04.
//

import Foundation
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

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
          self.transactions = transactions
        case .failure(let error):
          print("Failed to fetch data ", error.localizedDescription)
          break
      }
    }
  }
  
  func groupTransactionByMonth() -> TransactionGroup {
    guard !transactions.isEmpty else { return [:] }
    
    let groupTransaction = TransactionGroup(grouping: transactions) { $0.month }
    
    return groupTransaction
  }
}
