//
//  GlobalFunctions.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/26/23.
//

import Foundation

func mainThreadExecute(execute: @escaping () -> Void) {
    DispatchQueue.main.async {
        execute()
    }
}
