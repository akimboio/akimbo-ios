# Akimbo Framework

A collection of IOS classes,categories, and utility files that improves upon existing classes and improves development time drastically. 
These files are used internally for all akimbo IOS projects.

# Examples

Examples can be found in the examples directory, to see the examples just run the examples target in the ios simulator

# Components

## AkimboDataStore

Provides an interface for storing any sort of object that contains data that needs to be used at a later time. These data stores are used extensively throughout the akimbo core framework.
They are integrated tightly with the table and table sections. The data stores allow for adding and removing objects and giving feedback to whatever needs to listen and perform actions when data has been altered.

## AkimboUITableViewController

Provides a cleaner and easier to use API then that of UITableViewController, and is used directly with AkimboUITableViewControllerSection.
The AkimboUITableViewController uses the built in API and adds a section layer on top of it, all the table API calls that occur are automatically forwarded to the appropriate section.

## AkimboUITableViewControllerSection

AkimboUITableViewControllerSection is used and managed by a AkimboUITableViewController instance. Sections allows for all logic to be contained within a single namespace allowing the application to be more flexible, readable, and maintainable.
Sections also take advantage of the AkimboDataStore which automatically grabs the correct data without the developer having to figure out which record of data is associated with which table cell, all this is handled internally by the section.
Creating and reusing table cells is also handled automatically by the section, all the developer has to do is set which cell class the section should use.
