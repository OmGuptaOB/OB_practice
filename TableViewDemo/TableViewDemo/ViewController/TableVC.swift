//
//  ViewController.swift
//  TableViewDemo
//
//  Created by OBMac-13 on 13/02/26.
//

import UIKit

class TableVC: UIViewController {

    // MARK: - Outlets & Data
    @IBOutlet weak var tableViewMain: UITableView!

    /// Multi-section data store. Each inner array is one section (max 5 rows).
    var sections: [[String]] = [
        ["Apple", "Banana", "Mango", "Orange", "Grapes"]
    ]

    var arr1     = ["Rahul",   "Shubham", "Rohit", "Vishal", "Amit"]
    var arr2     = ["ios",     "swift",   "node",  "java",   "c#"]
    var imagearr = [
        #imageLiteral(resourceName: "engin_akyurt-coffee-2242213_1920"),
        #imageLiteral(resourceName: "bedrck-interior-1961070_1920"),
        #imageLiteral(resourceName: "kaboompics-coffee-791045_1920"),
        #imageLiteral(resourceName: "theglassdesk-turntable-1337986_1920"),
        #imageLiteral(resourceName: "Layer_1")
    ]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewMain.delegate   = self
        tableViewMain.dataSource = self
        tableViewMain.dragDelegate = self
        tableViewMain.dropDelegate = self
        tableViewMain.isEditing = false


        self.navigationItem.title = "Guest profile"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic

        tableViewMain.register(UINib(nibName: "TableVcCell", bundle: nil),
                               forCellReuseIdentifier: "TableVcCell")
        setupTable()
        setupHeaderFooter()
        
        tableViewMain.allowsMultipleSelectionDuringEditing = true
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Edit",
                            style: .plain,
                            target: self,
                            action: #selector(toggleEditing))

        navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "Delete",
                            style: .done,
                            target: self,
                            action: #selector(deleteSelectedRows))


    }
    @objc func toggleEditing() {

        tableViewMain.isEditing.toggle()

        navigationItem.rightBarButtonItem?.title =
            tableViewMain.isEditing ? "Done" : "Edit"
    }
    @objc func deleteSelectedRows() {

        guard let selectedIndexPaths =
                tableViewMain.indexPathsForSelectedRows else { return }

        // Sort DESCENDING to prevent index crash
        let sorted = selectedIndexPaths.sorted {
            if $0.section == $1.section {
                return $0.row > $1.row
            }
            return $0.section > $1.section
        }

        tableViewMain.performBatchUpdates({

            for indexPath in sorted {

                sections[indexPath.section].remove(at: indexPath.row)

                tableViewMain.deleteRows(at: [indexPath],
                                         with: .automatic)
            }

            // Remove empty sections also
            for i in (0..<sections.count).reversed() {

                if sections[i].isEmpty {
                    sections.remove(at: i)

                    tableViewMain.deleteSections(
                        IndexSet(integer: i),
                        with: .automatic)
                }
            }

        })
    }


    // MARK: - Setup
    func setupTable() {
        tableViewMain.allowsSelection              = true
        tableViewMain.rowHeight                    = 90
        tableViewMain.fillerRowHeight              = 0
        tableViewMain.cellLayoutMarginsFollowReadableWidth = true
        tableViewMain.insetsContentViewsToSafeArea = true
        tableViewMain.sectionHeaderHeight          = 30   // taller so section labels show
        tableViewMain.sectionFooterHeight          = 0
        tableViewMain.sectionHeaderTopPadding      = 0
        tableViewMain.separatorStyle               = .singleLine
        tableViewMain.separatorColor               = UIColor.green
        tableViewMain.separatorEffect              = UIBlurEffect(style: .extraLight)
        tableViewMain.separatorInsetReference      = .fromCellEdges
        
        // Enable long-press drag
        tableViewMain.dragInteractionEnabled = true
    }

    func setupHeaderFooter() {
        // HEADER VIEW
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 35))
        headerView.backgroundColor = .systemPink

        // FOOTER VIEW
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        footerView.backgroundColor = .systemGreen

        func makeButton(title: String, in parent: UIView) -> UIButton {
            let btn = UIButton(frame: parent.bounds)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.red, for: .highlighted)
            btn.tintColor = .white
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            return btn
        }

        let removeBtn = makeButton(title: "REMOVE ITEM", in: headerView)
        removeBtn.addTarget(self, action: #selector(removeSection(_:)), for: .touchUpInside)

        let addBtn = makeButton(title: "Add More", in: footerView)
        addBtn.addTarget(self, action: #selector(addSection(_:)), for: .touchUpInside)

        headerView.addSubview(removeBtn)
        footerView.addSubview(addBtn)

        tableViewMain.tableHeaderView = headerView
        tableViewMain.tableFooterView = footerView
    }

    // MARK: - Add / Remove Actions

    /// Adds one item to the last section.
    /// If that section already has 5 rows, a new section is created.
    @objc func addSection(_ sender: Any) {
        // ✅ Guard: if all sections were removed, create the first one fresh
        if sections.isEmpty {
            sections.append(["New Item"])
            tableViewMain.performBatchUpdates {
                tableViewMain.insertSections(IndexSet(integer: 0), with: .automatic)
                tableViewMain.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
            return
        }

        let lastIdx = sections.count - 1

        if sections[lastIdx].count >= 5 {
            // Last section full → create a new section with the new item
            let newSectionIdx = sections.count
            sections.append(["New Item"])
            tableViewMain.performBatchUpdates {
                tableViewMain.insertSections(IndexSet(integer: newSectionIdx), with: .automatic)
                tableViewMain.insertRows(at: [IndexPath(row: 0, section: newSectionIdx)],
                                         with: .automatic)
            }
        } else {
            sections[lastIdx].append("New Item")
            let newRow = sections[lastIdx].count - 1
            tableViewMain.performBatchUpdates {
                tableViewMain.insertRows(at: [IndexPath(row: newRow, section: lastIdx)],
                                         with: .automatic)
            }
        }
    }

    /// Removes the first item from section 0.
    /// If section 0 becomes empty it is removed entirely.
    @objc func removeSection(_ sender: Any) {
        guard !sections.isEmpty, sections[0].count > 0 else { return }

        sections[0].remove(at: 0)

        if sections[0].isEmpty {
            sections.remove(at: 0)
            tableViewMain.performBatchUpdates {
                tableViewMain.deleteSections(IndexSet(integer: 0), with: .fade)
            }
        } else {
            tableViewMain.performBatchUpdates {
                tableViewMain.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
            }
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension TableVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "TableVcCell",
                                                     for: indexPath) as! TableVcCell
        let row = indexPath.row % arr1.count
        cell.productImage.layer.cornerRadius = 10
        cell.productImage.image = imagearr[row]
        cell.productTitle.text  = arr1[row]
        cell.productDescription.text = arr2[row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let desc = storyboard?.instantiateViewController(withIdentifier: "DecriptonVC") as! DecriptonVC
        let row       = indexPath.row % arr1.count
        desc.imag     = imagearr[row]
        desc.desc     = arr2[row]
        desc.titleprod = arr1[row]

        tableViewMain.allowsMultipleSelection = true
//        self.navigationController?.pushViewController(desc, animated: true)
        tableViewMain.deselectRow(at: indexPath, animated: true)
    }
        
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat { return 30 }

    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return "  Section \(section + 1)"
    }

    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        cell.alpha     = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 30)
        UIView.animate(withDuration: 0.4) {
            cell.alpha     = 1
            cell.transform = .identity
        }
    }
}

// MARK: - UITableViewDragDelegate
extension TableVC: UITableViewDragDelegate {

    func tableView(_ tableView: UITableView,
                   itemsForBeginning session: UIDragSession,
                   at indexPath: IndexPath) -> [UIDragItem] {
        let item         = sections[indexPath.section][indexPath.row]
        let provider     = NSItemProvider(object: item as NSString)
        let dragItem     = UIDragItem(itemProvider: provider)
        // Store the source IndexPath so we can remove it during drop
        dragItem.localObject = indexPath
        return [dragItem]
    }
}

