import SwiftUI
import OSLog

struct TicketView: View {
    
    @State var animate = false
    
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
            
            VStack(spacing: 24) {
                
                Text("Mobile Ticket")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                Text("Once you buy a movie ticket simply scan the barcode to acces to your movie.")
                    .frame(maxWidth: 248)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
            }.padding(.horizontal, 16)
             .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            Tickets()
                .padding()
            
        }.background(
            LinearGradient(gradient: Gradient(colors: [Color("colorBackgroundDarker"), Color("colorBackgroundLighter")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
