//
//  UICollectionView+Extensions.swift
//  OkieLa Buyer
//
//  Created by OkieLa Dev on 3/19/20.
//  Copyright © 2020 OkieLa. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    ///Register cell nib with reuseIdentifier is cell id
    func onNibRegister< T : UICollectionViewCell>(type: T.Type)  {
        self.register(T.nib, forCellWithReuseIdentifier: T.cellId)
    }
    
    ///Register cell class with reuseIdentifier is cell id
    func onClassRegister< T : UICollectionViewCell>(type: T.Type)  {
        self.register(type, forCellWithReuseIdentifier: T.cellId)
    }
    
    ///Dequeue cell with reuseIdentifier is cell id
    func onDequeue< T : UICollectionViewCell>(idxPath : IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.cellId, for: idxPath) as? T else {
            fatalError("couldnt dequeue cell with identifier \(T.nibName)")
        }
        
        return cell
    }
    
    ///Register supplementary view nib with reuseIdentifier is cell id
    func onNibRegisterView<T: UICollectionReusableView>(type: T.Type, forSupplementaryViewOfKind kind: String)
    {
        register(type.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.cellId)
    }
    
    ///Register supplementary view class with reuseIdentifier is cell id
    func onClassRegisterView<T: UICollectionReusableView>(type: T.Type, forSupplementaryViewOfKind kind: String)
    {
        register(type, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.cellId)
    }
    
    ///dequeue supplementary view with reuseIdentifier is cell id
    func onDequeueReusableSupplementaryViewOfKind< T : UICollectionReusableView>(kind: String, idxPath : IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.cellId, for: idxPath) as? T else {
            fatalError("couldnt dequeue cell with identifier \(T.nibName)")
        }
        
        return view
    }
}

