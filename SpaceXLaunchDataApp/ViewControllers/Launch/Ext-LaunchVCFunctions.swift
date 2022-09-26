//
//  Ext-LaunchVCFunctions.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/25/22.
//

import UIKit

extension LaunchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchDetailBodyCell.identifer, for: indexPath) as! LaunchDetailBodyCell
        
        // mission patch string url from model
        let patchURl = launch?.links?.missionPatchSmall ?? ""
        //convert mission patch string url to type URL
        let url = URL(string: patchURl)
        //set cell image to url image if available
        cell.patchImage.sd_setImage(with: url) { (image, error, cache, urls) in
            if (error != nil) {
                //set default image if patch mission image not available
                let origImage = UIImage(named: "rocketPlaceholder")?.withTintColor(.dynamicColor(light: .black, dark: .systemOrange))
                cell.patchImage.image = origImage
            } else {
                cell.patchImage.image = image
            }
        }
        
        let rocketName = launch?.rocket?.rocketName ?? ""
        let coreSerial = launch?.rocket?.firstStage?.cores?[0].coreSerial ?? ""
        let coreBlock = launch?.rocket?.firstStage?.cores?[0].block ?? 0
        let coreFlight = launch?.rocket?.firstStage?.cores?[0].flight ?? 0
        let payLoadSubInfo = launch?.rocket?.secondStage?.payloads?[0].payloadID ?? "-"
        let customer = launch?.rocket?.secondStage?.payloads?[0].customers?[0] ?? "-"
        let payloadType = launch?.rocket?.secondStage?.payloads?[0].payloadType ?? "-"
        let payloadMass = launch?.rocket?.secondStage?.payloads?[0].payloadMassLbs ?? 0
        let payloadNationality = launch?.rocket?.secondStage?.payloads?[0].nationality ?? "-"
        let payloadOrbit = launch?.rocket?.secondStage?.payloads?[0].orbit ?? "-"
        let missionDetails = launch?.details ?? "-"
        
        cell.rocketNameLabel.text = rocketName
        cell.coreInfoLabel.text = "Core\u{2000}\u{2000}Flight \(coreFlight) \u{2022} Block \(coreBlock) - \(coreSerial)"
        cell.coreInfoLabel.halfTextColorChange(fullText: cell.coreInfoLabel.text ?? "", changeText: "Core")
        cell.payloadCustomerInfoLabel.text = customer
        cell.payloadInfoSubLabel.text = payLoadSubInfo
        cell.payloadTypeInfoLabel.text = payloadType
        cell.payloadMassInfoLabel.text = "\(payloadMass) lbs"
        cell.payloadNationalityInfoLabel.text = payloadNationality
        cell.payloaOrbitInfoLabel.text = payloadOrbit
        cell.missionInfoTextView.text = missionDetails
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LaunchDetailHeaderCell.identifier, for: indexPath) as! LaunchDetailHeaderCell
        let section = indexPath.section
        if kind == UICollectionView.elementKindSectionHeader {
            if section == 0 {
                    let isoDate = launch?.launchDateUTC ?? ""
                    let siteName = launch?.launchSite?.siteName ?? ""
                    headerCell.missionNameLabel.text = launch?.missionName
                    headerCell.launchSiteNameLabel.text = "\u{2000}\(siteName)"
                    headerCell.dateOfLaunchLabel.text = "\u{2000}\(isoDate.fromUTCToLocalDate())"
                    headerCell.dateOfLaunchLabel.addSystemImage(imageName: "calendar", afterLabel: false)
        
                    let successOfLaunch  = launch?.launchSuccess ?? false
                    if successOfLaunch {
                        headerCell.successFailLabel.text = "Success"
                        headerCell.successFailLabel.backgroundColor = .systemGreen
                    } else {
                        headerCell.successFailLabel.text = "Fail"
                        headerCell.successFailLabel.backgroundColor = .systemRed
                    }
        
                    headerCell.playerView.load(withVideoId: self.launch?.links?.youtubeID ?? "")
                return headerCell
            } else {
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 440)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
}
