# Akimbo Framework

A collection of IOS classes,categories, and utility files that improves upon existing classes and improves development time drastically. 
These files are used internally for all akimbo IOS projects.

## AkimboDataStore

Provides an interface for storing objects that represent models. These data stores can be used throughout the akimbo core framework.
They are integrated tightly with the table and table sections. The data stores allow for adding and removing objects and giving feedback to whatever needs to listen and perform actions when data has been altered.

## AkimboUITableViewController

Provides a cleaner and easier to use API then that of UITableViewController. Used directly with AkimboUITableViewControllerSection.
The AkimboUITableViewController uses the built in API and adds a section layer on top of it. All API calls that occur on the table are automatically forwarded to the appropriate section.

## AkimboUITableViewControllerSection

AkimboUITableViewControllerSection is used and managed by a AkimboUITableViewController instance. This section allows for all logic to be contained within a single object.
Sections work beautifully for cells and data that need to appear in multiple places throughout the application, but not necessarily within the exact same table everytime.
Sections also take advantage of the AkimboDataStore which allows the easy access to the data each cell we are working with.
