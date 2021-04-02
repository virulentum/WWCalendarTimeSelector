//
//  LocaleConfig.swift
//  WWCalendarTimeSelector
//
//  Created by Y.Rerikh on 01.04.2021.
//  Copyright © 2021 Wonder. All rights reserved.
//

import Foundation

public enum LocaleConfigIdentifier: String {
  case uk = "uk"
  case en = "en"
  case ru = "ru"
}

public class LocaleConfig: NSObject {

  internal static var locale: Locale = Locale.autoupdatingCurrent

  static func recreateLocale(with identifier: LocaleConfigIdentifier) {
    locale = Locale(identifier: identifier.rawValue)
  }
}
