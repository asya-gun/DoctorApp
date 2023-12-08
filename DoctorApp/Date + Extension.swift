//
//  Date + Extension.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 08.12.2023.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
