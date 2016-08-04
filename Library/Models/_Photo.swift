// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Photo.swift instead.

import Foundation
import CoreData

public enum PhotoAttributes: String {
    case author = "author"
    case author_url = "author_url"
    case filename = "filename"
    case format = "format"
    case height = "height"
    case id = "id"
    case post_url = "post_url"
    case width = "width"
}

public class _Photo: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Photo"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Photo.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var author: String?

    @NSManaged public
    var author_url: String?

    @NSManaged public
    var filename: String?

    @NSManaged public
    var format: String?

    @NSManaged public
    var height: NSNumber?

    @NSManaged public
    var id: NSNumber?

    @NSManaged public
    var post_url: String?

    @NSManaged public
    var width: NSNumber?

    // MARK: - Relationships

}

