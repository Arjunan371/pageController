//
//  TextViewController.swift
//  pageController
//
//  Created by Digival on 14/08/23.
//

import UIKit

class TextViewController: UIViewController {
    let myText: String?
    private let mytextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 24)
        textView.textColor = .black
        return textView
    }()
    init(with text: String){
        self.myText = text
        mytextView.text = self.myText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.mytextView)
        view.backgroundColor = .green
        mytextView.layer.cornerRadius = 10
        mytextView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
             mytextViewConstraint()
    }
    
    func mytextViewConstraint() {
        NSLayoutConstraint.activate([
            mytextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            mytextView.topAnchor.constraint(equalTo: pageView.topAnchor, constant: 30),
            mytextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            mytextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
}
