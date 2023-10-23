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
                    TubeCell(tubeLine: tubeLine)
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
