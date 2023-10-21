//
//  HomeScreen.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 20/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel = HomeScreenViewModel()
    
    var body: some View {
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
                        .frame(height: getRect().height/16)
                    }
                }
                .listStyle(.grouped)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
