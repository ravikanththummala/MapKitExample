//
//  LocationListView.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/14/23.
//

import SwiftUI

struct LocationListView: View {
    // MARK: Properties
    @EnvironmentObject private var vm: LocationViewModel
    // MARK: Body
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical,4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationViewModel())
}

extension LocationListView {
    // MARK: List row view
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50,height: 50)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }

}
