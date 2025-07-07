import Foundation

class UserManager {
    private var loggedIn: Bool = falsess
    func login(username: String, password: String) -> Bool {
        if username == "test" && password == "1234" {
            loggedIn = true
            return true
        }
        return false
    }

    func logout() {
        loggedIn = false
    }

    func isLoggedIn() -> Bool {
        return loggedIn
    }
}
