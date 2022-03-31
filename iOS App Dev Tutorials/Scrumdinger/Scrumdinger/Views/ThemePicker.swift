//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Kihun SONG on 2022/03/28.
//

import SwiftUI

struct ThemePicker: View {
	@Binding var selection: Theme
	
    var body: some View {
		Picker("Theme", selection: $selection) {
			ForEach(Theme.allCases) { theme in
				ThemeView(theme: theme)
					.tag(theme)
			}
		}
	}
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
		ThemePicker(selection: .constant(.periwinkle))
    }
}
