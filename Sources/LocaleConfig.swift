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

  public static func recreateLocale(with identifier: LocaleConfigIdentifier) {
    locale = Locale(identifier: identifier.rawValue)
  }

  public static func trySetupLanguageAuthomatically() {
    guard let currentLanguage = (UserDefaults.standard.array(forKey: "AppleLanguages") as? [String])?.first else {
      return
    }
    switch true {
    case currentLanguage.hasPrefix(LocaleConfigIdentifier.uk.rawValue): recreateLocale(with: .uk)
    case currentLanguage.hasPrefix(LocaleConfigIdentifier.ru.rawValue): recreateLocale(with: .ru)
    case currentLanguage.hasPrefix(LocaleConfigIdentifier.en.rawValue): recreateLocale(with: .en)
    default: break
    }
  }
}
