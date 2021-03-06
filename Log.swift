//
//  Log.swift
//  Copyright ยฉ 2021 B333i. All rights reserved.
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
                return "โช๏ธโ"
            case .debug:
                return "๐ฃโ"
            case .info:
                return "๐ตโ"
            case .notice:
                return "๐ขโ"
            case .warning:
                return "๐กโ"
            case .critical:
                return "๐ โ"
            case .error:
                return "๐ดโ"
            }
        case .square:
            switch level {
            case .trace:
                return "โฌ๏ธ"
            case .debug:
                return "๐ช"
            case .info:
                return "๐ฆ"
            case .notice:
                return "๐ฉ"
            case .warning:
                return "๐จ"
            case .critical:
                return "๐ง"
            case .error:
                return "๐ฅ"
            }
        case .emoji:
            switch level {
            case .trace:
                return "๐ฃ"
            case .debug:
                return "๐"
            case .info:
                return "โน๏ธ"
            case .notice:
                return "๐"
            case .warning:
                return "โ ๏ธ"
            case .critical:
                return "โก"
            case .error:
                return "๐ฅ"
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
