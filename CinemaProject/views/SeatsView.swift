import SwiftUI

struct SeatsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var animate = false
    @State var showButton = false
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                CircleButton(action: {
                    dismiss()
                }, image: "arrow.left")
                
                Spacer()
                
                Text("Choose seats")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.white)
                
                Spacer()
                
                CircleButton(action: {}, image: "calendar")
            }.padding(.top, 46)
                .padding(.horizontal, 20)
            
            Image("frontSeat")
                .padding(.top, 56)
                .glow(color: Color("colorSlateBlue"), radius: 20)
            
            Image("seats")
                .frame(height: 240)
                .padding(.top, 56)
                .padding(.horizontal, 24)
                .onTapGesture {
                    withAnimation(.spring()){
                        showButton.toggle()
                    }
                }
            
            HStack(spacing: 20.0) {
                CustomStatus()
                
                CustomStatus(color: Color("colorPink"), text: "Reserved")
                
                CustomStatus(color: Color("colorLightBlueStroke"), text: "Selected")
            }.padding(.top, 56)
            
            ZStack(alignment: .topLeading) {
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("colorGreenCircle"))
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? -100 : 20, y: animate ? -20 : 20)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()){
                            animate.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("colorBlueStroke"))
                    .blur(radius: animate ? 50 : 100)
                    .offset(x: animate ? 50 : 70, y: animate ? 70 : 30)
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("colorWisteriaCircle"))
                    .blur(radius: animate ? 50 : 100)
                    .offset(x: animate ? 150 : 170, y: animate ? 90 : 100)
                
                VStack(alignment: .leading, spacing: 24.0) {
                    HStack(spacing: 10.0) {
                        Image(systemName: "calendar")
                        
                        Text("December 31, 2022")
                        
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Text("6 p.m.")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "ticket.fill")
                        
                        Text("VIP section")
                        
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Text("Seat 9, 10")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "cart.fill")
                        
                        Text("Total: $30")
                    }
                }
                .padding(36)
                .font(.subheadline)
                
                HStack {
                    Spacer()
                    
                    RoundButton(action: {
                        NavigationUtil.popToRootView()
                    })
                    
                }.frame(maxHeight: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            .padding(.top, 56)
            .offset(y: showButton ? 0 : 350)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background(Color("colorBackgroundDarker"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView()
    }
}
