//
//  HomeVc.swift
//  My_Project
//
//  Created by SPURGE on 15/04/23.
//

import UIKit

class HomeVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var TableView: UITableView!
    var imagee = [UIImage]()
    var ResponseDatas = [Welcome]()
    var countt = 0
    var link = "https://dtthon.deepthought.education/assets/uploads/files/others/project.v2.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ContentViewCell", bundle: nil)
        self.TableView.register(nib, forCellReuseIdentifier: "ContentViewCell")
        self.APICalling() { [weak self] responseData in
            self?.ResponseDatas = responseData
            DispatchQueue.main.sync{
                print("this is the lenght \(self!.ResponseDatas[0].response.data.count)")
                self?.countt = self!.ResponseDatas[0].response.data.count
                    self?.TableView.reloadData()
                }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = TableView.dequeueReusableCell(withIdentifier: "ContentViewCell", for: indexPath) as! ContentViewCell
        var imaggee : UIImage!
        let imageUrlString = ResponseDatas[0].response.data[indexPath.row].recruiter.picture
        let imageUrl = URL(string: imageUrlString)
                let session = URLSession.shared
        let task = session.dataTask(with: imageUrl!) { data, response, error in
                    if let error = error {
                        print("Error downloading image: \(error.localizedDescription)")
                        return
                    }
                    guard let data = data, let image = UIImage(data: data) else {
                        print("Invalid image data")
                        return
                    }
            imaggee = image
            DispatchQueue.main.sync {
                cell.imgVw.image = image
            }
            
                }
                task.resume()
        let obj = ResponseDatas[0].response.data[indexPath.row]
        cell.topLbl.text = obj.recruiter.username
        cell.topTxtVw.text = obj.shortDescription
        cell.scndLbl.text = "Score ID: \(obj.scorecardID ?? 1234)"
        cell.scndTxtVw.text = obj.scorecardTitle
        cell.trdLbl.text = obj.title
        cell.trdTxtVw.text = obj.description
        cell.viewController = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell is clicked")
        let storyboard = UIStoryboard(name: "Main", bundle: nil) 
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondVc") as! SecondVc
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    func APICalling(completion: @escaping ([Welcome]) -> Void) {
        let url = URL(string: link)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                let jsonStr = String(data: data, encoding: .utf8)
                print(jsonStr!)
                let data = jsonStr!.data(using: .utf8)
                let decoder = JSONDecoder()
                let decodeData = try! decoder.decode(Welcome.self, from: data!)
                completion([decodeData])
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
 
}


