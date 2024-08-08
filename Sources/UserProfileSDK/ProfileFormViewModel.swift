//
//  ProfileFormViewModel.swift
//
//

import SwiftUI
import Combine

final class ProfileFormViewModel: ObservableObject {
    @Published var profileImage: UIImage?
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    
    var onSubmitted: ((UserProfile) -> Void)?

    init(profile: UserProfile? = nil, onSubmitted: ((UserProfile) -> Void)? = nil) {
        if let profile = profile {
            self.name = profile.name
            self.email = profile.email
            self.phoneNumber = profile.phoneNumber
            self.profileImage = profile.profileImage
            self.onSubmitted = onSubmitted
        }
    }

    func submitProfile() -> Bool {
        let userProfile = UserProfile(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            profileImage: profileImage
        )
        onSubmitted?(userProfile)
        return true
    }
}
