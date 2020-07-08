//
//  localethingUITests.swift
//  localethingUITests
//
//  Created by Akhil Gundawar on 07/07/20.
//  Copyright © 2020 Idontknowsomething. All rights reserved.
//

import XCTest

class localethingUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func launchAppWithLocale(userApp: XCUIApplication, locale: String) {
        let locale = locale
        userApp.launchArguments += ["-AppleLocale", "\"\(locale)\""]
        userApp.launch()
    }
    
    func launchAppWithLocaleLanguage(userApp: XCUIApplication, lang: String, locale: String) {
        let deviceLanguage = lang
        let locale = locale
        userApp.launchArguments += ["-AppleLanguages", "(\(deviceLanguage))", "-AppleLocale", "\"\(locale)\""]
        userApp.launch()
    }

    func launchAppWithLocaleLanguageKeyboard(userApp: XCUIApplication, lang: String, locale: String, keyboard: String) {
        let deviceLanguage = lang
        let locale = locale
        userApp.launchArguments += ["-AppleLanguages", "(\(deviceLanguage))", "-AppleLocale", "\"\(locale)\"", "-AppleKeyboards", "(\(keyboard))"]
        userApp.launch()
    }
    
    func testDefaultAppLaunch() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testDefaultAppLaunch")
        sleep(5)
    }

    
    func testESLocaleLanguage() {
        let app = XCUIApplication()
        let deviceLanguage = "es"
        let locale = "es_ES"

        launchAppWithLocaleLanguage(userApp: app, lang: deviceLanguage, locale: locale)
        XCTAssert(app.staticTexts["es"].exists)
        XCTAssert(app.staticTexts["en_ES"].exists)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testESLocaleLanguage")
        sleep(5)
    }

    func testIELocaleLanguage() {
        let app = XCUIApplication()
        let deviceLanguage = "en"
        let locale = "en_IE"

        launchAppWithLocaleLanguage(userApp: app, lang: deviceLanguage, locale: locale)
        XCTAssert(app.staticTexts["en"].exists)
        XCTAssert(app.staticTexts["en_IE"].exists)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testIELocaleLanguage")
        sleep(5)
    }

    func testUSLocaleLanguage() {
        let app = XCUIApplication()
        let deviceLanguage = "en-US"
        let locale = "en_US"

        launchAppWithLocaleLanguage(userApp: app, lang: deviceLanguage, locale: locale)
        XCTAssert(app.staticTexts["en-US"].exists)
        XCTAssert(app.staticTexts["en_US"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testUSLocaleLanguage")
        sleep(5)
    }

    func testESLocale() {
        let app = XCUIApplication()
        let locale = "es_ES"

        launchAppWithLocale(userApp: app, locale: locale)
        XCTAssert(app.staticTexts["en_ES"].exists)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testESLocale")
        sleep(5)
    }

    func testIELocale() {
        let app = XCUIApplication()
        let locale = "en_IE"

        launchAppWithLocale(userApp: app, locale: locale)
        XCTAssert(app.staticTexts["en_IE"].exists)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testIELocale")
        sleep(5)
    }

    func testUSLocale() {
        let app = XCUIApplication()
        let locale = "en_US"

        launchAppWithLocale(userApp: app, locale: locale)
        XCTAssert(app.staticTexts["en_US"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testUSLocale")
        sleep(5)
    }

    func testUSLocaleLanguageKeyboard() {
        let app = XCUIApplication()
        let deviceLanguage = "en-US"
        let locale = "en_US"
        let keyboard = "en_US@sw=QWERTY;hw=Automatic"

        launchAppWithLocaleLanguageKeyboard(userApp: app, lang: deviceLanguage, locale: locale, keyboard: keyboard)

        XCTAssert(app.staticTexts["en-US"].exists)
        XCTAssert(app.staticTexts["en_US"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testUSLocaleLanguageKeyboard")
        sleep(5)
    }

    func testIELocaleLanguageKeyboard() {
        let app = XCUIApplication()

        let deviceLanguage = "en"
        let locale = "en_IE"
        let keyboard = "en_GB"

        launchAppWithLocaleLanguageKeyboard(userApp: app, lang: deviceLanguage, locale: locale, keyboard: keyboard)

        XCTAssert(app.staticTexts["en"].exists)
        XCTAssert(app.staticTexts["en_IE"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testIELocaleLanguageKeyboard")
        sleep(5)
    }
    
    func testUSLocaleLanguageDummyKeyboard() {
        let app = XCUIApplication()
        let deviceLanguage = "en-US"
        let locale = "en_US"
        let keyboard = "dummy_keyboard"

        launchAppWithLocaleLanguageKeyboard(userApp: app, lang: deviceLanguage, locale: locale, keyboard: keyboard)

        XCTAssert(app.staticTexts["en-US"].exists)
        XCTAssert(app.staticTexts["en_US"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testUSLocaleLanguageDummyKeyboard")
        sleep(5)
    }

    func testIELocaleLanguageDummyKeyboard() {
        let app = XCUIApplication()

        let deviceLanguage = "en"
        let locale = "en_IE"
        let keyboard = "dummy_keyboard"

        launchAppWithLocaleLanguageKeyboard(userApp: app, lang: deviceLanguage, locale: locale, keyboard: keyboard)

        XCTAssert(app.staticTexts["en"].exists)
        XCTAssert(app.staticTexts["en_IE"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testIELocaleLanguageDummyKeyboard")
        sleep(5)
    }
    
    func testUSLocaleLanguageWithGBKeyboard() {
        let app = XCUIApplication()
        let deviceLanguage = "en-US"
        let locale = "en_US"
        let keyboard = "en_GB"

        launchAppWithLocaleLanguageKeyboard(userApp: app, lang: deviceLanguage, locale: locale, keyboard: keyboard)

        XCTAssert(app.staticTexts["en-US"].exists)
        XCTAssert(app.staticTexts["en_US"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testUSLocaleLanguageWithGBKeyboard")
        sleep(5)
    }
    
    func testIELocaleLanguageWithUSKeyboard() {
        let app = XCUIApplication()

        let deviceLanguage = "en"
        let locale = "en_IE"
        let keyboard = "en_US"

        launchAppWithLocaleLanguageKeyboard(userApp: app, lang: deviceLanguage, locale: locale, keyboard: keyboard)

        XCTAssert(app.staticTexts["en"].exists)
        XCTAssert(app.staticTexts["en_IE"].exists)

        print(app.debugDescription)
        let textField = app.textFields["Enter text"]
        textField.tap()
        textField.typeText("testIELocaleLanguageWithUSKeyboard")
        sleep(5)
    }
}
