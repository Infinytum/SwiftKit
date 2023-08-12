//
//  URLSession.swift
//  
//
//  Created by Nila on 12.08.2023.
//

import Foundation

public extension URLSession {
    /// Execute any URLRequest synchronously by making use of a semaphore to wait for the asynchronous task to finish
    /// NOT RECOMMENDED, Use asynchronous request whereever possible.
    func synchronousDataTask(urlrequest: URLRequest) -> (data: Data?, response: URLResponse?, error: Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?

        let semaphore = DispatchSemaphore(value: 0)

        let dataTask = self.dataTask(with: urlrequest) {
            data = $0
            response = $1
            error = $2

            semaphore.signal()
        }
        dataTask.resume()

        _ = semaphore.wait(timeout: .distantFuture)

        return (data, response, error)
    }
}
