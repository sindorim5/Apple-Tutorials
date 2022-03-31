//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Kihun SONG on 2022/03/26.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
	func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.title
			configuration.icon
		}
	}
}

extension LabelStyle where Self == TrailingIconLabelStyle {
	static var trailingIcon: Self { Self() }
}

//struct TrailingIconLabelStyle_Previews: PreviewProvider {
//    static var previews: some View {
//		TrailingIconLabelStyle()
//    }
//}
