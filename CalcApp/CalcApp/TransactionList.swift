//
//  TransactionList.swift
//  My-Cash2.0
//
//  Created by Alikin Nikita Romanovich on 23.11.2022.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionsListVM : TransactionListViewModel
    var body: some View {
        VStack {
            List {
                // Transactions Group
                ForEach(Array(transactionsListVM.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    Section {
                        // Transaction List
                        ForEach(transactions) {transactions in
                            TransactionRow(transaction: transactions)
                        }
                    } header: {
                        // Transaction Month
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
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPriewData
        return transactionListVM
    }()
    static var previews: some View {
        NavigationView {
            TransactionList()
        }
        .environmentObject(transactionListVM)
    }
}
