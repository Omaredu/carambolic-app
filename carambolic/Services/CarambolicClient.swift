//
//  CarambolicClient.swift
//  carambolic
//
//  Created by Omar Sánchez on 27/11/23.
//

import Foundation
import Apollo

struct CarambolicClient {
    public static let client: ApolloClient = {
        let url = URL(string: "https://carambolic-backend.up.railway.app/graphql")!

        class MyInterceptor: ApolloInterceptor {
            let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOnsiaWQiOjEsIm5hbWUiOiJqdWFuIiwiZW1haWwiOiJqdWFuQG1haWwuY29tIiwidXNlcm5hbWUiOm51bGwsImNyZWF0ZWRfYXQiOiIyMDIzLTExLTIxVDIyOjQ4OjMzLjY5MloiLCJ1cGRhdGVkX2F0IjoiMjAyMy0xMS0yMVQyMjo0ODozMy42OTJaIn19.8LqqcCdYGnrbwlzr53mkrLvB2xD8KAHsKHbwHLAGa2A"
            var id: String = ""
            
            func interceptAsync<Operation: GraphQLOperation>(
                chain: RequestChain,
                request: HTTPRequest<Operation>,
                response: HTTPResponse<Operation>?,
                completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
                
                request.addHeader(name: "Authorization", value: "Bearer \(token)")

                chain.proceedAsync(request: request, response: response, completion: completion)
            }
        }

        class MyInterceptorProvider: DefaultInterceptorProvider {
            override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
                var interceptors = super.interceptors(for: operation)
                interceptors.insert(MyInterceptor(), at: 0)
                return interceptors
            }
        }

        let store = ApolloStore()

        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: MyInterceptorProvider(store: .init()),
            endpointURL: url
        )

        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
}
