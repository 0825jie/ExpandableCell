//
//  Header.swift
//  Sample_TableView
//
//  Created by GetHired on 9/18/18.
//  Copyright © 2018 Esat Kemal Ekren. All rights reserved.
//

import UIKit

class Header: UIView {
    
    var text : String? {
        didSet{
            weekday.text = text
        }
    }
    
    var tg : Int?
    
    let vi : UIView = {
        let vi = UIView()
        vi.backgroundColor = .clear
        return vi
    }()
    
    var weekday : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let button : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setBackgroundImage(#imageLiteral(resourceName: "dot"), for: .normal)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        addSubview(vi)
        self.backgroundColor = UIColor(red: 0.9373, green: 0.9686, blue: 0.9529, alpha: 1.0)
        vi.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        vi.addSubview(weekday)
        weekday.anchor(top: nil, left: vi.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 500, height: 50, enableInsets: false)
        weekday.centerYAnchor.constraint(equalTo: vi.centerYAnchor).isActive = true
        
      
        vi.addSubview(button)
        button.anchor(top: nil, left: nil, bottom: nil, right: vi.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 20, height: 20, enableInsets: false)
        button.centerYAnchor.constraint(equalTo: vi.centerYAnchor).isActive = true
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
