//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by Kihun SONG on 2022/03/25.
//

import SwiftUI

struct LandmarkCommands: Commands {
	@FocusedBinding(\.selectedLandmark) var selectedLandmark
	
    var body: some Commands {
		SidebarCommands()
		
		CommandMenu("Landmark") {
			Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
				selectedLandmark?.isFavorite.toggle()
			}
			.keyboardShortcut("f", modifiers: [.shift, .option])
			.disabled(selectedLandmark == nil)
		}
	}
}

private struct SelectedLandmarkKey: FocusedValueKey {
	typealias Value = Binding<Landmark>
}

extension FocusedValues {
	var selectedLandmark: Binding<Landmark>? {
		get { self[SelectedLandmarkKey.self] }
		set { self[SelectedLandmarkKey.self] = newValue }
	}
}
