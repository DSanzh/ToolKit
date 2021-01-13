//
//  FAN.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

import Foundation
//import FirebaseAnalytics
//import YandexMobileMetrica
//import Firebase
//
//struct FAN {
//    
//    static func sendEvent(event: EventDelegate) {
//        let data = event.asEventData()
//        Analytics.logEvent(data.name, parameters: data.attributs)
//        YMMYandexMetrica.reportEvent(data.name, parameters: data.attributs, onFailure: nil)
//    }
//    
//}
//
//
//protocol AnalyticsProtocol {
//    
//    associatedtype EventType: EventDelegate
//    
//    func sendEvent(event: EventType)
//    func sendEvent(eventType: EventDelegate)
//}
//
//extension AnalyticsProtocol where Self: UIViewController {
//    
//    func sendScreenView() {
//        //        Analytics.setScreenName(getScreenNameByClassName(Self.classIdentifierName),
//        //                                screenClass: Self.classIdentifierName)
//    }
//    
//    private func getScreenNameByClassName(_ name: String) -> String {
//        if let path = Bundle.main.path(forResource: "screenAnalytics", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                guard let list = [ScreenNameModel](JSONString: String(bytes: data, encoding: .utf8) ?? "") else { return name }
//                guard let item = list.first(where: { $0.iosClassName == name }), let generalName = item.firebaseScreenName else { return name }
//                return !generalName.isEmpty ? generalName : name
//            } catch {
//                return name
//            }
//        }
//        return name
//    }
//}
//
//extension AnalyticsProtocol {
//    
//    func sendEvent(event: EventType) {
//        let data = event.asEventData()
//        Analytics.logEvent(data.name, parameters: data.attributs)
//        YMMYandexMetrica.reportEvent(data.name, parameters: data.attributs, onFailure: nil)
//        
//    }
//    
//    func sendEvent(eventType: EventDelegate) {
//        let data = eventType.asEventData()
//        Analytics.logEvent(data.name, parameters: data.attributs)
//    }
//    
//}
//
//
////Events Data for Enums
//protocol EventDelegate {
//    var eventName: String { get }
//    
//    func asEventData() -> EventData
//}
//
//extension EventDelegate {
//    
//    var eventAttributs: [String : String] { get { return [:] }}
//    
//    func asEventData() -> EventData {
//        return EventData(name: self.eventName, attributs: self.eventAttributs)
//    }
//}
//
//struct EventData {
//    var name: String
//    var attributs: [String:String]
//}
