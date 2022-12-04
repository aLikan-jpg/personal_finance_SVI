//
//  RecentTransaction.swift
//  My-Cash2.0
//
//  Created by Alikin Nikita Romanovich on 22.11.2022.
//

import SwiftUI

struct RecentTransaction: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack{
                //Header title
                Text("Recent Transaction")
                    .bold()
                
                Spacer()
                
                // Header Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack (spacing: 4) {
                    Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            // Recent Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id : \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.background)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransaction_Previews: PreviewProvider {
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPriewData
        return transactionListVM
    }()
    static var previews: some View {
        RecentTransaction()
            .environmentObject(transactionListVM)
    }
}
