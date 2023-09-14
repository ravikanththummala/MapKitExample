//
//  LocationPreviewView.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/14/23.
//

import SwiftUI

struct LocationPreviewView: View {
    // MARK: Properties
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    var body: some View {
        HStack(alignment: .bottom){
            
            VStack(alignment: .leading,spacing: 16) {
                imageSection
                titleSection
                
            }
            VStack(spacing: 8){
                learnMoreButto
                
                HStack(spacing: 5){
                    nextButton
                    prevButton
                }
            }
        }
        .padding(20)
        .background(
        
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
        
        
            
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
        
    }
    
    // MARK: Title section
    private  var titleSection: some View {
        VStack(alignment: .leading,spacing: 4, content: {
            Text(location.name)
                .font(.title2.bold())
            Text(location.cityName)
                .font(.subheadline)

        })
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    // MARK: Learn More button
    
    private var learnMoreButto: some View {
        Button{
            vm.sheetLocation = location
        }label: {
            Text("Learn More")
                .frame(width: 125,height: 35)
        }
        .buttonStyle(.borderedProminent)
    }

    // MARK: Next button

    private var nextButton: some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .frame(width: 50,height: 35)
        })
        .buttonStyle(.bordered)
    }

    private var prevButton: some View {
        Button(action: {
            vm.previousButtonPressed()
        }, label: {
            Text("Prev")
                .frame(width: 50,height: 35)
        })
        .buttonStyle(.bordered)
    }

}
#Preview {
    ZStack{
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationDataService.locations.first!)
            .padding()
    }
}
