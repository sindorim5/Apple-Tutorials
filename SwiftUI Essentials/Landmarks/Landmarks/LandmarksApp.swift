//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Kihun SONG on 2022/03/14.
//

import SwiftUI

@main
struct LandmarksApp: App {
	@StateObject private var modelData = ModelData()

	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(modelData)
		}
	}
}
