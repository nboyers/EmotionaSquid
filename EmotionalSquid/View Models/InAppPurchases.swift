//
//  InAppPurchases.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 3/22/22.
//
import StoreKit
import SwiftUI

class InAppPurchases: UIViewController, ObservableObject  {
    
    @Published var products: [Product] = []
    @Published var purchasedID: [String] = []
    var squid = [
        SquidModel(imageName: "HappySquid", color: "red",productID: "com.temporary.id.HappySquid"),
        SquidModel(imageName: "AngrySquid", color: "green", productID:  "com.temporary.id.AngrySquid"),
        SquidModel(imageName: "KingSquid", color: "blue", productID:  "com.temporary.id.KingSquid"),
    ]
    
    
    func fetchProducts() {
        Task {
            do {
                let products = try await Product.products(for: [
                    // LOOKING FOR STRINGS

                    "com.temporary.id.HappySquid",
                    "com.temporary.id.AngrySquid",
                    "com.temporary.id.KingSquid"
                ])
                
                DispatchQueue.main.async {
                    self.products = products
                }
                
                if let product = products.first {
                    await isPurchased(product: product)
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    public func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func isPurchased(product: Product) async {
        guard let state = await product.currentEntitlement else {
            return
        }
        
        switch state {
        case .verified(let transaction):
            DispatchQueue.main.async {
                self.purchasedID.append(transaction.productID)
            }
        case .unverified(_, _):
            break
        }
    }
    
    func purchase() {
        Task {
            guard let product = products.first else { return }
            
            do {
                let result = try await product.purchase()
                
                switch result {
                    
                case .success(let varification):
                    
                    switch varification {
                    case .verified(let transaction):
                        DispatchQueue.main.async {
                            self.purchasedID.append(transaction.productID)
                        }
                        //Always finish a transaction.
                        await transaction.finish()
                        break
                        
                    case .unverified:
                        return
                    }
                case .userCancelled, .pending:
                    break
                @unknown default:
                    break
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}





