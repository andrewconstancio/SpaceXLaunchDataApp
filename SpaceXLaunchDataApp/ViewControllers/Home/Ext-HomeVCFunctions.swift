//
//  Ext-homeVCFunctions.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/22/22.
//

import UIKit 

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.launches.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeCollectionView.deselectItem(at: indexPath, animated: true)
        guard let launch = homeViewModel.launches.value?[indexPath.row] else { return }
        self.delegate?.didSelectLaunch(launch: launch)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchHomeCell.identifier, for: indexPath) as! LaunchHomeCell
        
        // mission patch string url from model
        let patchURl = homeViewModel.launches.value?[indexPath.row].links?.missionPatchSmall ?? ""
        //convert mission patch string url to type URL
        let url = URL(string: patchURl)
        //set cell image to url image if available
        cell.launchImage.sd_setImage(with: url) { (image, error, cache, urls) in
            if (error != nil) {
                //set default image if patch mission image not available
                let origImage = UIImage(named: "rocketPlaceholder")?.withTintColor(.dynamicColor(light: .black, dark: .systemOrange))
                cell.launchImage.image = origImage
            } else {
                cell.launchImage.image = image
            }
        }
        // mission name info from model
        let missionName = homeViewModel.launches.value?[indexPath.row].missionName ?? ""
        // rocket name info from model
        let rocketName = homeViewModel.launches.value?[indexPath.row].rocket?.rocketName ?? ""
        // launch site name from model
        let launchSiteName = homeViewModel.launches.value?[indexPath.row].launchSite?.siteName ?? ""
        // launch date from model
        let isoDate = homeViewModel.launches.value?[indexPath.row].launchDateUTC ?? ""
        
        cell.missionNameLabel.text = missionName
        cell.rocketNameLabel.text = rocketName
        cell.launchSiteNameLabel.text = "\u{2000}\(launchSiteName)"
        cell.dateOfLaunchLabel.text = "\u{2000}\(isoDate.fromUTCToLocalDate())"
        cell.dateOfLaunchLabel.addSystemImage(imageName: "calendar", afterLabel: false)
        cell.launchSiteNameLabel.addSystemImage(imageName: "mappin.circle", afterLabel: false)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 16, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 1, left: 8, bottom: 1, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let homeHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellID, for: indexPath) as! HomeHeaderCell
        let section = indexPath.section
        if kind == UICollectionView.elementKindSectionHeader {
            if section == 0 {
                return homeHeader
            } else {
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 125)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
}
