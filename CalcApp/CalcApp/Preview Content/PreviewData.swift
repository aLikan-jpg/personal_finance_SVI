import Foundation

var transactionPreviewData = Transaction(id: 1, date: "18/11/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
var transactionListPriewData = [Transaction](repeating: transactionPreviewData, count: 10)
