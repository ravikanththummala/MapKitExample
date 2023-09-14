//
//  LocationView.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/13/23.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var vm: LocationViewModel
    let maxWidthForIpad : CGFloat =  700
    
    // MARK: Body
    var body: some View {
        ZStack{
            mapLayer
                .ignoresSafeArea()
            
            VStack{
                // Header sction
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                
                Spacer()
                
                locationPreviewStack
                
            }

        }
        // Sheet for location details
        
        .sheet(item: $vm.sheetLocation) { location in
            LocationDetailView(location: location)
        }
    }
}


extension LocationView{
    //MARK: Map Layer
    
    
    private var mapLayer: some View{
        
        
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations){ location in
            MapAnnotation(coordinate: location.coordinate) {
                LocationMapAnnotionView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
    }
    
  // MARK: Header
    private var header: some View {
        VStack{
            Button(action:vm.toggleLocationList){
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none,value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(.degrees(vm.showLocationList ? 180 : 0))
                    }

            }
            
            // Show locations list if enabled
            if vm.showLocationList{
                LocationListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3) ,radius: 20,x: 0,y: 15)
    }
    
    // MARK: Locatiob Previews
    private var  locationPreviewStack: some View{
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.2), radius: 10)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
                
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
