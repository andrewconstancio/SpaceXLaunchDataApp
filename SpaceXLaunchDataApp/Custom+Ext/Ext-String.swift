//
//  Ext-String.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/24/22.
//

import UIKit

extension String {
    func fromUTCToLocalDate() -> String {
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        var formattedString = self.replacingOccurrences(of: "Z", with: "")
        if let lowerBound = formattedString.range(of: ".")?.lowerBound {
            formattedString = "\(formattedString[..<lowerBound])"
        }

        guard let date = dateFormatter.date(from: formattedString) else {
            return self
        }

        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }
}
