//
//  APIServiceLocator.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

class APIServiceLocator: BaseCoreServiceLocator {

    func provideRestClient(baseURL: String) -> RestClient {
        return RestClient(baseUrl: baseURL)
    }
}
