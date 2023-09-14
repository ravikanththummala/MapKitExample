//
//  LocationDetailView.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/14/23.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    //MARK: Properties
    @EnvironmentObject private var vm: LocationViewModel
    let location:Location
    
    var body: some View {
        ScrollView {
            VStack{
                imageSection
                    .shadow(color: .black.opacity(0.3), radius: 10)
                
                VStack(alignment: .leading,spacing: 16){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                    
                }
                .frame(maxWidth: .infinity)
                .padding(8)
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

extension LocationDetailView {
    //MARK: Image section
    
    private var imageSection: some View {
        TabView{
            ForEach(location.imageNames,id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ?  nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
    }
    
    // MARK: Title
    
    private var titleSection: some View {
        
        VStack(alignment: .leading,spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
            
        }
    }
    
    // MARK: Description
    
    private var descriptionSection: some View {
        VStack(alignment: .leading,spacing: 8) {
            VStack(alignment: .leading,spacing: 8) {
                Text(location.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                if let url = URL(string: location.link){
                    Link("Read more on Wikipedia",destination: url)
                        .font(.headline)
                        .tint(.blue)
                }
            }
        }
    }
    // MARK: Map
    
    private var mapLayer: some View {
        
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: vm.locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                LocationMapAnnotionView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
        
    }
    
    // MARK: BAck Button
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(30)
                .shadow(radius: 4)
                .padding()
        }
    }

}

#Preview {
    LocationDetailView(location: LocationDataService.locations.first!)
        .environmentObject(LocationViewModel())
}
