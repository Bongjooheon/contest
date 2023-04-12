//
//import SwiftUI
//import Foundation
//import Alamofire
//
//struct Route_type: Codable, Identifiable {
//    let id: Int
//    let title: String
//    let department: String
//    let date: String
//    let usernickname: String
//    let routeInfo: String
//    let recommendation: String
//    
//    static func getRouteDetail(id: String, completion: @escaping (Result<Route_type, Error>) -> Void) {
//        let url = "http://skhuaz.duckdns.org/detail/route/\(id)"
//        
//        AF.request(url).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
//                    let decoder = JSONDecoder()
//                    let route = try decoder.decode(Route_type.self, from: jsonData)
//                    completion(.success(route))
//                } catch {
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
//
//struct Route_Detail: View {
//    let route: Route_type
//    
//    var body: some View {
//        VStack {
//            Text("\(route.usernickname)님은 지금 \(route.date) 학기입니다.")
//                .font(.system(size: 17))
//                .padding(.top, 20)
//            
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.black, lineWidth: 2)
//                .frame(width: 370, height: 400)
//                .padding(5)
//                .overlay(content: {
//                    VStack(content: {
//                        Rectangle().fill(Color(hex: 0xEFEFEF))
//                            .frame(width: 350, height: 40)
//                            .cornerRadius(10)
//                            .overlay(content: {
//                                HStack {
//                                    Text("\(route.title)")
//                                        .foregroundColor(Color.black)
//                                        .font(.system(size: 15))
//                                        .padding(.leading, 17)
//                                    Spacer()
//                                }
//                            })
//                        
//                        Rectangle().fill(Color(hex: 0xEFEFEF))
//                            .frame(width: 350, height: 40)
//                            .cornerRadius(10)
//                            .overlay(content: {
//                                HStack {
//                                    Text("\(route.department)")
//                                        .foregroundColor(Color.black)
//                                        .font(.system(size: 15))
//                                        .padding(.leading, 17)
//                                    Spacer()
//                                }
//                            })
//                        
//                        Rectangle().fill(Color(hex: 0xEFEFEF))
//                            .frame(width: 350, height: 40)
//                            .cornerRadius(10)
//                            .overlay(content: {
//                                HStack {
//                                    Text("\(route.usernickname)").font(.system(size: 15))
//                                        .padding(.leading)
//                                    Spacer()
//                                    Text("\(route.date)").font(.system(size: 15))
//                                        .padding(.horizontal)
//                                }
//                            })
//                        
//                        Rectangle().fill(Color(hex: 0xEFEFEF))
//                            .frame(width: 350, height: 60)
//                            .cornerRadius(10)
//                            .overlay(content: {
//                                HStack {
//                                    Text("\(route.routeInfo)").font(.system(size: 15))
//                                }
//                            })
//                        
//                        Text("\(route.recommendation)")
//                            .font(.system(size: 15))
//                            .padding(.bottom, 90)
//                            .frame(width: 350, height: 160)
//                            .background(Color(hex: 0xEFEFEF))
//                            .cornerRadius(10)
//                    })
//                })
//        }
//        Rectangle().fill(Color(hex: 0xEFEFEF))
//            .frame(width: 350, height: 40)
//            .cornerRadius(10)
//            .overlay(content: {
//                HStack {
//                    Text("목록으로")
//                        .foregroundColor(Color.black)
//                        .font(.system(size: 15))
//                }
//            })
//        Spacer()
//    }
//}
//        
////
////struct Root_Detail_Previews: PreviewProvider {
////    static var previews: some View {
////        Root_Detail()
////    }
////}
