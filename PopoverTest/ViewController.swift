//
//  ViewController.swift
//  PopoverTest
//
//  Created by Chris Conover on 5/9/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        view.addSubview(button)
        view.backgroundColor = .white
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }

    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        button.backgroundColor = .blue
        button.setTitle("Show popover", for: .normal)
        button.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func didTap(sender: UIButton) {
        let presented = PresentedViewController()
        presented.modalPresentationStyle = .popover

        let popover = presented.popoverPresentationController!
        popover.delegate = self
        popover.sourceRect = sender.bounds
        popover.sourceView = sender
        popover.permittedArrowDirections = .up
        popover.backgroundColor = popover.presentedViewController.view.backgroundColor

        self.present(presented, animated: true, completion: {})
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}




class PresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        view.backgroundColor = .green
        view.addSubview(text)
        text.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        view.rightAnchor.constraint(equalTo: text.rightAnchor, constant: 20).isActive = true
        text.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        view.bottomAnchor.constraint(greaterThanOrEqualTo: text.bottomAnchor, constant: 50).isActive = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let size = view.system
    }

    lazy var text: UITextField = {
        let view = UITextField()
        view.text = "Placeholder"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
}


