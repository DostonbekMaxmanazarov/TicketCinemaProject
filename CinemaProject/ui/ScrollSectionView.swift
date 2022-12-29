import SwiftUI

struct ScrollSectionView: View {
    
    @State var title = "Now playing"
    @State var images: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6", "poster7"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16.0) {
                    ForEach(images.indices, id:\.self) { index in
                        
                        NavigationLink{
                            BookingView()
                        } label: {
                            Image(images[index])
                                .resizable()
                                .frame(width: 120, height: 130)
                                .cornerRadius(20)
                        }
                    }
                }
                .offset(x: 20)
                .padding(.trailing, 40)
            }
        }
    }
}

struct ScrollSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSectionView()
    }
}
