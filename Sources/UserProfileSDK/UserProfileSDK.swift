//
//  UserProfileSDK.swift
//
//

import SwiftUI
import UIKit

public class UserProfileSDK {
    public static let shared = UserProfileSDK()

    private init() {}

    public func launch(from viewController: UIViewController, completion: @escaping (UserProfile) -> Void) {
        let viewModel = ProfileFormViewModel(onSubmitted: completion)
        let profileFormView = ProfileFormView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: profileFormView)
        hostingController.modalPresentationStyle = .fullScreen
        viewController.present(hostingController, animated: false, completion: nil)
    }
}

