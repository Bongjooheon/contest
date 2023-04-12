////
////  MyStructDetail.swift
////  SKHUAZ
////
////  Created by 봉주헌 on 2023/04/12.
////
//
//import SwiftUI
//
//struct MyStructDetail: View {
//    let myStruct: MyStruct // 저장된 MyStruct 값
//    @EnvironmentObject var userData: UserData
//    @Binding var isShowingDetail: Bool
//    
//    var body: some View {
//        VStack {
//            // 내용 표시
//            Text("MyStructDetail")
//            Button(action: {
//                // 삭제 버튼 클릭 시
//                deleteData(id: myStruct.id)
//            }) {
//                Text("삭제")
//            }
//        }
//        .onDisappear {
//            // 뷰가 사라질 때 isShowingDetail 변수를 false로 설정하여 모달이 닫히도록 함
//            isShowingDetail = false
//        }
//    }
//    
//    func deleteData(id: Int) {
//        // HTTP DELETE 요청을 보내고, 요청이 성공하면 responseMessage를 갱신함
//        guard let url = URL(string: "http://skhuaz.duckdns.org/routes/\(id)") else {
//            print("Invalid URL")
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "DELETE"
//        // 세션 ID를 요청 헤더에 추가
//        let sessionId = userData.sessionId
//        request.addValue(sessionId, forHTTPHeaderField: "sessionId")
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//            } else if let data = data {
//                // 서버로부터 받은 응답을 문자열로 변환하여 responseMessage를 갱신
//                self.responseMessage = String(data: data, encoding: .utf8) ?? "No response data"
//                print("삭제되었습니다.")
//            } else {
//                print("삭제에 실패했습니다.")
//            }
//        }
//        .resume()
//    }
//}
