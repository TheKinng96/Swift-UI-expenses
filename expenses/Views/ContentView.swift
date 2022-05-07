//
//  ContentView.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/02.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
  @EnvironmentObject var transactionList: TransactionListViewModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          // MARK: - Title
          Text("Overview", comment: "testing")
            .font(.title)
            .bold()
          
          let data = transactionList.accumulateTransactions()
          
          if !data.isEmpty {
            let totalExpenses = data.last?.1 ?? 0
            CardView {
              VStack(alignment: .leading){
                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                LineChart()
              }
              .background(Color.systemBackground)
            }
            .data(data)
            .chartStyle(ChartStyle(
              backgroundColor: Color.systemBackground,
              foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
            .frame(height: 300)
          }
          
          TransactionBlock()
        }
        .padding()
        .frame(maxWidth: .infinity)
      }
      .background(Color.background)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem {
          Image(systemName: "bell.badge")
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.icon, .primary)
        }
      }
    }
    .navigationViewStyle(.stack)
    .accentColor(.primary)
  }
}

struct ContentView_Previews: PreviewProvider {
  static let transactionList: TransactionListViewModel = {
    let transactionList = TransactionListViewModel()
    transactionList.transactions = transactionListPreviewData
    return transactionList
  }()
  
  static var previews: some View {
    Group {
      ContentView()
      ContentView()
        .preferredColorScheme(.dark)
    }
    .environmentObject(transactionList)
  }
}
