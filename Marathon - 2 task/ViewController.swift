//
//  ViewController.swift
//  Marathon - 2 task
//
//  Created by Виталий Троицкий on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {
    


    var button1: MyButton = {
        var button = MyButton(text: "маленькая")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var button2: MyButton = {
        var button = MyButton(text: "средняя кнопка")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var button3: MyButton = {
        var button = MyButton(text: "большая прибольшая кнопка")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    
    
    @objc func tupOnNextScen() {
        let controller = SecondViewController()
        self.present(controller, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        setupView()
        setupConstraints()
 
        button3.addTarget(self, action: #selector(tupOnNextScen), for: .touchUpInside)
    }
    
    private func setupView() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),

  
            
        ])
    }

}


class MyButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
    let text = text
        configuration = UIButton.Configuration.filled()
         backgroundColor = .link
         setTitleColor(.white, for: .highlighted)
         setTitle(text, for: .normal)
         setImage(UIImage(systemName: "arrow.forward.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        
                 
         configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
         semanticContentAttribute = .forceRightToLeft
         configuration?.imagePadding = 8
        layer.cornerRadius = 5
        sizeToFit()
        imageView?.contentMode = .scaleAspectFit
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIButton.animate(withDuration: 0.7) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIButton.animate(withDuration: 0.7) {
            self.transform = CGAffineTransform.identity


        }
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return self.layer.presentation()?.hitTest(self.convert(point, to: superview)).flatMap { _ in return self } ?? nil
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        switch tintAdjustmentMode {
        case.dimmed:
            self.backgroundColor = .gray
            self.layer.cornerRadius = 5
        default:
            self.backgroundColor = .clear
        }
    }
    
}
