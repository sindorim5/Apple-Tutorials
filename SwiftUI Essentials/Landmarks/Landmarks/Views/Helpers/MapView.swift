//
//  MapView.swift
//  Landmarks
//
//  Created by Kihun SONG on 2022/03/14.
//

import SwiftUI
import MapKit

struct MapView: View {
	var coordinate: CLLocationCoordinate2D
	@State private var region = MKCoordinateRegion()
	
    var body: some View {
        Map(coordinateRegion: $region)
			// calculates the coordinate when Map appears
			.onAppear {
				setRegion(coordinate)
			}
    }
	
	private func setRegion(_ coordinate: CLLocationCoordinate2D) {
		region = MKCoordinateRegion(
			center: coordinate,
			span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
		)
	}
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
		MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
