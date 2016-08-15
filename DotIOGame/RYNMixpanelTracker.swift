//
//  RYNMixpanelTracker.swift
//  DotIOGame
//
//  Created by Ryan Anderson on 8/9/16.
//  Copyright © 2016 Ryan Anderson. All rights reserved.
//

import Foundation
import Mixpanel

class RYNMixpanelTracker {
    let mixpanel: Mixpanel
    init() {
        mixpanel = Mixpanel.sharedInstance()
    }
    
    func trackGameFinished(playTime: Double, finalScore: Int, percentScoreFromSize: Double, percentScoreFromOrbs: Double, percentScoreFromKills: Double, finalRank: Int) {
        mixpanel.track("Game Finished",
                       properties: ["Play Time": playTime,
                        "Final Score": finalScore,
                        "Percent Score From Size": percentScoreFromSize,
                        "Percent Score From Orbs": percentScoreFromOrbs,
                        "Percent Score From Kills": percentScoreFromKills,
                        "Final Rank": finalRank
        ])
        //print("Size: \(percentScoreFromSize) \nOrbs: \(percentScoreFromOrbs) \nKills: \(percentScoreFromKills)")
        
    }
}