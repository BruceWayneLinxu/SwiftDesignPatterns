// singleton
import Darwin

class BoardGameManager {
	static let sharedInstance = BoardGameManager()
	init() {
		print("Singleton initialized")
	}
}