//
//  Observable.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//

/// Creates an obersable object with listeners
/// 
class Observable<T> {
    var value: T? {
        didSet {
            listeners.forEach {
                $0(value)
            }
        }
    }
    
    private var listeners: [((T?) -> Void)] = []
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listeners.append(listener)
    }
}
