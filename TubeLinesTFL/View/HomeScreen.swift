//
//  HomeScreen.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 20/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel = HomeScreenViewModel(apiService: APIService())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tubeLines, id:\.self) { tubeLine in
                    HStack {
                        Rectangle()
                            .foregroundColor(Color.getColor(tubeLineName: tubeLine.id))
                            .frame(width: 10)
                        Text(tubeLine.id.capitalized)
                            .font(.headline)
                        Spacer()
                        Text(tubeLine.lineStatuses[0].statusSeverityDescription)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: getRect().height/14)
                }
            }
            .listStyle(.grouped)
            .navigationBarTitle("TFL Tube Lines")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
