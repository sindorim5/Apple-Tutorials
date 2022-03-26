//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Kihun SONG on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		LandmarkList()
			.frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(ModelData())
    }
}
