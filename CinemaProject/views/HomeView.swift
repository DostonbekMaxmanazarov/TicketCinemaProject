import SwiftUI

struct HomeView: View {
    
    @State private var animate = false
    
    @State var images1: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]
    
    @State var images2: [String] = ["poster7", "poster8", "poster9", "poster10", "poster11", "poster12"]
    
    @State var images3: [String] = ["poster13", "poster14", "poster15", "poster16", "poster17", "poster18"]
    
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
            LinearGradient(gradient: Gradient(colors: [Color("colorBackgroundDarker"), Color("colorBackgroundLighter")]), startPoint: .top, endPoint: .bottom))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
