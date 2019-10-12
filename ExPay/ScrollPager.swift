//
//  ScrollPager.swift
//  ExPay
//
//  Created by Ника Перепелкина on 08/10/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

@objc public protocol ScrollPagerDelegate: NSObjectProtocol {
    @objc optional func scrollPager(scrollPager: ScrollPager, changedIndex: Int)
}

@IBDesignable public class ScrollPager: UIView, UIScrollViewDelegate{
    
    private var selectedIndex = 0
    private let indicatorView = UIView()
    private var buttons = [UIButton]()
    private var views = [UIView]()
    private var views2 = [UIView]()
    private var views3 = [UIView]()
    private var animationInProgress = false
    @IBOutlet public weak var delegate: ScrollPagerDelegate!
    
    @IBOutlet public var scrollView: UIScrollView? {
        didSet {
            scrollView?.delegate = self
            scrollView?.isPagingEnabled = true
            scrollView?.showsHorizontalScrollIndicator = false
            scrollView?.backgroundColor = UIColor(patternImage: UIImage(named: "MaskGroup4")!)
        }
    }

    // для работы кнопок
    func getCurrentIndex() -> Int {
        return selectedIndex
    }
    
    // настройки отображения вкладок
    @IBInspectable public var textColor: UIColor = UIColor.lightGray {
        didSet { redrawComponents() }
    }
    
    @IBInspectable public var selectedTextColor: UIColor = UIColor.white {
        didSet { redrawComponents() }
    }
    
