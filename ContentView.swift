import SwiftUI

struct ContentView: View {
    @State public var count = 1
    @State public var temp: [String] = [""]
    var body: some View {
        Form {
            Section(header: Text("設定")) {
                Stepper(value: $count, in: 1...100) {
                    //設定できる体重の範囲を指定
                    Text("\(count)回")
                }
                Button("体温生成") {
                    temp.removeAll()
                    var temp_1 = Int()
                    var temp_2 = Int()
                    for _ in 0..<count {
                        temp_1 = Int.random(in: 35...37)
                        temp_2 = Int.random(in: 0...9)
                        temp.append("\(temp_1).\(temp_2)℃")
                    }
                    for i in 0..<temp.count{
                        print(temp[i])
                    }
                }
            }
            
            Section(header: Text("結果")){
                List {
                    ForEach(temp,id:\.self){ name in
                        Text(name)              
                    }
                }
            }
        }
    }
}

