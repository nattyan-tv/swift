import SwiftUI

struct ContentView: View {
    @State public var count = 1
    @State public var temp: [String] = [""]
    @State public var gen_type = true
    var body: some View {
        Form {
            Section(header: Text("設定")) {
                Stepper(value: $count, in: 1...100) {
                    //設定できる体重の範囲を指定
                    Text("\(count)回")
                }
                Toggle(isOn: $gen_type) {
                    Text("36度台を出しやすくする")
                }
                Button("体温生成") {
                    temp.removeAll()
                    var temp_1 = Int()
                    var temp_2 = Int()
                    if (gen_type == true) {
                        for _ in 0..<count {
                            let temp_1_seed = Int.random(in: 0...20)
                            switch temp_1_seed {
                                case 0,1:
                                temp_1 = 35
                                case 19,20:
                                temp_1 = 37
                            default:
                                temp_1 = 36
                            }
                            temp_2 = Int.random(in: 0...9)
                            temp.append("\(temp_1).\(temp_2)℃")
                        }
                    }else{
                        for _ in 0..<count {
                            temp_1 = Int.random(in: 35...37)
                            temp_2 = Int.random(in: 0...9)
                            temp.append("\(temp_1).\(temp_2)℃")
                        }
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

