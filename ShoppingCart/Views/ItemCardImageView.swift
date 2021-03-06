//
//  ItemCardImageView.swift
//  ShoppingCart
//
//  Created by Alexander Brecke on 10/12/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

// View to show the thumbnail image of a specified item
// If the image is pressed show a sheet that shows the picture in full size
struct ItemCardImageView: View{
    
    let item:Item
    @State var showSheet:Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            WebImage(url:URL(string: item.product.images[0].thumbnail.url))
                .resizable()
                .scaledToFit()
                .frame(width: 56.0, height: 56.0)
                .onTapGesture {
                    showSheet = true
                }
            if item.product.discount != nil {
                SaleView()
            }
             
        }
        .sheet(isPresented: $showSheet, content: {
            WebImage(url:URL(string: item.product.images[0].thumbnail.url))
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    showSheet = false
                }
        })
    }
    
}
