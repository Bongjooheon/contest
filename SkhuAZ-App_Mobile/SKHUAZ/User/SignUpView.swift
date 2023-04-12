import SwiftUI


struct SignUpView: View {
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@office.skhu.ac.kr"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    @Environment(\.presentationMode) var presention
    //
    @StateObject var api = RestAPI()
    @State var email: String = ""
    @State var password: String = ""
    @State var nickname: String = ""
    @State var RepeatedPassword: String = ""
    @State var graduate: Bool = false
    @State var major1: String = ""
    @State var major2: String = ""
    @State var department: Bool = false // 전공미선택
    @State var major_minor: Bool = true // 주/부전공
    @State var double_major: Bool = false // 복수전공
//    @State var Semester: Int = 7
    
    @State private var date: String = ""
    @State private var passwordError: String = "비밀번호가 서로 일치하지 않습니다."
    //    @State private var Semester: Int
    
    @State private var SemesterMessage: String = "재학중인 학기를 선택하시오"
    @State private var CheckMessage: String = "ex) abc123@office.skhu.ac.kr"
    @State private var ShowModel: Bool = false
    @State private var certification: Bool = false
    
    
    let SelectedMajor1 = [
        "소프트웨어공학",
        "정보통신공학",
        "컴퓨터공학",
        "인공지능"
    ]
    let SelectedMajor2 = [
        "소프트웨어공학",
        "정보통신공학",
        "컴퓨터공학",
        "인공지능"
    ]
    
    
    @State var MarjorError: String = "선택한 두 전공이 같습니다"
    
    //    struct ModalView: View {
    //        @State private var test: String = ""
    //        @Environment(\.presentationMode) var presentatio
    //        @State var ShowModel: Bool
    //        var body: some View {
    //            Group{
    //                VStack{
    //                    HStack{
    //                        Text("인증번호를 입력해주세요")
    //                            .foregroundColor(.black)
    //                        Spacer()
    //                    }
    //                    .padding(.leading, 30)
    //                    VStack(spacing: 0){
    //                        TextField("인증번호 입력", text: $test)
    //                            .frame(width: 350, height: 50)
    //                            .textFieldStyle(.roundedBorder)
    //                        HStack{
    //                            Button(action: {
    //                                // 인증번호 재전송하는 기능
    //                            }, label: {
    //                                Image(systemName: "arrow.clockwise")
    //                                Text("인증코드 재전송")
    //                            })
    //                            .foregroundColor(.gray)
    //                            Spacer()
    //                        }
    //                        .padding(.leading, 30)
    //
    //                    }
    //                    HStack{
    //                        Button(action: {
    //                            presentatio.wrappedValue.dismiss()
    //                            self.ShowModel = false
    //                        }) {
    //                            Text("취소").bold()
    //                        }
    //                        .foregroundColor(.gray)
    //                        .frame(width: 170, height: 50)
    //                        .background(Color(uiColor: .secondarySystemBackground))
    //                        .cornerRadius(10)
    //                        Button(action: {
    //                            // 인증번호 확인
    //                        }) {
    //                            Text("확인").bold()
    //                        }
    //                        .foregroundColor(.white)
    //                        .frame(width: 170, height: 50)
    //                        .background(Color(red: 0.603, green: 0.756, blue: 0.819))
    //                        .cornerRadius(10)
    //                    }
    //                }
    //
    //            }
    //        }
    //    }
    
