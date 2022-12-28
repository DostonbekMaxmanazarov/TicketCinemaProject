import SwiftUI

struct Tickets: View {
    
    @State var tickets: [TicketModel] = [
        TicketModel(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
        TicketModel(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
        TicketModel(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Magness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]
    
    var body: some View {
        ZStack {
            ForEach(tickets) { ticket in
                InfinitiveStackView(tickets: $tickets, ticket: ticket)
            }
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct Tickets_Previews: PreviewProvider {
    static var previews: some View {
        Tickets()
    }
}

struct InfinitiveStackView: View {
    
    @Binding var tickets: [TicketModel]
    var ticket: TicketModel
    
    @GestureState var isDragging: Bool = false
    @State var offset: CGFloat = .zero
    
    @State var height: CGFloat = 0
    
    var body: some View {
        VStack {
            Ticket(title: ticket.title, subTitle: ticket.subtitle, imageTop: ticket.top, imageBottom: ticket.bottom, spacerHeight: $height)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .zIndex(Double(CGFloat(tickets.count) - getIndext()))
            .rotationEffect(getIndext() == 1 ? .degrees(-6) : .degrees(0))
            .rotationEffect(getIndext() == 2 ? .degrees(6) : .degrees(0))
            .rotationEffect(.init(degrees: getRotation(angle: 10)))
            .scaleEffect(getIndext() == 0 ? 1 : 0.9)
            .offset(x: getIndext() == 1 ? -40 : 0)
            .offset(x: getIndext() == 2 ? 40 : 0)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .updating($isDragging, body: {_, out, _ in
                        out = true
                    })
                    .onChanged({ value in
                        var translation = value.translation.width
                        translation = tickets.first?.id == ticket.id ? translation : 0
                        translation = isDragging ? translation : 0
                        
                        withAnimation(.easeInOut(duration: 0.5)){
                            offset = translation
                            height = -offset / 5
                        }
                    })
                    .onEnded({ value in
                        let width = UIScreen.main.bounds.width
                        let swipeRight = offset > (width / 2)
                        let swipeLeft = -offset > (width / 2)
                        
                        withAnimation(.easeInOut(duration: 0.5)) {
                            
                            if swipeLeft {
                                offset = -width
                                removeTicket()
                            } else {
                                if swipeRight {
                                    offset = width
                                    removeAndAdd()
                                } else {
                                    offset = .zero
                                    height = .zero
                                }
                            }
                        }
                    })
            )
    }
    
    func getIndext() -> CGFloat {
        let index = tickets.firstIndex { ticket in
            return self.ticket.id == ticket.id
        } ?? 0
        
        return CGFloat(index)
    }
    
    func getRotation(angle: Double) -> Double {
        let width = UIScreen.main.bounds.width
        let progress = offset / width
        
        return Double(progress * angle)
    }
    
    func removeAndAdd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            var updateTicket = ticket
            updateTicket.id = UUID().uuidString
            
            tickets.append(updateTicket)
            
            withAnimation(.spring()) {
                tickets.removeFirst()
            }
        }
    }
    
    func removeTicket() {
        withAnimation(.spring()){
            tickets.removeFirst()
        }
    }
}
