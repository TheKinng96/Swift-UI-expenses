//
//  TransactionModel.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/02.
//

import Foundation

struct Transaction: Identifiable, Decodable {
  let id: Int
  let date: String
  let institution: String
  let account: String
  var merchant: String
  let amount: Double
  let type: TransactionType.RawValue
  var categoryId: Int
  var category: String
  let isPending: Bool
  var isTransfer: Bool
  var isExpense: Bool
  var isEdited: Bool
  
  var dateParsed: Date {
    date.dateParsed()
  }
  
  var signedAmount: Double {
    return type == TransactionType.credit.rawValue ? amount : -amount
  }
}
//import RealmSwift
//
//final class Transaction: Object, ObjectKeyIdentifiable, Codable {
//  @Persisted(primaryKey: true) var _id: ObjectId
//  @Persisted var date: String
//  @Persisted var institution: String
//  @Persisted var account: String
//  @Persisted var merchant: String
//  @Persisted var amount: Double
//  @Persisted var type: TransactionType.RawValue
//  @Persisted var categoryId: Int
//  @Persisted var category: String
//  @Persisted var isPending: Bool
//  @Persisted var isTransfer: Bool
//  @Persisted var isExpense: Bool
//  @Persisted var isEdited: Bool
//  @Persisted(originProperty: "transactions") var group: LinkingObjects<Transaction>
//
//  var dateParsed: Date {
//    date.dateParsed()
//  }
//
//  var signedAmount: Double {
//    return type == TransactionType.credit.rawValue ? amount : -amount
//  }
//
//  convenience init(date: String, institution: String, account: String, merchant: String, amount: Double, type: String, categoryId: Int, category: String, isPending: Bool, isTransfer: Bool, isExpense: Bool, isEdited: Bool) {
//    self.init()
//    self.date = date
//    self.institution = institution
//    self.account = account
//    self.merchant = merchant
//    self.amount = amount
//    self.type = type
//    self.categoryId = categoryId
//    self.category = category
//    self.isPending = isPending
//    self.isTransfer = isTransfer
//    self.isExpense = isExpense
//    self.isEdited = isEdited
//  }
//
//  static func previewData() -> Transaction {
//    Transaction(date: "01/24/2022", institution: "Apple", account: "Visa Apple", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
//  }
//}
//
enum TransactionType: String {
  case debit = "debit"
  case credit = "credit"
}
