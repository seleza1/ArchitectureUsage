//
//  NetworkService.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], NetworkError>) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], NetworkError>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/comments"

        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.invalidURL))
                return
            }

            do {
                let json = try JSONDecoder().decode([Comment].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
