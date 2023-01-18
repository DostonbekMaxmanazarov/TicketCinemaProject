import SwiftUI

struct HomeView: View {
    
    @State private var animate = false
    
    @State var images1: [String] = ["image_1", "image_2", "image_3", "image_4", "image_5", "image_6"]
    
    @State var images2: [String] = ["image_7", "image_8", "image_9", "image_10", "image_11", "image_12"]
    
    @State var images3: [String] = ["image_13", "image_14", "image_15", "image_16", "image_17", "image_18"]
    
    var body: some View {
        ZStack {
            CircleBackground(color: Color("colorGreenCircle"))
                .blur(radius: animate ? 10 : 80)
                .offset(x: animate ? -50 : -130, y: animate ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 2).repeatForever()){
                        animate.toggle()
                    }
                }
            
            CircleBackground(color: Color("colorWisteriaCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
            
            VStack(spacing: 0.0) {
                Text("Choose Movie")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.white)
                
                CustomSearchBar()
                    .padding(16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0) {
                        ScrollSectionView(title: "Now playing", images: images1)
                        
                        ScrollSectionView(title: "Coming soon", images: images2)
                        
                        ScrollSectionView(title: "Top movies", images: images3)
                        
                        ScrollSectionView(title: "Favorite", images: images1)
                    }
                    .padding(.bottom, 56)
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }.background(
            LinearGradient(gradient: Gradient(
                colors: [Color("colorBackgroundDarker"), Color("colorBackgroundLighter")]),
                           startPoint: .top, endPoint: .bottom))
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
