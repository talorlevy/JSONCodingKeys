//
//  ViewController.swift
//  JsonDataExample
//
//  Created by Talor Levy on 2/8/23.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: @IBOutlet
    
    @IBOutlet weak var objectTableView: UITableView!
    
    var viewModel: ObjectViewModel?
    var objectArray: [ObjectModel] = []
    var singleObject: ObjectModel = ObjectModel()
    var transcodingArray: [TranscodingModel] = []
    var objectTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ObjectViewModel()
        viewModel?.fetchUsersData {
            DispatchQueue.main.async {
                self.objectArray = self.viewModel?.objectArray ?? []
                self.singleObject = self.objectArray[0]
                self.objectTitle = self.singleObject.title
                for item in self.singleObject.transcodings ?? [] {
                    self.transcodingArray.append(item)
                }
                self.objectTableView.reloadData()
            }
        }
    }
}


// MARK: UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transcodingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "objectCell") as? ObjectTableViewCell else { return UITableViewCell() }
        let transcoding = transcodingArray[indexPath.row]
        cell.titleLabel.text = "Title: \(objectTitle ?? "")"
        cell.transcodingIdLabel.text = "TranscodingId: \(transcoding.transcodingId ?? "")"
        cell.widthLabel.text = "Width: \(transcoding.width ?? 0)"
        cell.heightLabel.text = "Height: \(transcoding.height ?? 0)"
        return cell
    }
}


// MARK: UITableViewCell

class ObjectTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var transcodingIdLabel: UILabel!
}
