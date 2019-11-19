//
//  ViewController.swift
//  CameraProject
//
//  Created by 家田真帆 on 2019/11/19.
//  Copyright © 2019 家田真帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // カメラボタン
    @IBAction func runCamera(_ sender: UIButton) {
        // ユーザーがカメラの使用を許可したかチェック
        // 許可している場合、カメラの画面を作成
        // カメラ画面を表示
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラが許可されている場合
            print("カメラは許可されています。")
            
            // カメラの画面を作成
            // UIImagePickerController() : カメラ or アルバムの画面を担当
            let cameraView = UIImagePickerController()
            cameraView.sourceType = .camera
            cameraView.delegate = self
            
            // カメラ画面を表示
            present(cameraView, animated: true, completion: nil)
        } else {
            // カメラが許可されていない場合
            
            print("カメラは許可されていません。")
        }
    }
    
    // アルバムボタン
    @IBAction func showAlbum(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // アルバムの使用が許可されている場合
            // アルバムの画面を作成
            let albumView = UIImagePickerController()
            albumView.sourceType = .photoLibrary
            albumView.delegate = self
            
            // アルバムの画面を表示
            present(albumView,animated: true, completion: nil)
        }
    }
    
    // 保存ボタン
    @IBAction func savePhoto(_ sender: UIButton) {
        
        // 画面に表示されている画像を取得
        let displayImage = imageView.image
        
        
        // 画像が空(nil)出ない場合
        
        // 画像をアルバムに保存する
        // UIImageWriteToSavedPhotosAlbum(
        // アルバムに保存する画像!,
        // self,
        // 保存後に実行して欲しいメソッドの名前
        // nil)
        
        if displayImage != nil {
            UIImageWriteToSavedPhotosAlbum(displayImage!, self, nil, nil)
        }
        // 画像をアルバムに保存する
        
        
    }
    
    
    // 写真撮影 or アルバムでの写真選択が完了した時に実行される
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 写真が存在する場合
        // その写真を画面に表示する
        // 表示されているカメラ or アルバムの画面を閉じる
        
        if let pickedImage = info[.originalImage] as? UIImage {
            // 写真が存在する場合、変数pickedImageにその写真が渡される
            
            // その写真を画面に表示する
            imageView.image = pickedImage
            
        }
        
        // picker : カメラ or アルバム画面
        // dismiss : 画面を閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
}