    var body: some View {
        ScrollView{
            Image("SKHUAZ")
                .resizable()
                .frame(width: 250, height: 60)
                .padding(.bottom, 30)
            Text("  ") // 상단 여백을 주기 위함
                .padding(.bottom, 10)
            HStack{
                TextField("닉네임을 입력해주세요* ", text: $nickname)
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                //                Button{} label: {
                //                    Text("중복확인")
                //                        .foregroundColor(Color(red: 0.76, green: 0.552, blue: 0.552))
                //                        .frame(width: 90, height:50)
                //                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.76, green: 0.552, blue: 0.552)))
                //                }
            } // 닉네임 입력 HStack
            .padding(30)
            VStack{
                HStack{
                    TextField("학교이메일을 입력해주세요* ", text: $email)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    //                    Button{
                    //                        if checkEmail(str: email){
                    //                            CheckMessage = ""
                    //                            self.ShowModel = true
                    //                        }
                    //                        else{
                    //                            CheckMessage = "학교 이메일을 입력해주세요"
                    //                        }
                    //                    }
                    //                label: {
                    //                        Text("인증번호 발송")
                    //                            .foregroundColor(Color(red: 0.76, green: 0.552, blue: 0.552))
                    //                            .frame(width: 90, height:50)
                    //                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(red: 0.76, green: 0.552, blue: 0.552)))
                    //                            .sheet(isPresented: self.$ShowModel) {
                    //                                ModalView(ShowModel: ShowModel)
                    ////                            }
                    //
                    //                    }
                    //                }
//                    HStack{
//                        Text("\(CheckMessage)")
//                            .padding(.leading, 30)
//                            .font(.system(size: 14))
//                            .foregroundColor(.gray)
//                            .lineLimit(2)
//                        Spacer()
//                    }
                    
                }
                .padding(.bottom, 16)// 학번 중복확인 HStack
                VStack(spacing: 15){ // 비밀번호 입력 받는 SecureField
                    SecureField("비밀번호를 입력해주세요 *", text: $password)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(10)
//                        .onChange(of: password) { V in
//                            if (password == RepeatedPassword) {
//                            }
//                            else {
//                                print(passwordError)
//                            }
//                        }
//                        .padding(.bottom, 10)// 학번 중복확인 HStack
                    
                    VStack(spacing: 5){ // 비밀번호 입력 확인 안내문구와 SecureField
                        SecureField("비밀번호를 한번 더 입력해주세요*", text: $RepeatedPassword)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(10)
//                            .onChange(of: RepeatedPassword) { V in
//                                if (password == RepeatedPassword) {
//                                    passwordError = ""
//                                }
//                                else {
//                                    passwordError = "비밀번호가 일치하지 않습니다."
//                                }
//                            }
//                        HStack{ // 비밀번호 안내문구 출력
//                            Text(passwordError)
//                                .padding(.leading, 30)
//                                .font(.system(size: 14))
//                                .foregroundColor(.red)
//                            Spacer() // 문구 왼쪽 정렬을 위함
//                        }
                    } // 비밀번호 입력 확인 Field
                } // 비밀번호 입력 받는 Field
//                .padding(.bottom, 30)// 학번 중복확인 HStack
                
//                HStack(spacing: 30){
//                    Text("학기 선택")
//                        .font(.system(size: 14))
//                    Group{
//                        Menu {
//                            Section(header: Text("재학중인 학기를 선택하시오")) {
//                                Button(action: {
//                                    Semester = 8
//                                    SemesterMessage = "4학년 2학기"
//                                }) {
//                                    Label("4학년 2학기", systemImage: "")
//                                }
//                                Button(action: {
//                                    Semester = 7
//                                    SemesterMessage = "4학년 1학기"
//                                }) {
//                                    Label("4학년 1학기", systemImage: "")
//                                }
//                                Button(action: {
//                                    Semester = 6
//                                    SemesterMessage = "3학년 2학기"
//                                }) {
//                                    Label("3학년 2학기", systemImage: "")
//                                }
//                                Button(action: {
//                                    Semester = 5
//                                    SemesterMessage = "3학년 1학기"
//                                }) {
//                                    Label("3학년 1학기", systemImage: "")
//                                }
//                                Button(action: {
//                                    Semester = 4
//                                    SemesterMessage = "2학년 2학기"
//                                }) {
//                                    Label("2학년 2학기", systemImage: "")
//                                }
//                                Button(action: {
//                                    Semester = 3
//                                    SemesterMessage = "2학년 1학기"
//                                }) {
//                                    Label("2학년 1학기", systemImage: "")
//                                }
//                                Button(action: {
//                                    Semester = 2
//                                    SemesterMessage = "1학년 2학기"
//                                }) {
//                                    Label("1학년 2학기", systemImage: "")
//                                }
//                                Button(action: {
//                                    Semester = 1
//                                    SemesterMessage = "1학년 1학기"
//                                }) {
//                                    Label("1학년 1학기", systemImage: "")
//                                }
//                            }
//                        }
//                    label: {
//                        Label("\(SemesterMessage)", systemImage: "")
//                            .foregroundColor(Color(.gray))
//                            .accentColor(.gray)
//                            .padding()
//                            .frame(width: 250, height: 50)
//                            .background(Color(uiColor: .secondarySystemBackground))
//                            .cornerRadius(10)
//                    }
//                    }
//                }
//                .padding(.bottom, 30)
                VStack(spacing: 1){ // 졸업유무 전공유형 스텍
//                    HStack(spacing: 30){
//                        Text("졸업유무*")
//                            .padding(.leading)
//                            .font(.system(size: 14))
//                        HStack(spacing: 30){
//                            Button(action: {
//                                graduate.toggle()
//                            }) {
//                                if graduate {
//                                    ZStack{
//                                        Circle()
//                                            .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
//                                            .frame(width: 15, height: 15)
//                                        Circle()
//                                            .fill(Color.white)
//                                            .frame(width: 6, height: 6)
//                                    }
//                                    Text("미졸업")
//                                }
//                                else {
//                                    Circle()
//                                        .fill(Color.white)
//                                        .frame(width: 15, height: 15)
//                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//                                    Text("미졸업")
//                                }
//                            }
//                            .font(.system(size: 12))
//                            .foregroundColor(.black)
//
//                            Button(action: {
//                                graduate.toggle()
//                            }) {
//                                if !graduate {
//                                    ZStack{
//                                        Circle()
//                                            .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
//                                            .frame(width: 15, height: 15)
//                                        Circle()
//                                            .fill(Color.white)
//                                            .frame(width: 6, height: 6)
//                                    }
//                                    Text("졸업")
//                                }
//                                else {
//                                    Circle()
//                                        .fill(Color.white)
//                                        .frame(width: 15, height: 15)
//                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//                                    Text("졸업")
//                                }
//                            }
//                            .font(.system(size: 12))
//                            .foregroundColor(.black)
//                            Spacer()
//                        }
//                        .frame(width: 250, height: 50)
//                    }
//                    .padding(.bottom, 30)
                    
                    HStack(spacing: 30){
                        Text("전공유형*")
                            .font(.system(size: 14))
                        HStack(spacing: 20){
                            Button(action: {
                                department = true
                                major_minor = false
                                double_major = false
                                major1 = "IT융합자율학부"
                                major2 = ""
                            }) {
                                if department {
                                    ZStack{
                                        Circle()
                                            .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                            .frame(width: 15, height: 15)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 6, height: 6)
                                    }
                                    Text("전공 미선택")
                                        .foregroundColor(.black)
                                    
                                }
                                else {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 15, height: 15)
                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                    Text("전공 미선택")
                                        .foregroundColor(.black)
                                }
                            }
                            .aspectRatio(contentMode: .fill)
                            Button(action: {
                                department = false
                                major_minor = true
                                double_major = false
                                major1 = "주전공"
                                major2 = "부전공"
                            }) {
                                if major_minor {
                                    ZStack{
                                        Circle()
                                            .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                            .frame(width: 15, height: 15)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 6, height: 6)
                                    }
                                    Text("주/부전공")
                                        .foregroundColor(.black)
                                    
                                }
                                else {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 15, height: 15)
                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                    Text("주/부전공")
                                        .foregroundColor(.black)
                                }
                            }
                            .aspectRatio(contentMode: .fill)
                            Button(action: {
                                department = false
                                major_minor = false
                                double_major = true
                                major1 = "전공1"
                                major2 = "전공2"
                            }) {
                                if double_major {
                                    ZStack{
                                        Circle()
                                            .fill(Color(red: 0.603, green: 0.756, blue: 0.819))
                                            .frame(width: 15, height: 15)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 6, height: 6)
                                    }
                                    Text("복수전공")
                                        .foregroundColor(.black)
                                    
                                }
                                else {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 15, height: 15)
                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                    Text("복수전공")
                                        .foregroundColor(.black)
                                }
                            }
                            .aspectRatio(contentMode: .fill)
                        }
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .frame(width: 250, height: 50)
                    } // 졸업유무 전공유형 스택
                    VStack(spacing: 1){
                        
                        HStack(spacing: 10){
                            if department {
                                Text("\(major1)")
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(width: 350, height: 50)
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .cornerRadius(10)
                            }
                            else if major_minor {
                                HStack{
                                    Menu("\(major1)") {
                                        Button("소프트웨어공학",
                                               action: { major1 = "소프트웨어공학"}
                                        )
                                        Button("정보통신공학",
                                               action: { major1 = "정보통신공학"})
                                        Button("컴퓨터공학",
                                               action: { major1 = "컴퓨터공학"})
                                        Button("인공지능",
                                               action: { major1 = "인공지능"})
                                    }
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(width: 170, height: 50)
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .cornerRadius(10)
                                    
                                    Menu("\(major2)") {
                                        Button("소프트웨어공학",
                                               action: { major2 = "소프트웨어공학"})
                                        Button("정보통신공학",
                                               action: { major2 = "정보통신공학"})
                                        Button("컴퓨터공학",
                                               action: { major2 = "컴퓨터공학"})
                                        Button("인공지능",
                                               action: { major2 = "인공지능"})
                                    }
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(width: 170, height: 50)
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .cornerRadius(10)
                                }
                            }
                            else if double_major{
                                HStack{
                                    Menu("\(major1)") {
                                        Button("소프트웨어공학",
                                               action: { major1 = "소프트웨어공학"})
                                        Button("정보통신공학",
                                               action: { major1 = "정보통신공학"})
                                        Button("컴퓨터공학",
                                               action: { major1 = "컴퓨터공학"})
                                        Button("인공지능",
                                               action: { major1 = "인공지능"})
                                    }
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(width: 170, height: 50)
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .cornerRadius(10)
                                    
                                    Menu("\(major2)") {
                                        Button("소프트웨어공학",
                                               action: { major2 = "소프트웨어공학"})
                                        Button("정보통신공학",
                                               action: { major2 = "정보통신공학"})
                                        Button("컴퓨터공학",
                                               action: { major2 = "컴퓨터공학"})
                                        Button("인공지능",
                                               action: { major2 = "인공지능"})
                                    }
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(width: 170, height: 50)
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .frame(width: 350, height: 50)
//                        HStack{ // 비밀번호 안내문구 출력
//                            if major1 == major2{
//                                Text(MarjorError)
//                                    .font(.system(size: 14))
//                                    .foregroundColor(.red)
//                            }
//                        }
                    }.padding(.bottom, 30)
                    Spacer()
                    Button(action: {
                        /**
                         let email: String
                         let password: String
                         let nickname: String
                         let graduate: Bool
                         let magor1: String
                         let magor2: String
                         let department: Bool
                         let major_minor: Bool
                         let double_major: Bool
                         */
                        if email != "" && password != "" && RepeatedPassword != "" && nickname != ""{
                            
                            let parameters: [String: Any] = ["email": email, "password": password, "checkpassword": RepeatedPassword, "nickname": nickname, "graduate": graduate, "magor1": major1, "major2": major2, "department": department, "major_minor": major_minor, "double_major": double_major]
                            
                            print(parameters)
                            api.Signup(parameters: parameters)
                            
                            // api 보냈으니까 text 비워주기
                            email = ""
                            password = ""
                            RepeatedPassword = ""
                            nickname = ""
                            date = ""
                        } else {
                            print("조건을 모두 입력하여주세요.")
                        }
                    }) {
                        Text("회원가입")
                            .frame(width: 330, height: 10)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.603, green: 0.756, blue: 0.819))
                            .cornerRadius(10)
                    }
                    
                }
                
            }//VStack 종료 부분
            //                .padding(.trailing, 30)
            //                .padding(.leading, 30) 임시로 블러처리
            
        }
    }
    
}
    struct SignupView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
    
