//
//  ContentView.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/02.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
      NavigationView {
        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            // MARK: - Title
            Text("Overview", comment: "testing")
              .font(.title)
              .bold()
            
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
