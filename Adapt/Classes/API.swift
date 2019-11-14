//
//  API.swift
//  Adapt
//
//  Created by Dylan Reich on 11/6/19.
//  Copyright © 2019 Dylan Reich. All rights reserved.
//

import Disk

class API: NSObject {
    static let sharedInstance = API()
    
    static let serverUrl = ""
    
    func performRequest<T: Codable>(endpoint: String, method: String, authenticated: Bool = true, object: T?, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = URL(string: API.serverUrl + endpoint) else {
            print("error generating url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if authenticated {
            request.addAuthToken()
        }
        
        if let object = object {
            do {
                let data = try JSONEncoder().encode(object)
                request.httpBody = data
            } catch {
                print(error)
                completionHandler(nil, nil, error)
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                completionHandler(nil, response, error)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                if httpStatus.statusCode == 401 && authenticated {
                    DispatchQueue.main.async { [weak self] in
                        self?.setWelcomeScreenAsRoot()
                    }
                }
                completionHandler(data, response, error)
                return
            }
            
            completionHandler(data, response, error)
        }
        task.resume()
    }

    func performRequest(endpoint: String, method: String, authenticated: Bool = true, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        return performRequest(endpoint: endpoint, method: method, object: Object.Nil, completionHandler: completionHandler)
    }
    
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
                guard let data = data, error == nil else {
                    print("error=\(String(describing: error))")
                    completionHandler(false, nil, error)
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
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
    
    func setWelcomeScreenAsRoot() {
        
    }
}

extension URLRequest {
    mutating func addAuthToken() {
        let token = try? Disk.retrieve("token", from: .applicationSupport, as: Token.self)
        if let token = token {
            addValue("Bearer \(token.value)", forHTTPHeaderField: "Authorization")
        }
    }
}
