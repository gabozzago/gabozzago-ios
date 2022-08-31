import UIKit
import GoogleSignIn

final class LoginViewModel: baseViewModel{
    
    let signInConfig = GIDConfiguration.init(clientID: "972483262448-voo2oik79u7cob8pc78jca1kqmnacp3q.apps.googleusercontent.com")
     
     func tokenSign(idToken: String) {
             guard let authData = try? JSONEncoder().encode(["idToken": idToken]) else {
                 return
             }
             let url = URL(string: "http://10.53.68.24:8080/auth/oauth")!
             var requst = URLRequest(url: url)
             requst.httpMethod = "POST"
             requst.setValue("application/json", forHTTPHeaderField: "Content-type")
             
             let task = URLSession.shared.uploadTask(with: requst, from: authData) { data, response, eroor in
                 print(response)
             }
             task.resume()
         }
}
