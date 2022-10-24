//
//  TableViewCell.swift
//  Avito Trainee
//
//  Created by packovv on 24.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let reuseId: String = "cell"
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name: "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    private let phoneNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "Phone Number: "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    private let skillsLabel : UILabel = {
        let label = UILabel()
        label.text = "Skills: "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()


    private let phoneNumber: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let skills: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var employee: Employee? {
        didSet {
            name.text = employee?.name
            phoneNumber.text = employee?.phoneNumber
            skills.text = employee?.skills.sorted().joined(separator: ", ")
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(phoneNumberLabel)
        addSubview(skillsLabel)
        addSubview(name)
        addSubview(phoneNumber)
        addSubview(skills)
     
        nameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 0, width: 110, height: 0, enableInsets: false)
        phoneNumberLabel.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 0, width: 110, height: 0, enableInsets: false)
        skillsLabel.anchor(top: phoneNumber.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 0, width: 110, height: 0, enableInsets: false)
        
        name.anchor(top: topAnchor, left: nameLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 16, width: frame.size.width / 2, height: 0, enableInsets: false)
        phoneNumber.anchor(top: name.bottomAnchor, left: phoneNumberLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 16, width: frame.size.width / 2, height: 0, enableInsets: false)
        skills.anchor(top: phoneNumber.bottomAnchor, left: skillsLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 16, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
