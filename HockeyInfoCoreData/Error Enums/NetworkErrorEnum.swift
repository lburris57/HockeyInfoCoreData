//
//  NetworkErrorEnum.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation

enum NetworkErrorEnum: Error
{
    case retrieveData
    case decodeJSON
    case unableToConnect
}

