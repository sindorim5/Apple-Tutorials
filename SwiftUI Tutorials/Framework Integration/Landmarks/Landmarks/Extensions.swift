//
//  Extensions.swift
//  Landmarks
//
//  Created by Kihun SONG on 2022/03/15.
//

import Foundation
import SwiftUI

extension View {
	@ViewBuilder
	func stackNavigationViewStyleOnIpad() -> some View {
		if UIDevice.current.userInterfaceIdiom == .pad {
			self.navigationViewStyle(StackNavigationViewStyle())
		} else {
			self
		}
	}
}
