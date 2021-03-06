//
//  expensesApp.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/02.
//

import SwiftUI

@main
struct expensesApp: App {
  @StateObject var transactionsList = TransactionListViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(transactionsList)
    }
  }
}
