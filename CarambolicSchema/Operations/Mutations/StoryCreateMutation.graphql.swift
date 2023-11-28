// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension CarambolicSchema {
  class StoryCreateMutation: GraphQLMutation {
    static let operationName: String = "StoryCreate"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation StoryCreate($input: StoryCreateInput!) { storyCreate(input: $input) { __typename story { __typename id title bookmark { __typename id thumbnail url title summary isTrue createdAt updatedAt } acts { __typename id image title body } } } }"#
      ))

    public var input: StoryCreateInput

    public init(input: StoryCreateInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: CarambolicSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { CarambolicSchema.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("storyCreate", StoryCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Create a story
      var storyCreate: StoryCreate? { __data["storyCreate"] }

      /// StoryCreate
      ///
      /// Parent Type: `StoryCreatePayload`
      struct StoryCreate: CarambolicSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { CarambolicSchema.Objects.StoryCreatePayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("story", Story?.self),
        ] }

        var story: Story? { __data["story"] }

        /// StoryCreate.Story
        ///
        /// Parent Type: `Story`
        struct Story: CarambolicSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { CarambolicSchema.Objects.Story }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", CarambolicSchema.ID.self),
            .field("title", String?.self),
            .field("bookmark", Bookmark?.self),
            .field("acts", [Act]?.self),
          ] }

          var id: CarambolicSchema.ID { __data["id"] }
          var title: String? { __data["title"] }
          var bookmark: Bookmark? { __data["bookmark"] }
          var acts: [Act]? { __data["acts"] }

          /// StoryCreate.Story.Bookmark
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

          /// StoryCreate.Story.Act
          ///
          /// Parent Type: `Act`
          struct Act: CarambolicSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { CarambolicSchema.Objects.Act }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", CarambolicSchema.ID.self),
              .field("image", String?.self),
              .field("title", String?.self),
              .field("body", String?.self),
            ] }

            var id: CarambolicSchema.ID { __data["id"] }
            var image: String? { __data["image"] }
            var title: String? { __data["title"] }
            var body: String? { __data["body"] }
          }
        }
      }
    }
  }

}