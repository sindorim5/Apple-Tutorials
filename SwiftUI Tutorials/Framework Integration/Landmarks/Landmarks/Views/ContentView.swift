//
//  ContentView.swift
//  Landmarks
//
//  Created by Kihun SONG on 2022/03/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		LandmarkList()
			.stackNavigationViewStyleOnIpad()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(["iPhone SE (2nd generation)", "iPhone 13 Pro Max", "iPad Pro (12.9-inch) (5th generation)"], id: \.self) { deviceName in
			ContentView()
				.environmentObject(ModelData())
				.previewDevice(PreviewDevice(rawValue: deviceName))
				.previewDisplayName(deviceName)
		}
	}
}



