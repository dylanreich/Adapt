//
//  API.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

class API: NSObject {
    static let sharedInstance = API()
    
    static let serverUrl = ""
    
    func createThread(thread: Thread, completionHandler: @escaping (Bool, Thread?, Error?) -> ()) {
        var request = URLRequest(url: URL(string: API.serverUrl + "api/users/register")!)
        request.httpMethod = "POST"
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        do {
            let data = try JSONEncoder().encode(thread)
            
            request.httpBody = data
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    completionHandler(false, nil, error)
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                    completionHandler(false, nil, error)
                    return
                }
                
                do {
                    let thread = try JSONDecoder().decode(Thread.self, from: data)
                    
                    completionHandler(true, thread, nil)
                } catch {
                    print(error)
                    completionHandler(false, nil, error)
                }
            }
            task.resume()
        }
        catch {
            print(error)
            completionHandler(false, nil, error)
        }
    }
}
