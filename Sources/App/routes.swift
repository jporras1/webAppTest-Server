import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    //Generic Struct that will be a json object.
    struct User: Content {
        var name: String
        var email: String
    }
    
        // Basic JSON "Hello, world!" example
    router.get("user") { req -> User in
        return User(
            name: "Vapor User",
            email: "user@vapor.codes"
        )
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
