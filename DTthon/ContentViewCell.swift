//
//  ContentViewCell.swift
//  My_Project
//
//  Created by SPURGE on 15/04/23.
//

import UIKit

class ContentViewCell: UITableViewCell {
    
    @IBOutlet weak var imgVw: UIImageView!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var topTxtVw: UITextView!
    
    @IBOutlet weak var scndLbl: UILabel!
    
    @IBOutlet weak var scndTxtVw: UITextView!
    @IBOutlet weak var trdLbl: UILabel!
    @IBOutlet weak var trdTxtVw: UITextView!
    var viewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func clickBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondVc") as! SecondVc
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
