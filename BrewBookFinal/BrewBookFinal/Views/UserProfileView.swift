//
//  UserProfileView.swift
//  BrewBookFinal
import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var showLogoutAlert = false
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            if let image = selectedImage ?? viewModel.loadImage() {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Button(action: {
                    self.showImagePicker = true
                }) {
                    Text("Select Profile Photo")
                }
            }

            if let user = viewModel.user {
                Text(user.email)
                    .font(.title)
                Button(action: {
                    self.showLogoutAlert = true
                }) {
                    Text("Logout")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            self.viewModel.fetchUser()
        }
        .alert(isPresented: $showLogoutAlert) {
            Alert(
                title: Text("Logout"),
                message: Text("Are you sure you want to logout?"),
                primaryButton: .destructive(Text("Logout")) {
                    self.viewModel.logoutUser()
                },
                secondaryButton: .cancel()
            )
        }
        .sheet(isPresented: $showImagePicker, onDismiss: saveImage) {
            ImagePicker(selectedImage: self.$selectedImage)
        }
    }

    private func saveImage() {
        if let image = selectedImage {
            viewModel.saveImage(image)
        }
    }
}
