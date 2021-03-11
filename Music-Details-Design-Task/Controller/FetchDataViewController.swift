//
//  FetchDataViewController.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 11/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class FetchDataViewController: UIViewController, MusicListDataSource {
    let musicListDataModel = MusicListDataModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fetch"
        musicListDataModel.dataSource = self
    }

    @IBAction func fetchMusic(_ sender: Any) {
        musicListDataModel.fetchMusicListFromServer()
    }

    func didReceiveMusicListData(from dataModel: MusicList) {
        DispatchQueue.main.async {
            if let musicResult = dataModel.results,
                let musicListViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MusicListViewController")
                as? MusicListViewController {
                musicListViewController.musicList = musicResult

                self.navigationController?.pushViewController(musicListViewController, animated: true)
            }
        }
    }
}
