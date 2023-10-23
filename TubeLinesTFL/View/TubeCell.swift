//
//  TubeCell.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 23/10/2023.
//

import SwiftUI

struct TubeCell: View {
    
    var tubeLine: TubeLineModel
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(Color.getColor(tubeLineName: tubeLine.id))
                .frame(width: 10)
            Text(tubeLine.name)
                .font(.headline)
                .accessibilityLabel(Text("This is a Tube Line name called as \(tubeLine.name)"))
                .accessibilityAddTraits(.isStaticText)
            Spacer()
            Text(tubeLine.lineStatuses.first?.statusSeverityDescription ?? "")
                .foregroundColor(.gray)
                .accessibilityLabel(Text("This is a Tube Line status which is \(tubeLine.lineStatuses.first?.statusSeverityDescription ?? "")"))
                .accessibilityAddTraits(.isStaticText)
        }
        .frame(maxWidth: .infinity)
        .frame(height: getRect().height/14)
    }
}

struct TubeCell_Previews: PreviewProvider {
    static var previews: some View {
        TubeCell(tubeLine: TubeLineModel(type: "", id: "test", name: "", modeName: ModeName.tube, disruptions: [], created: ModifiedEnum.the20231018T155614407Z, modified: ModifiedEnum.the20231018T155614407Z, lineStatuses: [], routeSections: [], serviceTypes: [], crowding: Crowding(type: "")))
    }
}
