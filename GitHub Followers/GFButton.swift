//
//  GFButton.swift
//  GitHub Followers
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 07/12/2020.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(backgroundColour: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColour
        self.setTitle(title, for: .normal)
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(backgroundColour: UIColor, title: String) {
        self.backgroundColor = backgroundColour
        setTitle(title, for: .normal)
    }
}
