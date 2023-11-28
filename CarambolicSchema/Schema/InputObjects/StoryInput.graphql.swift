// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension CarambolicSchema {
  struct StoryInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      isPublic: Bool,
      bookmarkId: ID
    ) {
      __data = InputDict([
        "isPublic": isPublic,
        "bookmarkId": bookmarkId
      ])
    }

    var isPublic: Bool {
      get { __data["isPublic"] }
      set { __data["isPublic"] = newValue }
    }

    var bookmarkId: ID {
      get { __data["bookmarkId"] }
      set { __data["bookmarkId"] = newValue }
    }
  }

}