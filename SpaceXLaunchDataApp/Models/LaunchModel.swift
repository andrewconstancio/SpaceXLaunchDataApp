//
//  LaunchModel.swift
//  SpaceXLaunchDataApp
//
//  Created by Andrew Constancio on 9/23/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

/// Model of data received from the Space X API for a rocket launch
///
struct Launch: Codable {
    let flightNumber: Int
    let missionName: String?
    let missionID: [String]?
    let upcoming: Bool?
    let launchYear: String?
    let launchDateUnix: Int?
    let launchDateUTC: String?
    let launchDateLocal: String?
    let isTentative: Bool?
    let tentativeMaxPrecision: String?
    let tbd: Bool?
    let launchWindow: Int?
    let rocket: Rocket?
    let ships: [String]?
    let telemetry: Telemetry?
    let launchSite: LaunchSite?
    let launchSuccess: Bool?
    let launchFailureDetails: LaunchFailureDetails?
    let links: Links?
    let details, staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let timeline: Timeline?
    let crew: [String]?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case upcoming
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd
        case launchWindow = "launch_window"
        case rocket, ships, telemetry
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case launchFailureDetails = "launch_failure_details"
        case links, details
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case timeline, crew
    }
}

struct LaunchFailureDetails: Codable {
    let time: Int?
    let altitude: Double?
    let reason: String?
}

struct LaunchSite: Codable {
    let siteID, siteName, siteNameLong: String?

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}

struct Links: Codable {
    let missionPatch, missionPatchSmall: String?
    let redditCampaign, redditLaunch, redditRecovery, redditMedia: String?
    let presskit: String?
    let articleLink: String?
    let wikipedia, videoLink: String?
    let youtubeID: String?
    let flickrImages: [String]?

    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditRecovery = "reddit_recovery"
        case redditMedia = "reddit_media"
        case presskit
        case articleLink = "article_link"
        case wikipedia
        case videoLink = "video_link"
        case youtubeID = "youtube_id"
        case flickrImages = "flickr_images"
    }
}

struct Rocket: Codable {
    let rocketID, rocketName, rocketType: String
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let fairings: Fairings?

    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case fairings
    }
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ship: String?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ship
    }
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let cores: [Core]?
}

// MARK: - Core
struct Core: Codable {
    let coreSerial: String?
    let flight: Int?
    let block: Int?
    let gridfins, legs, reused: Bool?
    let landSuccess: Bool?
    let landingIntent: Bool?
    let landingType, landingVehicle: String?

    enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case flight, block, gridfins, legs, reused
        case landSuccess = "land_success"
        case landingIntent = "landing_intent"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
    }
}

struct SecondStage: Codable {
    let block: Int?
    let payloads: [Payload]?
}

struct Payload: Codable {
    let payloadID: String?
    let noradID: [Int]?
    let reused: Bool?
    let customers: [String]?
    let nationality, manufacturer, payloadType: String?
    let payloadMassKg, payloadMassLbs: Double?
    let orbit: String?
    let orbitParams: OrbitParams?

    enum CodingKeys: String, CodingKey {
        case payloadID = "payload_id"
        case noradID = "norad_id"
        case reused, customers, nationality, manufacturer
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbit
        case orbitParams = "orbit_params"
    }
}

struct OrbitParams: Codable {
    let referenceSystem, epoch, regime: String?
    let longitude, semiMajorAxisKM, eccentricity: Double?
    let periapsisKM, apoapsisKM, inclinationDeg: Double?
    let periodMin, lifespanYears, meanMotion: Double?
    let raan, argOfPericenter, meanAnomaly: Double?

    enum CodingKeys: String, CodingKey {
        case referenceSystem = "reference_system"
        case regime, longitude
        case semiMajorAxisKM = "semi_major_axis_km"
        case eccentricity
        case periapsisKM = "periapsis_km"
        case apoapsisKM = "apoapsis_km"
        case inclinationDeg = "inclination_deg"
        case periodMin = "period_min"
        case lifespanYears = "lifespan_years"
        case epoch
        case meanMotion = "mean_motion"
        case raan
        case argOfPericenter = "arg_of_pericenter"
        case meanAnomaly = "mean_anomaly"
    }
}

struct Telemetry: Codable {
    let flightClub: String?

    enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
}

struct Timeline: Codable {
    let webcastLiftoff: Int?

    enum CodingKeys: String, CodingKey {
        case webcastLiftoff = "webcast_liftoff"
    }
}
