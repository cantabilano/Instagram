//
//  UIDevice.swift
//  Instagram
//
//  Created by Jason Yang on 2/2/24.
//

import UIKit

extension UIDevice {
    
    var hasNotch: Bool {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        let bottom = window?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    var safeAreaInset: UIEdgeInsets {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        return window?.safeAreaInsets ??  UIEdgeInsets()
    }
}

