//
//  MemoListCell.swift
//  Map Journal
//
//  Created by 원현식 on 2021/04/15.
//

import UIKit
import SnapKit
import Then

class MemoListCell: UITableViewCell {
  
  static let reuseIdentifier = String(describing: MemoListCell.self)
  
  private let title = UILabel()
  private let dateLabel = UILabel()
  private let emojiContainer = UIStackView()
  private let feeling = UILabel()
  private let weather = UILabel()
  private let memo = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayout()
    setupAttribute()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func setupLayout() {
    contentView.addSubview(title)
    contentView.addSubview(dateLabel)
    contentView.addSubview(feeling)
    contentView.addSubview(weather)
    contentView.addSubview(emojiContainer)
    contentView.addSubview(memo)
    
    title.snp.makeConstraints { make in
      make.top.equalTo(contentView.snp.top).offset(16)
      make.left.equalTo(contentView.snp.left).offset(16)
      make.right.equalTo(contentView).offset(-16)
      make.height.equalTo(20)
    }
    
    dateLabel.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom)
      make.left.equalTo(contentView.snp.left).offset(16)
      make.height.equalTo(30)
      make.width.equalTo(170)
    }
    
    feeling.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom)
      make.left.equalTo(dateLabel.snp.right).offset(5)
      make.height.equalTo(30)
      make.width.equalTo(feeling.snp.height)

    }
    
    weather.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom)
      make.left.equalTo(feeling.snp.right)
      make.height.equalTo(30)
      make.width.equalTo(feeling.snp.height)

    }
    

    memo.snp.makeConstraints { make in
      make.top.equalTo(dateLabel.snp.bottom).offset(5)
      make.left.equalTo(contentView.snp.left).offset(16)
      make.right.bottom.equalTo(contentView).offset(-16)
      
    }
  }
  
  private func setupAttribute() {
    emojiContainer.do {
      $0.distribution = .fillEqually
      $0.axis = .horizontal
      $0.spacing = 10
    }
    
    title.do {
      $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    dateLabel.do {
      $0.textColor = UIColor.gray
    }
    
    memo.do {
      $0.numberOfLines = 0
    }
  
  }
  
  func update(_ viewData: MemoViewData) {
    self.title.text = viewData.title
    self.dateLabel.text = viewData.date
    self.feeling.text = viewData.feeling
    self.weather.text = viewData.weather
    self.memo.text = viewData.memo
  }
  
}
