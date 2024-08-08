# UserProfileSDK

## Overview

`UserProfileSDK` provides a user profile form that can be integrated into your iOS app. It allows users to submit their profile information, including name, email, phone number, and profile picture. The SDK includes a method to launch the profile form and retrieve the submitted data through a completion handler.

## SDK API

1. UserProfileSDK.shared.launch(from:completion:)
        Parameters:
from: The view controller from which to present the profile form.
completion: A closure that receives the user details(UserProfile data model) upon submission. Parameters:
userProfile: UserProfile data model.

## Integration

### Swift Package Manager (SPM)

1. **Add the SDK to Your Project**
    - Open your Xcode project.
    - Go to **File** → **Add Packages**
    - Enter the URL of the `UserProfileSDK` https://github.com/KalaiLingappan/UserProfileSDK.git repository.
    - Select the version you want to use and click **Add Package**.

## Example Usage

Here’s how to use `UserProfileSDK` in your app.

### 1. Import the SDK

Add the following import statement to the file where you want to use the SDK:

```swift
import UserProfileSDK
```
### 2. Call the API

Below code will launch the profile form view and completion block gets executed on successful submission of profile

```swift
 UserProfileSDK.shared.launch(from: rootViewController) { profile in
        print("profile: \(profile)")
 }
```
## Minimum OS version
- iOS 15.0

