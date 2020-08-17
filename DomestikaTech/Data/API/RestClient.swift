//
//  RestClient.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation
import Combine

protocol RestClientProtocol {
    var baseUrl: String { get }
    func perform<T: Decodable>(_ router: DomestikaAPIRouter, _ decoder: JSONDecoder) -> AnyPublisher<T, Error>
}

struct RestClient: RestClientProtocol {

    internal var baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func perform<T: Decodable>(_ router: DomestikaAPIRouter, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {

        let request = asURLRequest(router: router)

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> T in
                let value = try decoder.decode(T.self, from: result.data)
                return value }
            .mapError { error in
                print(error)
                return error }
            .eraseToAnyPublisher()
    }

    private func asURLRequest(router: DomestikaAPIRouter) -> URLRequest {
        let path = "\(baseUrl)\(router.path)"
        var components = URLComponents(string: path)
        components?.queryItems = router.quertItems

        var urlRequest = URLRequest(url: (components?.url)!)
        urlRequest.httpMethod = router.method

        return urlRequest
    }
}
