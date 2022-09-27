//
//  NetworkMonitor.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/26/22.
//

import Foundation
import Network

final class NetworkMonitor {
    
    /// Shared instance of a network monitor
    static let shared = NetworkMonitor()
    
    /// Current global system queue
    private let queue = DispatchQueue.global()
    
    /// Observer to check for network changes
    private let monitor: NWPathMonitor
    
    /// Current status of internet connection
    public private(set) var isConnected: Bool = false
    
    /// Current type of internet connection
    public private(set) var connectionType: ConnectionType = .unknown
    
    /// Internet connection types enum
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    /// Starts monitoring of internet connection
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                self?.isConnected = path.status == .satisfied
                
                self?.getConnectionType(path)
            }
        }
    }
    
    /// Stops monitoring of internet connection
    public func stopMonitoring() {
        monitor.cancel()
    }
    
    /// Sets current internet type
    private func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        }
    }
}
