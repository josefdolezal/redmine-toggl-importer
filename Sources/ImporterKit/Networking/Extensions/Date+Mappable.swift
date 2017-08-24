//
//  Date+Mappable.swift
//  Importr
//
//  Created by Josef Dolezal on 19/08/2017.
//
//

import Foundation
import Mapper

extension Date {
    public static func isoFormatTransformation(_ value: Any) throws -> Date {
        guard
            let dateString = value as? String,
            let date = Formatters.ISODateFormatter.date(from: dateString)
        else {
            throw MapperError.convertibleError(value: value, type: Date.self)
        }

        return date
    }

    public static func standardAPIDateTransformation(_ value: Any) throws -> Date {
        guard
            let dateString = value as? String,
            let date = Formatters.StandardAPIDateFormatter.date(from: dateString)
        else {
                throw MapperError.convertibleError(value: value, type: Date.self)
        }

        return date
    }
}
