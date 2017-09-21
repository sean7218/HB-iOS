//
//  ViewController.swift
//  XBourbon
//
//  Created by Sean Zhang on 9/6/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    static let themeBlue = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1) //#3da7f4
    var bourbons: [Bourbon]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.register(BourbonCollectionViewCell.self,
                                 forCellWithReuseIdentifier: "Cell")
        collectionView?.register(BourbonCollectionViewHeader.self,
                                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                 withReuseIdentifier: "Header")
        collectionView?.register(BourbonCollectionViewFooter.self,
                                 forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
                                 withReuseIdentifier: "Footer")
        collectionView?.backgroundColor = .white

        DispatchQueue.main.async {

            self.fetchBourbonFromAPI()

        }

    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bourbons?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BourbonCollectionViewCell
        cell.bourbon = (bourbons?[indexPath.row])!
        return cell
    }

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! BourbonCollectionViewHeader
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath) as! BourbonCollectionViewFooter
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    //https://s3.amazonaws.com/assets-images-seanz/bourbon.json
    //http://localhost:8181/v1/bourbon
    func fetchBourbonFromAPI() {
        Alamofire.request("http://localhost:8181/v1/bourbon").responseJSON { (response) in
            
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            //print("Data: \(response.data ?? Data())")                   // Give the size of the data
            
            if let data = response.data {
                let json = JSON(data: data)
                let bourbons = json.arrayValue.map({ (json) -> Bourbon in
                    let bourbon = Bourbon()
                    bourbon.name = json["name"].stringValue
                    bourbon.price = json["price"].doubleValue
                    bourbon.rating = json["rating"].intValue
                    bourbon.proof = json["proof"].doubleValue
                    bourbon.taste = json["taste"].stringValue
                    bourbon.imageUrl = json["imageUrl"].stringValue
                    return bourbon
                })
                
                self.bourbons = bourbons
                self.collectionView?.reloadData()
            } else {
                
            }
            
        }
    }
    
}






extension UIView {
    func constrain(top: NSLayoutAnchor<NSLayoutYAxisAnchor>, t: CGFloat, left: NSLayoutAnchor<NSLayoutXAxisAnchor>, l: CGFloat, width: CGFloat, height: CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: top , constant: t).isActive = true
        self.leftAnchor.constraint(equalTo: left, constant: l).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func constrain(bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>, right: NSLayoutAnchor<NSLayoutXAxisAnchor>, b: CGFloat, r: CGFloat) {
        
    }
    

    func anchor(top: NSLayoutAnchor<NSLayoutYAxisAnchor>?, bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>?, left: NSLayoutAnchor<NSLayoutXAxisAnchor>?, right: NSLayoutAnchor<NSLayoutXAxisAnchor>?, t: CGFloat, b: CGFloat, l: CGFloat, r: CGFloat, width: CGFloat, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let topConstraint = top {
            self.topAnchor.constraint(equalTo: topConstraint , constant: t).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: self.topAnchor, constant: t).isActive = true
        }
        if let bottomConstraint = bottom {
            self.bottomAnchor.constraint(equalTo: bottomConstraint , constant: b).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: b).isActive = true
        }
        if let leftConstraint = left {
            self.leftAnchor.constraint(equalTo: leftConstraint , constant: l).isActive = true
        } else {
            self.leftAnchor.constraint(equalTo: self.leftAnchor, constant: l).isActive = true
        }
        if let rightConstraint = right {
            self.rightAnchor.constraint(equalTo: rightConstraint , constant: r).isActive = true
        } else {
            self.rightAnchor.constraint(equalTo: self.rightAnchor, constant: r).isActive = true
        }

        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}





