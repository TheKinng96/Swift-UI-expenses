//
//  Extensions.swift
//  expenses
//
//  Created by Feng Yuan Yap on 2022/05/02.
//

import Foundation
import SwiftUI

extension Color {
  static let background = Color("Background")
  static let icon = Color("Icon")
  static let text = Color("Text")
  static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
  static let allNumericUS: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    
    return formatter
  }()
}

extension String {
  func dateParsed() -> Date {
    guard let parsedDate = DateFormatter.allNumericUS.date(from: self) else {return Date()}
    return parsedDate
  }
}

extension URLSession {
  func fetchData<T: Decodable>(at url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let object = try JSONDecoder().decode(T.self, from: data)
          completion(.success(object))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}
