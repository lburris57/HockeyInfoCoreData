//
//  UserSettingsViewModel.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 7/13/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI
import Combine

final class UserSettingsViewModel: ObservableObject
{
    let userDefaults = UserDefaults.standard
    
    @Published var seasonType = Constants.EMPTY_STRING {didSet {userDefaults.set(self.seasonType, forKey: Constants.SEASON_TYPE)}}
    @Published var season = Constants.EMPTY_STRING {didSet {userDefaults.set(self.season, forKey: Constants.SEASON)}}
    @Published var playoffYear = Constants.EMPTY_STRING {didSet {userDefaults.set(self.playoffYear, forKey: Constants.PLAYOFF_YEAR)}}
    @Published var isPlayoffs = false  {didSet {userDefaults.set(self.isPlayoffs, forKey: Constants.IS_PLAYOFFS)}}
    
    init()
    {
        self.seasonType = userDefaults.string(forKey: Constants.SEASON_TYPE) ?? Constants.REGULAR_SEASON
        self.playoffYear = userDefaults.string(forKey: Constants.PLAYOFF_YEAR) ?? TimeAndDateUtils.getCurrentPlayoffSeason()
        self.season = userDefaults.string(forKey: Constants.SEASON) ?? "2019-2020"
        self.isPlayoffs = userDefaults.bool(forKey: Constants.IS_PLAYOFFS)
    }
}
