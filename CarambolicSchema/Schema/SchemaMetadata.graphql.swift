// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol CarambolicSchema_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == CarambolicSchema.SchemaMetadata {}

protocol CarambolicSchema_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == CarambolicSchema.SchemaMetadata {}

protocol CarambolicSchema_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == CarambolicSchema.SchemaMetadata {}

protocol CarambolicSchema_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == CarambolicSchema.SchemaMetadata {}

extension CarambolicSchema {
  typealias ID = String

  typealias SelectionSet = CarambolicSchema_SelectionSet

  typealias InlineFragment = CarambolicSchema_InlineFragment

  typealias MutableSelectionSet = CarambolicSchema_MutableSelectionSet

  typealias MutableInlineFragment = CarambolicSchema_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return CarambolicSchema.Objects.Query
      case "Bookmark": return CarambolicSchema.Objects.Bookmark
      case "Story": return CarambolicSchema.Objects.Story
      case "Act": return CarambolicSchema.Objects.Act
      case "Mutation": return CarambolicSchema.Objects.Mutation
      case "StoryCreatePayload": return CarambolicSchema.Objects.StoryCreatePayload
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}