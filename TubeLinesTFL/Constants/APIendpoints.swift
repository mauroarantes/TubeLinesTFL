//
//  APIendpoints.swift
//  TubeLinesTFL
//
//  Created by Mauro Arantes on 20/10/2023.
//

import Foundation

struct APIendpoints {
    static func getTubeLineEndpoint() -> String {
        guard let path = Bundle.main.path(forResource: "Credentials", ofType: "plist") else {
            print("Path not found")
            return ""
        }
        
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String:String] else {return ""}
        
        guard let apiEndpoint = plist["url"], let appId = plist["app_id"], let appKey = plist["app_key"] else {return ""}
        
        let urlString = "\(apiEndpoint)?app_id=\(appId)&app_key=\(appKey)"
        
        return urlString
    }
}
