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
//        self.networking.fakeGET("/list", fileName: "photos.json")
    }

    public func photos(completion: (error: NSError?) -> ()) {
        self.networking.GET("/list") { JSON, error in
            if let JSON = JSON as? [[String : AnyObject]] {
                Sync.changes(JSON, inEntityNamed: "Photo", dataStack: self.data, completion: { error in
                    completion(error: error)
                })
            } else {
                completion(error: error)
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        return self.data.mainContext
    }
}