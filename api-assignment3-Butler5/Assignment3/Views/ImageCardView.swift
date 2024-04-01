//
//  ImageCardView.swift
//  Assignment3
//
//  Created by Adam Butler on 3/30/24.
//

import SwiftUI

struct ImageCardView: View {
    var url : String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 150, height: 150)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 150, height: 150)
    }
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(url: "https://www.nps.gov/common/uploads/structured_data/3C861078-1DD8-B71B-0B774A242EF6A706.jpg")
    }
}
