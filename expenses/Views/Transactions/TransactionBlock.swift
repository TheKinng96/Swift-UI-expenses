//
//  TransactionBlock.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/04.
//

import SwiftUI

struct TransactionBlock: View {
  @EnvironmentObject var transactionList: TransactionListViewModel
  
  var body: some View {
    VStack {
      HStack {
        Text("Recent Transactions")
          .bold()
        
        Spacer()
        
        NavigationLink {
          
        } label: {
          HStack{
            Text("See more")
            Image(systemName: "chevron.right")
          }
          .foregroundColor(Color.text)
        }
      }
      .padding(.top)
      
      ForEach(Array(transactionList.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
        TransactionRow(transaction: transaction)
        
        Divider()
          .opacity(index == 4 ? 0 : 1)
      }
    }
    .padding()
    .background(Color.systemBackground)
    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
  }
}

struct TransactionBlock_Previews: PreviewProvider {
  static let transactionList: TransactionListViewModel = {
    let transactionList = TransactionListViewModel()
    transactionList.transactions = transactionListPreviewData
    return transactionList
  }()
  
  static var previews: some View {
    Group {
      TransactionBlock()
      TransactionBlock()
        .preferredColorScheme(.dark)
    }
    .environmentObject(transactionList)
  }
}
