//
//  CryptoCurrencyData.swift
//  CryptoStocks
//
//  Created by Emin Bari on 17.08.2020.
//

import Foundation

// MARK: - CryptocurrencyExchange
struct CryptoCurrencyData: Codable {
    let raw: Raw
    let display: Display

    enum CodingKeys: String, CodingKey {
        case raw = "RAW"
        case display = "DISPLAY"
    }
}

// MARK: - Display
struct Display: Codable {
    let btc: DisplayBtc

    enum CodingKeys: String, CodingKey {
        case btc = "BTC"
    }
}

// MARK: - DisplayBtc
struct DisplayBtc: Codable {
    let usd, eur, gbp: PurpleEur

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
    }
}

// MARK: - PurpleEur
struct PurpleEur: Codable {
    let fromsymbol, tosymbol, market, price: String
    let lastupdate, lastvolume, lastvolumeto, lasttradeid: String
    let volumeday, volumedayto, volume24Hour, volume24Hourto: String
    let openday, highday, lowday, open24Hour: String
    let high24Hour, low24Hour, lastmarket, volumehour: String
    let volumehourto, openhour, highhour, lowhour: String
    let toptiervolume24Hour, toptiervolume24Hourto, change24Hour, changepct24Hour: String
    let changeday, changepctday, changehour, changepcthour: String
    let conversiontype, conversionsymbol, supply, mktcap: String
    let totalvolume24H, totalvolume24Hto, totaltoptiervolume24H, totaltoptiervolume24Hto: String
    let imageurl: String

    enum CodingKeys: String, CodingKey {
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case market = "MARKET"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case lasttradeid = "LASTTRADEID"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case openday = "OPENDAY"
        case highday = "HIGHDAY"
        case lowday = "LOWDAY"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
        case lastmarket = "LASTMARKET"
        case volumehour = "VOLUMEHOUR"
        case volumehourto = "VOLUMEHOURTO"
        case openhour = "OPENHOUR"
        case highhour = "HIGHHOUR"
        case lowhour = "LOWHOUR"
        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
        case change24Hour = "CHANGE24HOUR"
        case changepct24Hour = "CHANGEPCT24HOUR"
        case changeday = "CHANGEDAY"
        case changepctday = "CHANGEPCTDAY"
        case changehour = "CHANGEHOUR"
        case changepcthour = "CHANGEPCTHOUR"
        case conversiontype = "CONVERSIONTYPE"
        case conversionsymbol = "CONVERSIONSYMBOL"
        case supply = "SUPPLY"
        case mktcap = "MKTCAP"
        case totalvolume24H = "TOTALVOLUME24H"
        case totalvolume24Hto = "TOTALVOLUME24HTO"
        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
        case imageurl = "IMAGEURL"
    }
}

// MARK: - Raw
struct Raw: Codable {
    let btc: RawBtc

    enum CodingKeys: String, CodingKey {
        case btc = "BTC"
    }
}

// MARK: - RawBtc
struct RawBtc: Codable {
    let usd, eur, gbp: FluffyEur

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
    }
}

// MARK: - FluffyEur
struct FluffyEur: Codable {
    let type, market, fromsymbol, tosymbol: String
    let flags: String
    let price: Double
    let lastupdate: Int
    let median, lastvolume, lastvolumeto: Double
    let lasttradeid: String
    let volumeday, volumedayto, volume24Hour, volume24Hourto: Double
    let openday, highday, lowday, open24Hour: Double
    let high24Hour, low24Hour: Double
    let lastmarket: String
    let volumehour, volumehourto, openhour, highhour: Double
    let lowhour, toptiervolume24Hour, toptiervolume24Hourto, change24Hour: Double
    let changepct24Hour, changeday, changepctday, changehour: Double
    let changepcthour: Double
    let conversiontype, conversionsymbol: String
    let supply: Int
    let mktcap, totalvolume24H, totalvolume24Hto, totaltoptiervolume24H: Double
    let totaltoptiervolume24Hto: Double
    let imageurl: String

    enum CodingKeys: String, CodingKey {
        case type = "TYPE"
        case market = "MARKET"
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case flags = "FLAGS"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case median = "MEDIAN"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case lasttradeid = "LASTTRADEID"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case openday = "OPENDAY"
        case highday = "HIGHDAY"
        case lowday = "LOWDAY"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
        case lastmarket = "LASTMARKET"
        case volumehour = "VOLUMEHOUR"
        case volumehourto = "VOLUMEHOURTO"
        case openhour = "OPENHOUR"
        case highhour = "HIGHHOUR"
        case lowhour = "LOWHOUR"
        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
        case change24Hour = "CHANGE24HOUR"
        case changepct24Hour = "CHANGEPCT24HOUR"
        case changeday = "CHANGEDAY"
        case changepctday = "CHANGEPCTDAY"
        case changehour = "CHANGEHOUR"
        case changepcthour = "CHANGEPCTHOUR"
        case conversiontype = "CONVERSIONTYPE"
        case conversionsymbol = "CONVERSIONSYMBOL"
        case supply = "SUPPLY"
        case mktcap = "MKTCAP"
        case totalvolume24H = "TOTALVOLUME24H"
        case totalvolume24Hto = "TOTALVOLUME24HTO"
        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
        case imageurl = "IMAGEURL"
    }
}

