//
//  TransactionRow.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/03.
//

import SwiftUI

struct TransactionRow: View {
  var transaction: Transaction
  
  var body: some View {
    HStack(spacing: 20) {
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(Color.icon.opacity(0.3))
        .frame(width: 44, height: 44)
        .overlay {
          Image(systemName: "wallet.pass.fill")
            .frame(width: 24, height: 24)
            .foregroundColor(Color.icon)
        }
      
      VStack(alignment: .leading, spacing: 6) {
        Text(transaction.merchant)
          .font(.subheadline)
          .bold()
          .lineLimit(1)
        
        Text(transaction.category)
          .font(.caption)
          .opacity(0.7)
          .lineLimit(1)
        
        Text(transaction.dateParsed, format: .dateTime.year().month().day())
          .font(.footnote)
          .foregroundColor(.secondary)
      }
      
      Spacer()
      
      Text(transaction.signedAmount, format: .currency(code: "USD"))
        .bold()
        .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
    }
    .padding([.top, .bottom], 8)
  }
}

struct TransactionRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TransactionRow(transaction: transactionPreviewData)
      TransactionRow(transaction: transactionPreviewData)
        .preferredColorScheme(.dark)
    }
  }
}
