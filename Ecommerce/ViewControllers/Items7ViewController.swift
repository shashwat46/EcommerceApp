//
//  Items7ViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.03.2021.
//

import DSKit
import DSKitFakery

open class Items7ViewController: DSViewController {
    
    var selectedFilter = "Jackets"
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Fashion"
        update()
        
        // Filter
        let filter = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down.circle.fill"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(openFilters))
        
        // Sort
        let sort = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease.circle.fill"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(openSort))
        
        navigationItem.rightBarButtonItems = [filter, sort]
    }
    
    // Call every time some data have changed
    func update() {
        show(content: productsSection())
    }
    
    @objc func openFilters() {
        self.dismiss()
    }
    
    @objc func openSort() {
        self.dismiss()
    }
}

// MARK: - Products

extension Items7ViewController {
    
    /// Products gallery
    /// - Returns: DSSection
    func productsSection() -> DSSection {
        
        // 1
        let product1 = product(title: "The Iconic Mesh Polo Shirt - All Fits",
                               description: "Polo Ralph Lauren",
                               image: p1Image)
        
        // 2
        let product2 = product(title: "Big Pony Mesh Polo Shirt",
                               description: "Stella McCarthney",
                               image: p2Image)
        
        // 3
        let product3 = product(title: "Mesh Long-Sleeve Polo Shirt – All Fits",
                               description: "Dolce & Gabbana",
                               image: p3Image)
        
        // 4
        let product4 = product(title: "Soft Cotton Polo Shirt - All Fits",
                               description: "Hermes",
                               image: p4Image)
        
        // 5
        let product5 = product(title: "Big Pony Mesh Polo Shirt",
                               description: "Arrmani",
                               image: p5Image)
        
        // 6
        let product6 = product(title: "Polo Team Mesh Polo Shirt",
                               description: "House & Versace",
                               image: p6Image)
        
        // 7
        let product7 = product(title: "Polo Team Mesh Polo Shirt",
                               description: "House & Versace",
                               image: p7Image)
        
        let section = [ product4, product1, product2, product3, product5, product6, product7].list()
        
        return section
    }
    
    /// Product
    /// - Parameters:
    ///   - title: String
    ///   - description: String
    ///   - image: URL?
    /// - Returns: DSViewModel
    func product(title: String, description: String, image: URL? = nil) -> DSViewModel {
        
        // Text
        let composer = DSTextComposer(alignment: .natural)
        composer.add(type: .headlineWithSize(17), text: title)
        composer.add(rating: 4,
                     maximumValue: 5,
                     positiveSymbol: "star.fill",
                     negativeSymbol: "star",
                     style: .small,
                     tint: .custom(.systemYellow), spacing: 3)
        
        composer.add(type: .subheadlineWithSize(11), text: " \(Int.random(in: 10...100)) reviews", newLine: false)
        composer.add(type: .subheadline, text: description)
        composer.add(price: DSPrice.random(), spacing: 4)
        
        // Action
        var action = composer.actionViewModel()
        action.topImage(url: image)
        action.height = .absolute(300)
        action.rightArrow()
        
        // Like button
        action.supplementaryItems = [likeButton()]
        
        // Handle did tap
        action.didTap { [unowned self] (_ :DSCardVM) in
            self.dismiss()
        }
        
        return action
    }
    
    /// Like button
    /// - Returns: DSSupplementaryView
    func likeButton() -> DSSupplementaryView {
        
        // Text
        let composer = DSTextComposer()
        composer.add(sfSymbol: "heart.fill",
                     style: .medium,
                     tint: .custom(Int.random(in: 0...1) == 0 ? .red : .white))
        
        // Action
        var action = DSActionVM(composer: composer)
        
        // Handle did tap
        action.didTap { [unowned self] (_: DSActionVM) in
            self.dismiss()
        }
        
        // Supplementary view
        let supView = DSSupplementaryView(view: action,
                                          position: .rightTop,
                                          background: .lightBlur,
                                          insets: .small,
                                          offset: .interItemSpacing,
                                          cornerRadius: .custom(10))
        return supView
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct Items7ViewControllerPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            
            let nav = DSNavigationViewController(rootViewController: Items7ViewController())
            PreviewContainer(VC: nav, BlackToneAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/4992628/pexels-photo-4992628.jpeg?cs=srgb&dl=pexels-rachel-claire-4992628.jpg&fm=jpg")

fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/4498211/pexels-photo-4498211.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4498211.jpg&fm=jpg")

fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/5368995/pexels-photo-5368995.jpeg?cs=srgb&dl=pexels-allan-mas-5368995.jpg&fm=jpg")
fileprivate let p4Image = URL(string: "https://images.pexels.com/photos/4245981/pexels-photo-4245981.jpeg?cs=srgb&dl=pexels-ketut-subiyanto-4245981.jpg&fm=jpg")

fileprivate let p5Image = URL(string: "https://images.pexels.com/photos/5157247/pexels-photo-5157247.jpeg?cs=srgb&dl=pexels-budgeron-bach-5157247.jpg&fm=jpg")

fileprivate let p6Image = URL(string: "https://images.pexels.com/photos/5093676/pexels-photo-5093676.jpeg?cs=srgb&dl=pexels-kamaji-ogino-5093676.jpg&fm=jpg")

fileprivate let p7Image = URL(string: "https://images.pexels.com/photos/4792529/pexels-photo-4792529.jpeg?cs=srgb&dl=pexels-anete-lusina-4792529.jpg&fm=jpg")
