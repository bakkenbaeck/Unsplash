import Foundation
import DATAStack
import Networking
import Sync
import DATASource
import CoreData

public class Fetcher {
    private var data: DATAStack
    private var networking: Networking

    init(baseURL: String, modelName: String) {
        self.data = DATAStack(modelName: modelName)
        self.networking = Networking(baseURL: baseURL)
    }

    public func getPhoto(completion: (error: NSError?) -> ()) {
        self.networking.GET("/100/100/?random") { JSON, error in
            if let JSON = JSON as? [[String : AnyObject]] {

            } else {
                completion(error: error)
            }
        }
    }
}