//
//  MusicListTableViewCell.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 10/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {
    static let identifier = "MusicListTableViewCell"
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicSubTitleLabel: UILabel!
    
    func configureMusicCell(music: MusicResult) {
        musicImageView.downloaded(from: music.artworkUrl30 ?? Constant.defaultThumbImage, contentMode: .scaleAspectFill)
        musicTitleLabel.text = music.trackName
        musicSubTitleLabel.text = music.artistName
    }
}
