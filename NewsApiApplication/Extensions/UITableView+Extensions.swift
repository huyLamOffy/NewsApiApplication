//
//  UITableView+Extensions.swift
//  OkieLa Buyer
//
//  Created by OkieLa Dev on 3/19/20.
//  Copyright © 2020 OkieLa. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    ///Register cell nib with reuseIdentifier is cell id
    func onNibRegister<Cell: UITableViewCell>(type: Cell.Type)  {
        self.register(Cell.nib, forCellReuseIdentifier: Cell.cellId)
    }
    
    ///Register cell class with reuseIdentifier is cell id
    func onClassRegister<Cell : UITableViewCell>(type: Cell.Type)  {
        self.register(Cell.self, forCellReuseIdentifier: Cell.cellId)
    }
    
    ///Dequeue cell with reuseIdentifier is cell id
    func onDequeue<Cell : UITableViewCell>(idxPath : IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.cellId, for: idxPath) as? Cell else {
            fatalError("couldnt dequeue cell with identifier \(Cell.cellId)")
        }
        
        return cell
    }
    
    ///Register header footer view nib with reuseIdentifier is cell id
    func onNibRegisterHeaderFooterView<Cell: UITableViewHeaderFooterView>(type: Cell.Type)
    {
        register(type.nib, forHeaderFooterViewReuseIdentifier: type.cellId)
    }
    
    ///Register header footer view class with reuseIdentifier is cell id
    func onClassRegisterHeaderFooterView<Cell: UITableViewHeaderFooterView>(type: Cell.Type)
    {
        register(type, forHeaderFooterViewReuseIdentifier: type.cellId)
    }
    
    ///dequeue header footer view with reuseIdentifier is cell id
    func onDequeueReusableHeaderFooterView<Cell : UITableViewHeaderFooterView>() -> Cell {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: Cell.cellId) as? Cell else {
            fatalError("couldnt dequeue cell with identifier \(Cell.cellId)")
        }
        
        return cell
    }
}

extension UITableView {
    var headerHeight: CGFloat {
        get {
            return tableHeaderView?.frame.height ?? 0
        } set {
            tableHeaderView?.frame.size = CGSize(width: frame.width, height: newValue)
        }
    }
    
    var footerHeight: CGFloat {
        get {
            return tableFooterView?.frame.height ?? 0
        } set {
            tableFooterView?.frame.size = CGSize(width: frame.width, height: newValue)
        }
    }
}
