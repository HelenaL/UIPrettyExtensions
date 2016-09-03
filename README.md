# UIPrettyExtensions
UI extensions for iOS .

Elegant and usefull method for every project. Helps write more strongly typed code.

## How To Install
- Carthage - github "helenal/UIPrettyExtensions"
- Add as subproject/submodule
- Copy files into your project.

import UIPrettyExtensions

##UITableView & UICollectionView Extenstions
Use generic functions to use classes as reuse identifier.

``` swift
override func viewDidLoad() {
    tableView.registerNibCell(MyCustomTableCell.self)

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(MyCustomTableCell.self, forIndexPath: indexPath)

```

``` swift
override func viewDidLoad() {
    collectionView.registerNibCell(MyCustomCollectionCell.self)
    collectionView.registerNibFooter(MyCustomFooterView.self)

func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(MyCustomFooterView.self, forIndexPath: indexPath)


func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableFooter(MyCustomFooterView.self, forIndexPath: indexPath)

```

##Storyboard
Use enum for segue identifiers

``` swift
class ViewController: UIViewController, SegueHandlerType {
    enum SegueIdentifier: String {
        case ShowList
    }

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let segueIdentifier = segueIdentifierForSegue(segue)

    switch segueIdentifier {
        case .ShowList:

func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    self.performSegueWithIdentifier(SegueIdentifier.ShowList.rawValue, sender: indexPath)
```

##Colors
It's simple!

``` swift
let tintColor = UIColor.RGB(red: 251, green: 75, blue: 16)

let tintColor = UIColor.fromHex("E8E8E8")
```

##Requirements
iOS 8+



