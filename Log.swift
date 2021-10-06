//
//  Log.swift
//  Copyright © 2021 B333i. All rights reserved.
//

import Foundation

struct Log {
    static var dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSZ"
    static var outputLogLevel: LogLevel = .trace
    static var outputLogType: LogType = .circle
    
    enum LogLevel: Int {
        case trace = 1
        case debug = 2
        case info = 3
        case notice = 4
        case warning = 5
        case critical = 6
        case error = 7
    }
    
    enum LogType {
        case text
        case circle
        case square
        case emoji
    }
    
    private static func getDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(for: Date())!
    }
    
    private static func getIcon(type: LogType, level: LogLevel) -> String {
        switch type {
        case .text:
            switch level {
            case .trace:
                return "[Trace]"
            case .debug:
                return "[Debug]"
            case .info:
                return "[Info]"
            case .notice:
                return "[Notice]"
            case .warning:
                return "[Warning]"
            case .critical:
                return "[Critical]"
            case .error:
                return "[Error]"
            }
        case .circle:
            switch level {
            case .trace:
                return "⚪️​"
            case .debug:
                return "🟣​"
            case .info:
                return "🔵​"
            case .notice:
                return "🟢​"
            case .warning:
                return "🟡​"
            case .critical:
                return "🟠​"
            case .error:
                return "🔴​"
            }
        case .square:
            switch level {
            case .trace:
                return "⬜️"
            case .debug:
                return "🟪"
            case .info:
                return "🟦"
            case .notice:
                return "🟩"
            case .warning:
                return "🟨"
            case .critical:
                return "🟧"
            case .error:
                return "🟥"
            }
        case .emoji:
            switch level {
            case .trace:
                return "📣"
            case .debug:
                return "🐛"
            case .info:
                return "ℹ️"
            case .notice:
                return "📖"
            case .warning:
                return "⚠️"
            case .critical:
                return "⚡"
            case .error:
                return "🔥"
            }
        }
    }
    
    static func print(level: LogLevel, type: LogType, message: String) {
        if level.rawValue < outputLogLevel.rawValue {
            return
        }
        Swift.print("\(getDateTime()) \(getIcon(type: type, level: level)) \(message)")
    }
    
    /// Trace
    static func t(_ message: String) {
        print(level: .trace, type: outputLogType, message: message)
    }
    
    /// Debug
    static func d(_ message: String) {
        print(level: .debug, type: outputLogType, message: message)
    }
    
    /// Info
    static func i(_ message: String) {
        print(level: .info, type: outputLogType, message: message)
    }
    
    /// Notice
    static func n(_ message: String) {
        print(level: .notice, type: outputLogType, message: message)
    }
    
    /// Warning
    static func w(_ message: String) {
        print(level: .warning, type: outputLogType, message: message)
    }
    
    /// Critical
    static func c(_ message: String) {
        print(level: .critical, type: outputLogType, message: message)
    }
    
    /// Error
    static func e(_ message: String) {
        print(level: .error, type: outputLogType, message: message)
    }
}
