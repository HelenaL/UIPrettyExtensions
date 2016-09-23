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
    tableView.registerNibCell(nibClass: MyCustomTableCell.self)

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(className: MyCustomTableCell.self, for: indexPath)

```

``` swift
override func viewDidLoad() {
    collectionView.registerNibCell(nibClass: MyCustomCollectionCell.self)
    collectionView.registerNibFooter(nibClass: MyCustomFooterView.self)


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(className: MyCustomFooterView.self, for: indexPath)


func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableFooter(className: MyCustomFooterView.self, for: indexPath)

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

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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



