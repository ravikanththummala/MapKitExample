//
//  LocationDataService.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/13/23.
//

import Foundation
import MapKit
import CoreLocation

class LocationDataService {
    
    static let locations: [Location] = [
    
        Location(name: "Colosseum",
                 cityName: "Rome",
                 coordinate: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
                 description: "The Colosseum in Rome, Italy, is a large amphitheater that hosted events like gladiatorial games. Design Pics Inc. The Colosseum, also named the Flavian Amphitheater, is a large amphitheater in Rome. It was built during the reign of the Flavian emperors as a gift to the Roman people",
                 imageNames: [
                 "rome-colosseum-1",
                 "rome-colosseum-2",
                 "rome-colosseum-3"],
                 link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(name: "Pantheon",
                 cityName: "Rome",
                 coordinate: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
                 description: "The Pantheon is a former Roman temple and, since 609 AD, a Catholic church in Rome, Italy. It was built on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus, then after that burnt down, the present building was ordered by the emperor Hadrian and probably dedicated c.",
                 imageNames: [
                 "rome-pantheon-1",
                 "rome-pantheon-2",
                 "rome-pantheon-3"],
                 link: "https://en.wikipedia.org/wiki/Pantheon"),
        Location(name: "Trevi Fountain",
                 cityName: "Rome",
                 coordinate: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
                 description: "The Trevi Fountain is an 18th-century fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini in 1762 and several others.",
                 imageNames: [
                 "rome-trevifountain-1",
                 "rome-trevifountain-2",
                 "rome-trevifountain-3"],
                 link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(name: "Eiffel Tower",
                 cityName: "Paris",
                 coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
                 description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. Constructed from 1887, it is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed  it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair.",
                 imageNames: [
                 "paris-eiffeltower-1",
                 "paris-eiffeltower-2"],
                 link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(name: "Louvre Museum",
                 cityName: "Paris",
                 coordinate: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
                 description: "The Louvre, or the Louvre Museum, is a national art museum in Paris, France. It is located on the Right Bank of the Seine in the city's 1st arrondissement and home to some of the most canonical works of Western art, including the Mona Lisa and the Venus de Milo.",
                 imageNames: [
                 "paris-louvremuseum-1",
                 "paris-louvremuseum-2",
                 "paris-louvremuseum-3"],
                 link: "https://en.wikipedia.org/wiki/Louvre")
    ]
}
