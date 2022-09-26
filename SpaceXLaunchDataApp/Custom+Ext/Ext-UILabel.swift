//
//  Ext-UILabel.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/24/22.
//

import UIKit

extension UILabel {
    
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 22, weight: .heavy) , range: range)
        self.attributedText = attribute
    }
    
    func addSystemImage(imageName: String, afterLabel boolAfterLabel: Bool = false) {
        let attachment: NSTextAttachment = NSTextAttachment()
        
        attachment.image = UIImage(systemName: imageName)
        attachment.image = attachment.image?.withTintColor(.dynamicColor(light: .black, dark: .white))
        let attachmentString: NSAttributedString = NSAttributedString(attachment: attachment)

        if boolAfterLabel {
            let strLabelText: NSMutableAttributedString = NSMutableAttributedString(string: self.text!)
            strLabelText.append(attachmentString)
            self.attributedText = strLabelText
        } else {
            let strLabelText: NSAttributedString = NSAttributedString(string: self.text!)
            let mutableAttachmentString: NSMutableAttributedString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)
            self.attributedText = mutableAttachmentString
        }
    }

    func removeImage() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}
