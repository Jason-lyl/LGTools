//
//  UICollectionView+Extension.swift
//  SmartBookingIOS
//
//  Created by dun on 2019/1/21.
//  Copyright © 2019 Duntech. All rights reserved.
//

import Foundation

extension UICollectionView {
    
    func registerClassOf<T: UICollectionViewCell>(_: T.Type){
        
        register(T.self, forCellWithReuseIdentifier: T.hy_reuseIdentifier)
    }
    
    func registerHeaderFooterClassOf<T: UICollectionReusableView>(_: T.Type){
        
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.hy_reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, indexpath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.hy_reuseIdentifier, for: indexpath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.hy_reuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueHeaderFooterClassOf<T: UICollectionReusableView>(_: T.Type, kind: String, indexpath: IndexPath) -> T {
        
        guard let headerFooterView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.hy_reuseIdentifier, for: indexpath) as? T else {
            fatalError("Could not dequeue supplementaryView with identifier: \(T.hy_reuseIdentifier)")
        }
        return headerFooterView
    }
   
}
