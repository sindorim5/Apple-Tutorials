//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Kihun SONG on 2022/04/01.
//

import SwiftUI

struct SpeakerArc: Shape {
	let speakerIndex: Int
	let totalSpeakers: Int
	
	private var degreesPerSpeaker: Double {
		360.0 / Double(totalSpeakers)
	}
	private var startAngel: Angle {
		Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
	}
	private var endAngle: Angle {
		Angle(degrees: startAngel.degrees + degreesPerSpeaker - 1.0)
	}

	func path(in rect: CGRect) -> Path {
		let diameter = min(rect.size.width, rect.size.height) - 24.0
		let radius = diameter / 2.0
		let center = CGPoint(x: rect.midX, y: rect.midY)
		return Path { path in
			path.addArc(center: center, radius: radius, startAngle: startAngel, endAngle: endAngle, clockwise: false)
		}
	}
}

