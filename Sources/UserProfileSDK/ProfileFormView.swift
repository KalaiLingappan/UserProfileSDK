//
//  Webview.swift
//  UserProfileSDK
//
//  Created by Kalaiprabha L on 06/08/24.
//
import SwiftUI

struct ProfileFormView: View {
    @ObservedObject var viewModel: ProfileFormViewModel
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage? = nil
    @State private var showSuccessAlert: Bool = false

    init(viewModel: ProfileFormViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Picture")) {
                    if let image = viewModel.profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker.toggle()
                            }
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker.toggle()
                            }
                    }
                }
                
                Section(header: Text("User Information")) {
                    TextField("Name", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                    TextField("Phone Number", text: $viewModel.phoneNumber)
                }
                
                Button(action: submitProfile) {
                    Text("Submit")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("User Profile")
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .alert(isPresented: $showSuccessAlert) {
                Alert(
                    title: Text("Success"),
                    message: Text("Profile submitted successfully"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    private func loadImage() {
        if let selectedImage = selectedImage {
            viewModel.profileImage = selectedImage
        }
    }

    private func submitProfile() {
        showSuccessAlert = viewModel.submitProfile()
    }
}
