// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension CarambolicSchema {
  class GetAllBookmarksQuery: GraphQLQuery {
    static let operationName: String = "GetAllBookmarks"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetAllBookmarks { bookmarks { __typename id thumbnail url title summary isTrue createdAt updatedAt } }"#
      ))

    public init() {}

    struct Data: CarambolicSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { CarambolicSchema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("bookmarks", [Bookmark].self),
      ] }

      /// Find all bookmarks
      var bookmarks: [Bookmark] { __data["bookmarks"] }

      /// Bookmark
      ///
      /// Parent Type: `Bookmark`
      struct Bookmark: CarambolicSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { CarambolicSchema.Objects.Bookmark }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", CarambolicSchema.ID.self),
          .field("thumbnail", String?.self),
          .field("url", String?.self),
          .field("title", String?.self),
          .field("summary", String?.self),
          .field("isTrue", Bool?.self),
          .field("createdAt", CarambolicSchema.ISO8601DateTime.self),
          .field("updatedAt", CarambolicSchema.ISO8601DateTime.self),
        ] }

        var id: CarambolicSchema.ID { __data["id"] }
        var thumbnail: String? { __data["thumbnail"] }
        var url: String? { __data["url"] }
        var title: String? { __data["title"] }
        var summary: String? { __data["summary"] }
        var isTrue: Bool? { __data["isTrue"] }
        var createdAt: CarambolicSchema.ISO8601DateTime { __data["createdAt"] }
        var updatedAt: CarambolicSchema.ISO8601DateTime { __data["updatedAt"] }
      }
    }
  }

}