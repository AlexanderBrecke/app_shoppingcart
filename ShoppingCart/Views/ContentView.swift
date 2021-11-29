//
//  ContentView.swift
//  ShoppingCart
//
//  Created by Alexander Brecke on 16/10/2021.
//

import SwiftUI

let dataService:DataService = DataService()


struct ContentView: View, IQuantityChange {
  
    
    
    @ObservedObject var viewModel = ProductsViewModel()
    
    func iChangeQuantity(item: Item, howMany: Int) {
        
        if let index = getIndex(item: item) {
            viewModel.changeItemQuantity(index: index, howMany: howMany)
        }

    }

    
    func getIndex(item:Item) -> Int?{
        
        if viewModel.cart != nil{
            for i in 0 ..< Int(viewModel.cart!.count) {
                if(viewModel.cart![i].product.id == item.product.id){
                    return i
                }
            }
        }
        
        return nil
        
    }
    
    
    var body: some View {
        
        
        ScrollView{
            ForEach(viewModel.cart ?? [], id: \.self.product.id){ item in
                
                ItemCardView(item:item, quantityChange: self)
                
            }
        }
//        List(viewModel.cart ?? [], id: \.self.product.id){ item in
//            ItemCardView(item: item, quantityChange: self)
//        }
//        .frame(maxWidth: .infinity)
//        .buttonStyle(BorderlessButtonStyle())
        
        
        
        if(viewModel.itemsInCart > 0){
            
            HStack{
                Image("cart")
                    .frame(width: 32.0, height: 32.0)
                VStack{
                    
                    Text("\(viewModel.itemsInCart) products")
                        .font(Font.custom("Rubik-Medium", size: 14.0))
                }
                
                VStack{
                    Text(String(format: "kr %.2f", viewModel.cartPrice))
                        .font(Font.custom("Rubik-Medium", size: 14.0)) 
                }
            }
            
        }
        
    }
    
}
