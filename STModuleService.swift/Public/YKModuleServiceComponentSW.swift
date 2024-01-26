//
//  YKModuleServiceComponentSW.swift
//  Pods
//
//  Created by stephen.chen on 2022/11/13.
//

import Foundation

@_exported import STComponentTools.STModuleService

public extension STModuleService {
    /**
     注册服务
     @param cls 服务类
     @param proto 服务协议
     @param err 错误信息
     */
    @discardableResult func stRegistModule<T>(_ service: AnyClass, protocol proto: T.Type, err:NSErrorPointer?)->Bool{
        var errBack: NSError? = nil
        if(Self.checkConfirmProtocol(cls: service, proto: proto, errBack: err) == false){
            return false
        }
        
        let result = STModuleServiceRegisterName(service, Self.getProtoName(proto: proto), &errBack)
        err??.pointee = errBack
        return result
    }
    
    /**
     获取服务
     
     @param proto 服务协议
     @param error 错误信息
     */
    @discardableResult func stModule<T>(protocol proto: T.Type, error: NSErrorPointer?)->AnyClass?{
        var errBack: NSError? = nil
        let result: AnyClass? = stModuleServiceWithProtocolName(Self.getProtoName(proto: proto), &errBack)
        error??.pointee = errBack
        if result == nil {
            return nil
        }
        
        if result is T {
            return result
        }else{
            return nil
        }
    }
}

private extension STModuleService {
    private static func getProtoName<T>(proto: T)->String {
        var proName = ""
        if proto is Protocol {
            proName = NSStringFromProtocol(proto as! Protocol)
        }else{
            proName = String.init(describing: proto)
        }
        
        if let idx = proName.firstIndex(of: ".") {
            let start = proName.index(idx, offsetBy: 1)
            return String(proName[start..<proName.endIndex])
        }else{
            return proName
        }
    }
    
    private static func checkConfirmProtocol<T>(cls: AnyClass, proto: T.Type, errBack: NSErrorPointer?) ->Bool {
        if cls is T {
            return true
        }else{
            let err: NSError = self.yk_createError(1, info: nil, message: "Class[\(cls)] not confirm protocol[\(proto)]")
            errBack??.pointee = err
            return false
        }
    }
    
    static func yk_createError(_ code: NSInteger, info:[String:String]?, message:String)->NSError {
        var infoservice:[String:String] = [
            NSLocalizedDescriptionKey: message != "" ? message : "YKModuleError unknow",
            NSLocalizedFailureReasonErrorKey: message != "" ? message : "YKModuleError unknow",
            YKModuleError_descriptionKey : message != "" ? message : "YKModulrError unknow",
        ]
        info?.forEach { (key: String, value: String) in
            infoservice[key] = value
        }
        let err = NSError.init(domain: YKModuleError_domain, code: code, userInfo: infoservice)
        print("YKModuleServiceComponent error:\(err)")
        return err
    }
}
