//
//  MusicListDataModel.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 11/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import Foundation

protocol MusicListDataSource: AnyObject {
    func didReceiveMusicListData(from dataModel: MusicList )
}

class MusicListDataModel {
    weak var dataSource: MusicListDataSource?
    
    func fetchMusicListFromServer() {
        APIManager.shared.fetchData(url: Constant.baseURL, header: nil, method: "GET"){[weak self] data, error in
            
            let decoder = JSONDecoder()
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let musicList = try decoder.decode(MusicList.self, from: data)
                self?.dataSource?.didReceiveMusicListData(from: musicList)
            }catch let err{
                print(err)
            }
            
        }
    }
}
