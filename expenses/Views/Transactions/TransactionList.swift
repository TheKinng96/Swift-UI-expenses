//
//  TransactionList.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/06.
//

import SwiftUI

struct TransactionList: View {
  @EnvironmentObject var transactionList: TransactionListViewModel
  
  var body: some View {
    VStack {
      List {
        ForEach(Array(transactionList.groupTransactionByMonth()), id: \.key) { month, transactions in
          Section {
            ForEach(transactions) { transaction in
              TransactionRow(transaction: transaction)
            }
          } header: {
            Text(month)
          }
          .listSectionSeparator(.hidden)
        }
      }
      .listStyle(.plain)
    }
    .navigationTitle("Transactions")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct TransactionList_Previews: PreviewProvider {
  static let transactionList: TransactionListViewModel = {
    let transactionList = TransactionListViewModel()
    transactionList.transactions = transactionListPreviewData
    return transactionList
  }()
  
  static var previews: some View {
    Group {
      NavigationView {
        TransactionList()
      }
      NavigationView {
        TransactionList()
      }
      .preferredColorScheme(.dark)
    }
    .environmentObject(transactionList)
  }
}
