//
//  TransactionListViewModel.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/04.
//

import Foundation
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

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
  
  func accumulateTransactions() -> TransactionPrefixSum {
    print ("accumulateTransactions")
    guard !transactions.isEmpty else { return [] }
    
    let today = "02/17/2022".dateParsed() // Date()
    let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
    print("dateInterval", dateInterval)
    
    var sum: Double = .zero
    var cumulativeSum = TransactionPrefixSum()
    
    for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
      let dailyExpenses = transactions.filter { $0.dateParsed == date && $0.isExpense }
      let dailyTotal = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
      
      sum += dailyTotal
      cumulativeSum.append((date.formatted(), sum))
      print(date.formatted(), "dailvTotal:", dailyTotal, "sum:", sum)
    }
    
    return cumulativeSum
  }
}
