//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 浅野総一郎 on 2021/10/10.
//

import UIKit
import FirebaseStorageUI


class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentLineField: UILabel!
    @IBOutlet weak var commentOwner: UILabel!
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

        // PostDataの内容をセルに表示
        func setPostData(_ postData: PostData) {
            // 画像の表示
            postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpeg")
            postImageView.sd_setImage(with: imageRef)

            // キャプションの表示
            self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"

            // 日時の表示
            self.dateLabel.text = ""
            if let date = postData.date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm"
                let dateString = formatter.string(from: date)
                self.dateLabel.text = dateString
            }
            
            //コメントの表示
            
            
            //コメント投稿者の表示

            // いいね数の表示
            let likeNumber = postData.likes.count
            likeLabel.text = "\(likeNumber)"

            // いいねボタンの表示
            if postData.isLiked {
                let buttonImage = UIImage(named: "like_exist")
                self.likeButton.setImage(buttonImage, for: .normal)
            } else {
                let buttonImage = UIImage(named: "like_none")
                self.likeButton.setImage(buttonImage, for: .normal)
            }
        }
}