    @IBInspectable public var font: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet { redrawComponents() }
    }
    
    @IBInspectable public var selectedFont: UIFont = UIFont.boldSystemFont(ofSize: 14) {
        didSet { redrawComponents() }
    }
    
    @IBInspectable public var indicatorColor: UIColor = UIColor.white {
        didSet { indicatorView.backgroundColor = indicatorColor }
    }
    
    @IBInspectable public var indicatorIsAtBottom: Bool = true {
        didSet { redrawComponents() }
    }
    
    @IBInspectable public var indicatorSizeMatchesTitle: Bool = false {
        didSet { redrawComponents() }
    }
    
    @IBInspectable public var indicatorHeight: CGFloat = 2.0 {
        didSet { redrawComponents() }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        didSet { self.layer.borderColor = borderColor?.cgColor }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet { self.layer.borderWidth = borderWidth }
    }
    
    @IBInspectable public var animationDuration: CGFloat = 0.2
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        redrawComponents()
    }

    // отображение сегментов и вью
    public func addSegmentsWithTitlesAndViews(segments: [(title: String, view: UIView, view2: UIView, view3: UIView)]) {
        
        addButtons(titleOrImages: segments.map { $0.title as AnyObject })
        addViews(segmentViews: segments.map { $0.view }, segmentViews2: segments.map { $0.view2 }, segmentViews3: segments.map { $0.view3 })
        redrawComponents()
    }
    
    public func setSelectedIndex(index: Int, animated: Bool) {
        setSelectedIndex(index: index, animated: animated, moveScrollView: true)
        
    }

    private func setSelectedIndex(index: Int, animated: Bool, moveScrollView: Bool) {
        selectedIndex = index
        
        moveToIndex(index: index, animated: animated, moveScrollView: moveScrollView)
    }
    
    private func addViews(segmentViews: [UIView], segmentViews2: [UIView], segmentViews3: [UIView]) {
        guard let scrollView = scrollView else { fatalError("trying to add views but the scrollView is nil") }
        
        for view in scrollView.subviews {
            view.removeFromSuperview()
        }
        for view2 in scrollView.subviews {
            view2.removeFromSuperview()
        }
        for view3 in scrollView.subviews {
            view3.removeFromSuperview()
        }
        for i in 0..<segmentViews.count {
            let view = segmentViews[i]
            scrollView.addSubview(view)
            views.append(view)
        }
        for i in 0..<segmentViews2.count {
            let view2 = segmentViews2[i]
            scrollView.addSubview(view2)
            views2.append(view2)
        }
        for i in 0..<segmentViews3.count {
            let view3 = segmentViews3[i]
            scrollView.addSubview(view3)
            views3.append(view3)
        }
    }
    
    // добавление вкладок в массив
    private func addButtons(titleOrImages: [AnyObject]) {
        for button in buttons {
            button.removeFromSuperview()
        }
        buttons.removeAll()
        
        for i in 0..<titleOrImages.count {
            let button = UIButton(type: .custom)
            button.tag = i
            button.addTarget(self, action: #selector(ScrollPager.buttonSelected(sender:)), for: .touchUpInside)
            buttons.append(button)
            
            if let title = titleOrImages[i] as? String {
                button.setTitle(title, for: .normal)
            }
            else if let image = titleOrImages[i] as? UIImage {
                button.setImage(image, for: .normal)
            }
            addSubview(button)
            addSubview(indicatorView)
        }
    }

    private func moveToIndex(index: Int, animated: Bool, moveScrollView: Bool) {
        animationInProgress = true
        
        UIView.animate(withDuration: animated ? TimeInterval(animationDuration) : 0.0, delay: 0.0, options: .curveEaseOut, animations: { [weak self] in
            
            guard let strongSelf = self else { return }
            let width = strongSelf.frame.size.width / CGFloat(strongSelf.buttons.count)
            let button = strongSelf.buttons[index]
            
            strongSelf.redrawButtons()
            
            let indicatorY: CGFloat = strongSelf.indicatorIsAtBottom ? strongSelf.frame.size.height - strongSelf.indicatorHeight : 0
            
            if strongSelf.indicatorSizeMatchesTitle {
                guard let string = button.titleLabel?.text else { fatalError("missing title on button, title is required for width calculation") }
                guard let font = button.titleLabel?.font else { fatalError("missing dont on button, title is required for width calculation")  }
                let size = string.size(withAttributes: [NSAttributedString.Key.font: font])
                let x = width * CGFloat(index) + ((width - size.width) / CGFloat(2))
                strongSelf.indicatorView.frame = CGRect(x: x, y: indicatorY, width: size.width, height: strongSelf.indicatorHeight)
            }
            else {
                strongSelf.indicatorView.frame = CGRect(x: width * CGFloat(index), y: indicatorY, width: button.frame.size.width, height: strongSelf.indicatorHeight)
            }
            
            if let scrollView = strongSelf.scrollView {
                if moveScrollView {
                    scrollView.contentOffset = CGPoint(x: CGFloat(index) * scrollView.frame.size.width, y: 0)
                }
            }
            
            }, completion: { [weak self] finished in
                self?.animationInProgress = false
        })
    }
    
    private func redrawComponents() {
        redrawButtons()
        
        if buttons.count > 0 {
            moveToIndex(index: selectedIndex, animated: false, moveScrollView: false)
        }
        if let scrollView = scrollView {
            scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(buttons.count), height: scrollView.frame.size.height)
            
            for i in 0..<views.count {
                views[i].frame = CGRect(x: scrollView.frame.size.width * CGFloat(i), y: -10, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
                views2[i].frame = CGRect(x: scrollView.frame.size.width * CGFloat(i) + 15, y: 55, width: 230, height: 15)
                views3[i].frame = CGRect(x: scrollView.frame.size.width * CGFloat(i), y: 95, width: 350, height: 20)
            }
        }
    }
    
    private func redrawButtons() {
        if buttons.count == 0 {
            return
        }
        let width = frame.size.width / CGFloat(buttons.count)
        let height = frame.size.height - indicatorHeight
        let y: CGFloat = indicatorIsAtBottom ? 0 : indicatorHeight
        
        for i in 0..<buttons.count {
            let button = buttons[i]
            button.frame = CGRect(x: width * CGFloat(i), y: y, width: width, height: height)
            button.setTitleColor((i == selectedIndex) ? selectedTextColor : textColor, for: .normal)
            button.titleLabel?.font = (i == selectedIndex) ? selectedFont : font
        }
    }
    
    @objc internal func buttonSelected(sender: UIButton) {
        if sender.tag == selectedIndex {
            return
        }
        delegate?.scrollPager?(scrollPager: self, changedIndex: sender.tag)
        setSelectedIndex(index: sender.tag, animated: true, moveScrollView: true)
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !animationInProgress {
            var page = scrollView.contentOffset.x / scrollView.frame.size.width
            
            if page.truncatingRemainder(dividingBy: 1) > 0.5 {
                page = page + CGFloat(1)
            }
            if Int(page) != selectedIndex {
                setSelectedIndex(index: Int(page), animated: true, moveScrollView: false)
                delegate?.scrollPager?(scrollPager: self, changedIndex: Int(page))
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
}


//         //   let frame1 = CGRect(x: 20, y: 20, width: 45, height: 45)
//       let button = buttonViews[i]
////  let button = UIButton(frame: frame1)

// //   button.imageView?.image = UIImage(named: "home")
//   // button.setTitle("asdfasdf", for: .normal)
//    button.backgroundColor = UIColor.yellow
//  button.setImage(UIImage(named: "home"), for: .normal)
//  scrollView.addSubview(button)
//  buttons2.append(button)
// //////////////
