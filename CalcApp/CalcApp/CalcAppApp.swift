//
//  My_Cash2_0App.swift
//  My-Cash2.0
//
//  Created by Alikin Nikita Romanovich on 21.11.2022.
//

import SwiftUI

@main
struct My_Cash2_0App: App {
   @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
