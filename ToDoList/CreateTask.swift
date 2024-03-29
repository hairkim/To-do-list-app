//
//  CreateTask.swift
//  ToDoList
//
//  Created by Harris Kim on 2/10/24.
//

import SwiftUI

struct CreateTask: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var taskManager = TaskManagement.shared
    
    @Binding var isPresented: Bool
    @Binding var taskName: String
    

    var body: some View {
        VStack(spacing: 10){
            Text("Create New Task")
                .font(.title)
            TextField("Enter Task: ", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add"){
                //add task
                taskManager.addTask(name: taskName, context: managedObjectContext)
            }
            .padding(9)
            .background(Color.blue.cornerRadius(10))
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
            )
            
            
            Button("Cancel"){
                isPresented = false
                taskName = ""
            }
            .padding(9)
            .background(Color.blue.cornerRadius(10))
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
            )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width: 300)
    }
}

#Preview {
    return CreateTask(isPresented: .constant(true), taskName: .constant("New Task"))
}
