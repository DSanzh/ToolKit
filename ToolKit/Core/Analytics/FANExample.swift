//
//  FANExample.swift
//  ToolKit
//
//  Created by Sanzhar Dauylov on 08.01.2021.
//  Copyright © 2021 D. Sanzhar. All rights reserved.
//

//import Foundation
//
//enum StartingPageEvents: EventDelegate {
//
//    case exchangeMoreInfoClick
//    case exchangeSwitch(exchangeType: ExchangeType)
//    case exchangeSwitchError(exchangeType: ExchangeType, errorText: String)
//    case exchangeClick(exchangeType: ExchangeType, step: String)
//    
//    func getExchangeTypeString(_ exchType: ExchangeType) -> String {
//        return exchType == .callsToInternet ? "min_to_gb" : "gb_to_min"
//    }
//    
//    var eventName: String {
//        switch self {
//        case .exchangeMoreInfoClick: return "exchange_more_info_click"
//        case .exchangeSwitch: return "exchange_switch"
//        case .exchangeSwitchError: return "exchange_switch_error"
//        case .exchangeClick: return "exchange_click"
//        }
//    }
//    
//    var eventAttributs: [String : String] {
//        switch self {
//        case .exchangeMoreInfoClick:
//            return [:]
//        case .exchangeSwitch(let exchangeType):
//            return ["type": getExchangeTypeString(exchangeType)]
//        case .exchangeSwitchError(let exchangeType, let errorText):
//            return ["type": getExchangeTypeString(exchangeType),
//                    "text": errorText]
//        case .exchangeClick(let exchangeType, let step):
//            return ["type": getExchangeTypeString(exchangeType),
//                    "step": step]
//        }
//    }
//}

//class StartPageViewController: UIViewController, AnalyticsProtocol {
//    typealias EventType = StartingPageEvents
//    func becomeBeelineTapped() {
//        sendEvent(event: .becomeBeelineUser)
//    }
//}
