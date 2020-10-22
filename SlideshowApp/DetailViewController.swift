//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by mac on 2020/10/19.
//  Copyright © 2020 03pink12. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    //拡大する画像番号を取得
    var imageNumber:Int = 0
    
    var imageArray:[UIImage] = [// スライドショーさせる画像の配列を宣言
        UIImage(named: "bird1")!,
        UIImage(named: "bird2")!,
        UIImage(named: "bird3")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        detailImageView.image = imageArray[imageNumber]
        detailImageView.contentMode = UIView.ContentMode.scaleAspectFill
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
