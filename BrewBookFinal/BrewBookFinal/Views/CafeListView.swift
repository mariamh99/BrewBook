// CafeListView.swift
import SwiftUI
import MapKit

struct CafeListView: View {
    @StateObject private var viewModel = CafeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.cafes) { cafe in
                NavigationLink(destination: CafeDetailView(cafe: cafe)) {
                    CafeRowView(cafe: cafe)
                }
            }
            .navigationTitle("Cafes")
            .onAppear {
                viewModel.fetchCafes()
            }
        }
    }
}

struct CafeRowView: View {
    let cafe: Cafe
    
    var body: some View {
        HStack {
            AsyncImage(url: cafe.imageURL)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(cafe.name)
                    .font(.headline)
                Text(cafe.location)
                    .font(.subheadline)
                Text("Rating: \(cafe.rating)")
                    .font(.subheadline)
            }
        }
    }
}

import SwiftUI

struct CafeDetailView: View {
    let cafe: Cafe
    @State private var isBookingPresented = false
    @EnvironmentObject var userViewModel: UserViewModel  // Declared as EnvironmentObject
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AsyncImage(url: cafe.imageURL)
                    .aspectRatio(contentMode: .fit)
                
                Text(cafe.name).font(.title)
                Text(cafe.location)
                Text("Rating: \(cafe.rating)")
                
                Button(action: {
                    isBookingPresented = true
                }) {
                    Text("Book Now")
                        
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationBarTitle(cafe.name)
        .sheet(isPresented: $isBookingPresented) {
            BookingView(cafe: cafe)
        }
    }
}


struct CafeListView_Previews: PreviewProvider {
    static var previews: some View {
        CafeListView()
    }
}

struct CafeRowView_Previews: PreviewProvider {
    static let cafe = Cafe(
        id: "1",
        name: "Sample Cafe",
        location: "123 Main St",
        coordinates: Coordinates(lat: 0.0, lon: 0.0),
        rating: "4.5",
        imageURL: URL(string: "https://example.com/image.jpg")!
    )
    
    static var previews: some View {
        CafeRowView(cafe: cafe)
            .previewLayout(.sizeThatFits)
    }
}
struct CafeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CafeDetailView(cafe: Cafe(id: "1", name: "Sample Cafe", location: "123 Main St", coordinates: Coordinates(lat: 0.0, lon: 0.0), rating: "4.5", imageURL: URL(string: "https://media-cdn.tripadvisor.com/media/photo-s/03/f4/0e/01/cafe-lilou.jpg")!))
    }
}
