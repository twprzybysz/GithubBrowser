//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `background`.
    static let background = Rswift.ColorResource(bundle: R.hostingBundle, name: "background")
    /// Color `error`.
    static let error = Rswift.ColorResource(bundle: R.hostingBundle, name: "error")
    /// Color `placeholder`.
    static let placeholder = Rswift.ColorResource(bundle: R.hostingBundle, name: "placeholder")
    /// Color `text`.
    static let text = Rswift.ColorResource(bundle: R.hostingBundle, name: "text")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "background", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func background(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.background, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "error", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func error(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.error, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "placeholder", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.placeholder, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "text", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func text(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.text, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `blank`.
    static let blank = Rswift.ImageResource(bundle: R.hostingBundle, name: "blank")
    /// Image `githubLogo`.
    static let githubLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "githubLogo")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "blank", bundle: ..., traitCollection: ...)`
    static func blank(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.blank, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "githubLogo", bundle: ..., traitCollection: ...)`
    static func githubLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.githubLogo, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 21 localization keys.
    struct localizable {
      /// en translation: Check user name
      ///
      /// Locales: en, pl
      static let loginButton = Rswift.StringResource(key: "loginButton", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Company:
      ///
      /// Locales: en, pl
      static let accountInfoCompany = Rswift.StringResource(key: "accountInfoCompany", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Creation date:
      ///
      /// Locales: en, pl
      static let accountInfoCreationDate = Rswift.StringResource(key: "accountInfoCreationDate", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Enter username
      ///
      /// Locales: en, pl
      static let loginPlaceholder = Rswift.StringResource(key: "loginPlaceholder", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Error
      ///
      /// Locales: en, pl
      static let error = Rswift.StringResource(key: "error", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Followers:
      ///
      /// Locales: en, pl
      static let accountInfoFollowers = Rswift.StringResource(key: "accountInfoFollowers", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Following:
      ///
      /// Locales: en, pl
      static let accountInfoFollowing = Rswift.StringResource(key: "accountInfoFollowing", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Github Browser
      ///
      /// Locales: en, pl
      static let accountInfoTitle = Rswift.StringResource(key: "accountInfoTitle", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Github Browser
      ///
      /// Locales: en, pl
      static let loginTitle = Rswift.StringResource(key: "loginTitle", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Github username:
      ///
      /// Locales: en, pl
      static let loginLabel = Rswift.StringResource(key: "loginLabel", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Invalid url path
      ///
      /// Locales: en, pl
      static let errorInvalidUrlError = Rswift.StringResource(key: "errorInvalidUrlError", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Location:
      ///
      /// Locales: en, pl
      static let accountInfoLocation = Rswift.StringResource(key: "accountInfoLocation", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Login:
      ///
      /// Locales: en, pl
      static let accountInfoLogin = Rswift.StringResource(key: "accountInfoLogin", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Name:
      ///
      /// Locales: en, pl
      static let accountInfoName = Rswift.StringResource(key: "accountInfoName", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Network error, try again later
      ///
      /// Locales: en, pl
      static let errorNetworkError = Rswift.StringResource(key: "errorNetworkError", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Number of public gists:
      ///
      /// Locales: en, pl
      static let accountInfoPublicGists = Rswift.StringResource(key: "accountInfoPublicGists", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Number of public respositories:
      ///
      /// Locales: en, pl
      static let accountInfoPublicRepositories = Rswift.StringResource(key: "accountInfoPublicRepositories", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: OK
      ///
      /// Locales: en, pl
      static let commonButtonOk = Rswift.StringResource(key: "commonButtonOk", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Profile is invalid
      ///
      /// Locales: en, pl
      static let errorInvalidProfile = Rswift.StringResource(key: "errorInvalidProfile", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Update date:
      ///
      /// Locales: en, pl
      static let accountInfoUpdateDate = Rswift.StringResource(key: "accountInfoUpdateDate", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)
      /// en translation: Website:
      ///
      /// Locales: en, pl
      static let accountInfoWebsite = Rswift.StringResource(key: "accountInfoWebsite", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pl"], comment: nil)

      /// en translation: Check user name
      ///
      /// Locales: en, pl
      static func loginButton(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("loginButton", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "loginButton"
        }

        return NSLocalizedString("loginButton", bundle: bundle, comment: "")
      }

      /// en translation: Company:
      ///
      /// Locales: en, pl
      static func accountInfoCompany(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoCompany", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoCompany"
        }

        return NSLocalizedString("accountInfoCompany", bundle: bundle, comment: "")
      }

      /// en translation: Creation date:
      ///
      /// Locales: en, pl
      static func accountInfoCreationDate(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoCreationDate", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoCreationDate"
        }

        return NSLocalizedString("accountInfoCreationDate", bundle: bundle, comment: "")
      }

      /// en translation: Enter username
      ///
      /// Locales: en, pl
      static func loginPlaceholder(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("loginPlaceholder", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "loginPlaceholder"
        }

        return NSLocalizedString("loginPlaceholder", bundle: bundle, comment: "")
      }

      /// en translation: Error
      ///
      /// Locales: en, pl
      static func error(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "error"
        }

        return NSLocalizedString("error", bundle: bundle, comment: "")
      }

      /// en translation: Followers:
      ///
      /// Locales: en, pl
      static func accountInfoFollowers(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoFollowers", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoFollowers"
        }

        return NSLocalizedString("accountInfoFollowers", bundle: bundle, comment: "")
      }

      /// en translation: Following:
      ///
      /// Locales: en, pl
      static func accountInfoFollowing(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoFollowing", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoFollowing"
        }

        return NSLocalizedString("accountInfoFollowing", bundle: bundle, comment: "")
      }

      /// en translation: Github Browser
      ///
      /// Locales: en, pl
      static func accountInfoTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoTitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoTitle"
        }

        return NSLocalizedString("accountInfoTitle", bundle: bundle, comment: "")
      }

      /// en translation: Github Browser
      ///
      /// Locales: en, pl
      static func loginTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("loginTitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "loginTitle"
        }

        return NSLocalizedString("loginTitle", bundle: bundle, comment: "")
      }

      /// en translation: Github username:
      ///
      /// Locales: en, pl
      static func loginLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("loginLabel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "loginLabel"
        }

        return NSLocalizedString("loginLabel", bundle: bundle, comment: "")
      }

      /// en translation: Invalid url path
      ///
      /// Locales: en, pl
      static func errorInvalidUrlError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorInvalidUrlError", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "errorInvalidUrlError"
        }

        return NSLocalizedString("errorInvalidUrlError", bundle: bundle, comment: "")
      }

      /// en translation: Location:
      ///
      /// Locales: en, pl
      static func accountInfoLocation(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoLocation", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoLocation"
        }

        return NSLocalizedString("accountInfoLocation", bundle: bundle, comment: "")
      }

      /// en translation: Login:
      ///
      /// Locales: en, pl
      static func accountInfoLogin(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoLogin", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoLogin"
        }

        return NSLocalizedString("accountInfoLogin", bundle: bundle, comment: "")
      }

      /// en translation: Name:
      ///
      /// Locales: en, pl
      static func accountInfoName(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoName", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoName"
        }

        return NSLocalizedString("accountInfoName", bundle: bundle, comment: "")
      }

      /// en translation: Network error, try again later
      ///
      /// Locales: en, pl
      static func errorNetworkError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorNetworkError", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "errorNetworkError"
        }

        return NSLocalizedString("errorNetworkError", bundle: bundle, comment: "")
      }

      /// en translation: Number of public gists:
      ///
      /// Locales: en, pl
      static func accountInfoPublicGists(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoPublicGists", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoPublicGists"
        }

        return NSLocalizedString("accountInfoPublicGists", bundle: bundle, comment: "")
      }

      /// en translation: Number of public respositories:
      ///
      /// Locales: en, pl
      static func accountInfoPublicRepositories(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoPublicRepositories", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoPublicRepositories"
        }

        return NSLocalizedString("accountInfoPublicRepositories", bundle: bundle, comment: "")
      }

      /// en translation: OK
      ///
      /// Locales: en, pl
      static func commonButtonOk(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("commonButtonOk", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "commonButtonOk"
        }

        return NSLocalizedString("commonButtonOk", bundle: bundle, comment: "")
      }

      /// en translation: Profile is invalid
      ///
      /// Locales: en, pl
      static func errorInvalidProfile(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorInvalidProfile", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "errorInvalidProfile"
        }

        return NSLocalizedString("errorInvalidProfile", bundle: bundle, comment: "")
      }

      /// en translation: Update date:
      ///
      /// Locales: en, pl
      static func accountInfoUpdateDate(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoUpdateDate", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoUpdateDate"
        }

        return NSLocalizedString("accountInfoUpdateDate", bundle: bundle, comment: "")
      }

      /// en translation: Website:
      ///
      /// Locales: en, pl
      static func accountInfoWebsite(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("accountInfoWebsite", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "accountInfoWebsite"
        }

        return NSLocalizedString("accountInfoWebsite", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
