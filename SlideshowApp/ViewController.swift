//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mac on 2020/10/17.
//  Copyright © 2020 03pink12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func unwind(_ segue: UIStoryboardSegue) {//戻るボタンのためのsegue
      if timerSwitch == true {
          self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
          toggleButton.setTitle("停止", for: .normal)// ボタンの名前を停止に変える
          prevButton.isEnabled = false
          nextButton.isEnabled = false
      }
    }
    @IBAction func GoDetail(_ sender: Any) {//imageViewを覆うやつ
    }
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var nowIndex:Int = 0// 配列に指定するindex番号を宣言
    var imageArray:[UIImage] = [// スライドショーさせる画像の配列を宣言
        UIImage(named: "bird1")!,
        UIImage(named: "bird2")!,
        UIImage(named: "bird3")!
    ]
    
    var timerSwitch:Bool = false
    
    //timer
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[nowIndex]
        //imageView.contentMode = UIView.ContentMode.scaleAspectFill
    }
   
    
    //timer
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 2
    }

    //戻るボタン
    @IBAction func prevSlide(_ sender: Any) {
        nowIndex -= 1// indexを減らす表示する画像を切り替える
        if (nowIndex < 0) {// indexが表示予定の画像の数と同じ場合
            nowIndex = imageArray.count - 1// indexを一番最初の数字に戻す
        }
        imageView.image = imageArray[nowIndex] // indexの画像をstoryboardの画像にセットする
        //imageView.contentMode = UIView.ContentMode.scaleAspectFill
     }
    
    //次へボタン
    @IBAction func nextSlide(_ sender: Any) {
        nowIndex += 1// indexを増やして表示する画像を切り替える
        if (nowIndex == imageArray.count) {// indexが表示予定の画像の数と同じ場合
            nowIndex = 0// indexを一番最初の数字に戻す
        }
        imageView.image = imageArray[nowIndex] // indexの画像をstoryboardの画像にセットする
        //imageView.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    //再生/停止ボタン
    @IBAction func toggleSlide(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            toggleButton.setTitle("停止", for: .normal)// ボタンの名前を停止に変える
            prevButton.isEnabled = false
            nextButton.isEnabled = false
        }else{
            self.timer.invalidate()
            self.timer = nil
            toggleButton.setTitle("再生", for: .normal)
            prevButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }
    
    @objc func changeImage() {
        nowIndex += 1// indexを増やして表示する画像を切り替える
        if (nowIndex == imageArray.count) {// indexが表示予定の画像の数と同じ場合
            nowIndex = 0// indexを一番最初の数字に戻す
        }
        imageView.image = imageArray[nowIndex] // indexの画像をstoryboardの画像にセットする
        //imageView.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DetailViewController:DetailViewController = segue.destination as! DetailViewController
        DetailViewController.imageNumber = nowIndex
        if self.timer == nil {
            timerSwitch = false
        }else{
            self.timer.invalidate()
            self.timer = nil
            toggleButton.setTitle("再生", for: .normal)
            prevButton.isEnabled = true
            nextButton.isEnabled = true
            timerSwitch = true
        }
    }
    
  
    

    
}