// MARK: - UITableViewDropDelegate
extension TableVC: UITableViewDropDelegate {

    /// Allow drops anywhere in the table
    func tableView(_ tableView: UITableView,
                   canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }

    /// Show the insertion indicator while dragging
    func tableView(_ tableView: UITableView,
                   dropSessionDidUpdate session: UIDropSession,
                   withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        // .move keeps the nice "lift + move" animation
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }

    /// Perform the actual move when the finger lifts
    func tableView(_ tableView: UITableView,
                   performDropWith coordinator: UITableViewDropCoordinator) {

        // We only handle local drags (within the same table)
        for item in coordinator.items {
            guard
                let sourceIndexPath = item.dragItem.localObject as? IndexPath,
                let destinationIndexPath = coordinator.destinationIndexPath
            else { continue }

            // Don't move to the same position
            if sourceIndexPath == destinationIndexPath { continue }

            let movedItem = sections[sourceIndexPath.section][sourceIndexPath.row]

            tableViewMain.performBatchUpdates {
                // 1. Remove from source
                sections[sourceIndexPath.section].remove(at: sourceIndexPath.row)

                // 2. Insert into destination
                //    Adjust destination row if same section and we removed above it
                var adjustedDestination = destinationIndexPath
                if sourceIndexPath.section == destinationIndexPath.section &&
                   sourceIndexPath.row < destinationIndexPath.row {
                    adjustedDestination = IndexPath(row: destinationIndexPath.row - 1,
                                                    section: destinationIndexPath.section)
                }

                // Clamp row to valid range (handles drops at end of section)
                let destSection = adjustedDestination.section
                let destRow     = min(adjustedDestination.row, sections[destSection].count)
                sections[destSection].insert(movedItem, at: destRow)

                tableViewMain.deleteRows(at: [sourceIndexPath], with: .automatic)
                tableViewMain.insertRows(at: [IndexPath(row: destRow, section: destSection)],
                                         with: .automatic)
            }

            // Animate the drop with the system "snap" animation
            coordinator.drop(item.dragItem,
                             toRowAt: IndexPath(row: min(destinationIndexPath.row,
                                                         sections[destinationIndexPath.section].count - 1),
                                                section: destinationIndexPath.section))
        }
    }
    
    //editing
    
//    func tableView(_ tableView: UITableView,
//    didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
//
//        print("Multi selection started")
//
//        tableView.setEditing(true, animated: true)
//    }
    
//    func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
//
//        print("Multi selection ended")
//
//        if let selected = tableView.indexPathsForSelectedRows {
//            print("Selected Rows Count:", selected.count)
//        }
//    }
    func tableView(_ tableView: UITableView,
                   willBeginEditingRowAt indexPath: IndexPath) {

        print("User started editing row at: \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView,
                   didEndEditingRowAt indexPath: IndexPath?) {

        print("User finished editing")
    }
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath)
    -> UITableViewCell.EditingStyle {

        return .delete
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            tableView.performBatchUpdates({

                // 1️⃣ Update Data Source FIRST
                sections[indexPath.section].remove(at: indexPath.row)

                // 2️⃣ Delete Row
                tableView.deleteRows(at: [indexPath], with: .fade)

                // 3️⃣ If section becomes empty → delete section
                if sections[indexPath.section].isEmpty {

                    sections.remove(at: indexPath.section)

                    tableView.deleteSections(IndexSet(integer: indexPath.section),
                                             with: .automatic)
                }

            })
        }
    }
    
    func tableView(_ tableView: UITableView,
                   performPrimaryActionForRowAt indexPath: IndexPath) {

        let desc = storyboard?
            .instantiateViewController(withIdentifier: "DecriptonVC")
            as! DecriptonVC

        desc.imag = imagearr[indexPath.row]
        desc.desc = arr2[indexPath.row]
        desc.titleprod = arr1[indexPath.row]

        navigationController?.pushViewController(desc, animated: true)
    }




}
