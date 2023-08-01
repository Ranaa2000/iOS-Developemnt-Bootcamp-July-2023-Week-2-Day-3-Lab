//
//  ContentView.swift
//  Lab3Week2
//
//  Created by Rana MHD on 14/01/1445 AH.
//

import SwiftUI

// Task 5
class Counter: ObservableObject {
    @Published var count: Int = 0
}

// Task 4
struct BindingView: View {
    @Binding var nameField : String
    var body: some View {
        VStack {
            HStack {
                Image(systemName:"swift")
                TextField("Name", text: $nameField)
                    .frame(height: 40)
                Button(
                    action:{
                        
                    },
                    label:{
                        Text("Submit")
                    }
                )
                .buttonStyle(.bordered)
                .cornerRadius(10)
            } // HStack (Search Box)
            .padding(.vertical, 8)
            .padding(.horizontal, 4)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(12)
            
        }
        .padding()
    }
    
}

// Task 1
struct RedOneView: View {
    // Task 3
    @State var redCircle : Bool = true
    
    // Task 4
    @State var myName : String = ""
    
    // Task 5
    @ObservedObject var counter = Counter()
    
    var body: some View {
        // Task 1
        NavigationView{
            VStack{
                if redCircle {
                    CircleNumberView(color : .red , number :1)
                        .navigationTitle("Red Circle")
                        .offset(y:-60)
                } else {
                    CircleNumberView(color : .orange , number :10)
                        .navigationTitle("Orange Circle")
                        .offset(y:-60)
                }
                
                // Task 4
                BindingView(nameField: $myName)
                Text("Name is: \(myName)")
                    .bold()
                
                // Task 5
                Text("Counter: \(counter.count)")
                    .bold()
                
                Button(
                    action:{
                        counter.count += 1
                    },
                    label: {
                        Text("Count Up")
                    }
                )
                .buttonStyle(.bordered)
                .cornerRadius(10)
                
                // Task 3
                Button(
                    action:{
                        redCircle.toggle()
                    },
                    label:{
                        if redCircle {
                            Text("Make it orange")
                                .foregroundColor(Color.orange)
                                .bold()
                        } else {
                            Text("Make it red")
                                .foregroundColor(Color.red)
                                .bold()
                        }
                    }
                )
                .buttonStyle(.bordered)
                .cornerRadius(10)
                
                // Task 2
                // pass data to second view by property
                NavigationLink(destination: BlueTwoView(color: .blue, info: "I am passed from main view") , label:{(Text("Next Screen"))} )
                    .bold()
                    .frame(width: 290 , height: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
            
        }
        .accentColor(Color(.label))
        
    }
    
}

// Task 2
struct BlueTwoView: View {
    var color: Color
    var info: String
    
    var body: some View {
        VStack{
            CircleNumberView(color : color , number :2)
                .navigationTitle("Blue Circle")
                .offset(y:-60)
            
            Text(info)
                .bold()
            
            NavigationLink(destination: GreenThreeView(), label:{(
                Text("Next Screen"))} )
            .bold()
            .frame(width: 290 , height: 60)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            
        }
    }
}

struct  GreenThreeView : View {
    var body: some View {
        VStack{
            CircleNumberView(color : .green , number :3)
                .navigationTitle("Blue Two")
                .offset(y:-60)
            
        }
    }
    
}

struct CircleNumberView : View{
    var color : Color
    var number :Int
    var body: some View{
        ZStack{
            Circle()
                .frame(width: 200 , height: 200)
                .foregroundColor(color)
            Text("\(number)")
            
                .foregroundColor(.white)
                .font(.system(size : 70 , weight: .bold))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RedOneView()
    }
}
