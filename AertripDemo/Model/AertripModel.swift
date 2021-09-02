// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aertripModel = try? newJSONDecoder().decode(AertripModel.self, from: jsonData)

import Foundation

// MARK: - AertripModel
struct AertripModel: Codable {
    let success: Bool
    let errors: [JSONAny]
    let data: DataClass

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case errors = "errors"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let sid: String
    let completed: Int
    let done: Bool
    let flights: [DataFlight]

    enum CodingKeys: String, CodingKey {
        case sid = "sid"
        case completed = "completed"
        case done = "done"
        case flights = "flights"
    }
}

// MARK: - DataFlight
struct DataFlight: Codable {
    let vcode: Vcode
    let displayGroupId: Int
    let qid: String
    let results: Results
    let cfile: Cfile

    enum CodingKeys: String, CodingKey {
        case vcode = "vcode"
        case displayGroupId = "display_group_id"
        case qid = "qid"
        case results = "results"
        case cfile = "cfile"
    }
}

// MARK: - Cfile
struct Cfile: Codable {
    let unprocessed: String
    let raw: String
    let processed: String

    enum CodingKeys: String, CodingKey {
        case unprocessed = "unprocessed"
        case raw = "raw"
        case processed = "processed"
    }
}

// MARK: - Results
struct Results: Codable {
    let jCount: Int
    let j: [J]
    let f: [F]
    let cityap: Cityap
    let apdet: [String: Apdet]
    let taxes: [String: String]
    let aldet: Aldet
    let alMaster: AlMaster
    let eqMaster: [String: EqMaster]
    let vcodeMaster: VcodeMaster
    let rsid: String
    let taxSort: String

    enum CodingKeys: String, CodingKey {
        case jCount = "j_count"
        case j = "j"
        case f = "f"
        case cityap = "cityap"
        case apdet = "apdet"
        case taxes = "taxes"
        case aldet = "aldet"
        case alMaster = "alMaster"
        case eqMaster = "eqMaster"
        case vcodeMaster = "vcodeMaster"
        case rsid = "rsid"
        case taxSort = "tax_sort"
    }
}

// MARK: - AlMaster
struct AlMaster: Codable {
    let uk: The6_E
    let ai: The6_E
    let the6E: The6_E?

    enum CodingKeys: String, CodingKey {
        case uk = "UK"
        case ai = "AI"
        case the6E = "6E"
    }
}

// MARK: - The6_E
struct The6_E: Codable {
    let name: String
    let bgcolor: String
    let humaneScore: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case bgcolor = "bgcolor"
        case humaneScore = "humane_score"
    }
}

// MARK: - Aldet
struct Aldet: Codable {
    let uk: String
    let ai: String
    let the6E: String?

    enum CodingKeys: String, CodingKey {
        case uk = "UK"
        case ai = "AI"
        case the6E = "6E"
    }
}

// MARK: - Apdet
struct Apdet: Codable {
    let n: String
    let c: String
    let lat: String
    let long: String
    let cn: CN
    let cname: Cname
    let hw: String
    let tz: Tz
    let tzShortname: TzShortname
    let tzOffset: TzOffset
    let tzDisplay: TzDisplay

    enum CodingKeys: String, CodingKey {
        case n = "n"
        case c = "c"
        case lat = "lat"
        case long = "long"
        case cn = "cn"
        case cname = "cname"
        case hw = "hw"
        case tz = "tz"
        case tzShortname = "tz_shortname"
        case tzOffset = "tz_offset"
        case tzDisplay = "tz_display"
    }
}

enum CN: String, Codable {
    case cnIn = "IN"
}

enum Cname: String, Codable {
    case india = "India"
}

enum Tz: String, Codable {
    case asiaKolkata = "Asia/Kolkata"
}

enum TzDisplay: String, Codable {
    case automatic = "Automatic"
}

enum TzOffset: String, Codable {
    case the0530 = "+05:30"
}

enum TzShortname: String, Codable {
    case ist = "IST"
}

// MARK: - Cityap
struct Cityap: Codable {
    let mumbai: [Kolkata]
    let kolkata: [Kolkata]

    enum CodingKeys: String, CodingKey {
        case mumbai = "Mumbai"
        case kolkata = "Kolkata"
    }
}

enum Kolkata: String, Codable {
    case bom = "BOM"
    case ccu = "CCU"
}

// MARK: - EqMaster
struct EqMaster: Codable {
    let name: EqEnum
    let code: String
    let quality: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
        case quality = "quality"
    }
}

enum EqEnum: String, Codable {
    case airbusA319 = "Airbus A319"
    case airbusA320100200 = "Airbus A320-100/200"
    case airbusA320S = "Airbus A320-S"
    case airbusA321 = "Airbus A321"
    case airbusA321S = "Airbus A321-S"
    case aleniaAtr = "Alenia ATR"
    case boeing7878D = "Boeing 787-8D"
}

// MARK: - F
struct F: Codable {
    let multiAl: Int
    let cityapN: CityapN
    let fares: [String]
    let fq: Fq
    let pr: PR
    let faresType: [FaresType]
    let eq: [String]
    let vcode: [Vcode]
    let stp: [String]
    let al: [Pca]
    let depDt: ArDt
    let arDt: ArDt
    let dt: ArDt
    let at: ArDt
    let tt: Lott
    let loap: [String]
    let lott: Lott
    let originTz: NTz
    let destinationTz: NTz
    let ap: [Kolkata]
    let cityap: Cityap
    let nearbydisclaimer: [Bool]

    enum CodingKeys: String, CodingKey {
        case multiAl = "multi_al"
        case cityapN = "cityap_n"
        case fares = "fares"
        case fq = "fq"
        case pr = "pr"
        case faresType = "fares_type"
        case eq = "eq"
        case vcode = "vcode"
        case stp = "stp"
        case al = "al"
        case depDt = "dep_dt"
        case arDt = "ar_dt"
        case dt = "dt"
        case at = "at"
        case tt = "tt"
        case loap = "loap"
        case lott = "lott"
        case originTz = "origin_tz"
        case destinationTz = "destination_tz"
        case ap = "ap"
        case cityap = "cityap"
        case nearbydisclaimer = "nearbydisclaimer"
    }
}

enum Pca: String, Codable {
    case ai = "AI"
    case allianceAir = "Alliance Air"
    case the6E = "6E"
    case uk = "UK"
}

// MARK: - ArDt
struct ArDt: Codable {
    let earliest: String
    let latest: String

    enum CodingKeys: String, CodingKey {
        case earliest = "earliest"
        case latest = "latest"
    }
}

// MARK: - CityapN
struct CityapN: Codable {
    let fr: Fr
    let to: To

    enum CodingKeys: String, CodingKey {
        case fr = "fr"
        case to = "to"
    }
}

// MARK: - Fr
struct Fr: Codable {
    let mumbai: [Kolkata]

    enum CodingKeys: String, CodingKey {
        case mumbai = "Mumbai"
    }
}

// MARK: - To
struct To: Codable {
    let kolkata: [Kolkata]

    enum CodingKeys: String, CodingKey {
        case kolkata = "Kolkata"
    }
}

// MARK: - NTz
struct NTz: Codable {
    let max: String
    let min: String

    enum CodingKeys: String, CodingKey {
        case max = "max"
        case min = "min"
    }
}

// MARK: - FaresType
struct FaresType: Codable {
    let value: Int
    let label: String

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case label = "label"
    }
}

// MARK: - Fq
struct Fq: Codable {
    let ovgtlo: String
    let aht: String
    let ovgtf: String?

    enum CodingKeys: String, CodingKey {
        case ovgtlo = "ovgtlo"
        case aht = "aht"
        case ovgtf = "ovgtf"
    }
}

// MARK: - Lott
struct Lott: Codable {
    let minTime: String
    let maxTime: String

    enum CodingKeys: String, CodingKey {
        case minTime = "minTime"
        case maxTime = "maxTime"
    }
}

// MARK: - PR
struct PR: Codable {
    let minPrice: Int
    let maxPrice: Int

    enum CodingKeys: String, CodingKey {
        case minPrice = "minPrice"
        case maxPrice = "maxPrice"
    }
}

enum Vcode: String, Codable {
    case the6E = "6e"
    case tp = "tp"
}

// MARK: - J
struct J: Codable {
    let vendor: Vcode
    let pca: Pca?
    let id: String
    let fareTypeName: FareTypeNameUnion
    let fk: String
    let ofk: String?
    let invfk: Bool?
    let pricingsolutionKey: String
    let otherfares: Bool
    let farepr: Int
    let iic: Bool
    let displaySeat: Bool
    let fare: Fare
    let dt: String
    let at: String
    let tt: [Int]
    let slo: Int
    let slot: Slot
    let llow: Int
    let llowt: Llowt
    let red: Int
    let redt: Redt
    let cot: Int
    let cop: Int
    let copt: Copt
    let coa: Int
    let fsr: Int
    let seats: String
    let al: [Pca]
    let stp: String
    let ap: [Kolkata]
    let loap: [String]
    let lott: [Eqt]
    let leg: [Leg]
    let isLcc: Int
    let hmnePrms: [[HmnePrm]]
    let apc: String?
    let sict: Bool?
    let segmentCabinClasses: [SegmentCabinClass]?
    let asdasd: String
    let farebasis: String
    let coat: String
    let cott: Cott
    let dspNoshow: Int
    let rfdPlcy: RfdPlcy
    let qid: JSONNull?
    let cc: Cc
    let eqt: Eqt
    let fcc: String?
    let lg: Int
    let ovngt: Int
    let ovngtt: Ovngtt
    let ovgtf: Int
    let ovgtlo: Int
    let dd: String
    let ad: String
    let humaneScore: Int
    let humaneArr: HumaneArr
    let humanePrice: HumanePrice
    let brandId: String?
    let fareType: FareType?

    enum CodingKeys: String, CodingKey {
        case vendor = "vendor"
        case pca = "pca"
        case id = "id"
        case fareTypeName = "FareTypeName"
        case fk = "fk"
        case ofk = "ofk"
        case invfk = "invfk"
        case pricingsolutionKey = "pricingsolution_key"
        case otherfares = "otherfares"
        case farepr = "farepr"
        case iic = "iic"
        case displaySeat = "display_seat"
        case fare = "fare"
        case dt = "dt"
        case at = "at"
        case tt = "tt"
        case slo = "slo"
        case slot = "slot"
        case llow = "llow"
        case llowt = "llowt"
        case red = "red"
        case redt = "redt"
        case cot = "cot"
        case cop = "cop"
        case copt = "copt"
        case coa = "coa"
        case fsr = "fsr"
        case seats = "seats"
        case al = "al"
        case stp = "stp"
        case ap = "ap"
        case loap = "loap"
        case lott = "lott"
        case leg = "leg"
        case isLcc = "is_lcc"
        case hmnePrms = "hmne_prms"
        case apc = "apc"
        case sict = "sict"
        case segmentCabinClasses = "segment_cabin_classes"
        case asdasd = "asdasd"
        case farebasis = "farebasis"
        case coat = "coat"
        case cott = "cott"
        case dspNoshow = "dsp_noshow"
        case rfdPlcy = "rfd_plcy"
        case qid = "qid"
        case cc = "cc"
        case eqt = "eqt"
        case fcc = "fcc"
        case lg = "lg"
        case ovngt = "ovngt"
        case ovngtt = "ovngtt"
        case ovgtf = "ovgtf"
        case ovgtlo = "ovgtlo"
        case dd = "dd"
        case ad = "ad"
        case humaneScore = "humane_score"
        case humaneArr = "humane_arr"
        case humanePrice = "humane_price"
        case brandId = "brand_id"
        case fareType = "fare_type"
    }
}

enum Cc: String, Codable {
    case economy = "Economy"
}

enum Copt: String, Codable {
    case the0ChangeOfPlane = "0 Change of Plane"
    case the1ChangeOfPlane = "1 Change of Plane"
    case the2ChangeOfPlane = "2 Change of Plane"
    case the3ChangeOfPlane = "3 Change of Plane"
}

enum Cott: String, Codable {
    case empty = ""
    case the1ChangeOfTerminal = "1 Change Of Terminal"
}

enum Eqt: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Eqt.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Eqt"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Fare
struct Fare: Codable {
    let bf: Bf
    let taxes: Taxes
    let grossFare: GrossFare
    let netFare: NetFare
    let grandTotal: GrandTotal
    let totalPayableNow: TotalPayableNow
    let netEffectiveFare: NetEffectiveFare
    let cancellationCharges: CancellationCharges
    let reschedulingCharges: ReschedulingCharges
    let taxesSortOrder: TaxesSortOrder

    enum CodingKeys: String, CodingKey {
        case bf = "BF"
        case taxes = "taxes"
        case grossFare = "gross_fare"
        case netFare = "net_fare"
        case grandTotal = "grand_total"
        case totalPayableNow = "total_payable_now"
        case netEffectiveFare = "net_effective_fare"
        case cancellationCharges = "cancellation_charges"
        case reschedulingCharges = "rescheduling_charges"
        case taxesSortOrder = "taxes_sort_order"
    }
}

// MARK: - Bf
struct Bf: Codable {
    let name: BFName
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

enum BFName: String, Codable {
    case baseFare = "Base Fare"
}

// MARK: - CancellationCharges
struct CancellationCharges: Codable {
    let details: Cp
    let name: CancellationChargesName
    let value: Int

    enum CodingKeys: String, CodingKey {
        case details = "details"
        case name = "name"
        case value = "value"
    }
}

// MARK: - Cp
struct Cp: Codable {
    let spcfee: SPCFEEClass
    let sucfee: SUCFEEClass
    let nscfee: Int
    let raf: Raf

    enum CodingKeys: String, CodingKey {
        case spcfee = "SPCFEE"
        case sucfee = "SUCFEE"
        case nscfee = "NSCFEE"
        case raf = "RAF"
    }
}

// MARK: - Raf
struct Raf: Codable {
    let adt: [String: Int]

    enum CodingKeys: String, CodingKey {
        case adt = "ADT"
    }
}

// MARK: - SPCFEEClass
struct SPCFEEClass: Codable {
    let adt: [String: [SpcfeeAdt]]

    enum CodingKeys: String, CodingKey {
        case adt = "ADT"
    }
}

// MARK: - SpcfeeAdt
struct SpcfeeAdt: Codable {
    let slab: Int
    let sla: Int
    let value: Int

    enum CodingKeys: String, CodingKey {
        case slab = "slab"
        case sla = "sla"
        case value = "value"
    }
}

// MARK: - SUCFEEClass
struct SUCFEEClass: Codable {
    let adt: [String: [SucfeeAdt]]

    enum CodingKeys: String, CodingKey {
        case adt = "ADT"
    }
}

// MARK: - SucfeeAdt
struct SucfeeAdt: Codable {
    let value: Int

    enum CodingKeys: String, CodingKey {
        case value = "value"
    }
}

enum CancellationChargesName: String, Codable {
    case cancellationCharges = "Cancellation Charges"
}

// MARK: - GrandTotal
struct GrandTotal: Codable {
    let name: GrandTotalName
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

enum GrandTotalName: String, Codable {
    case grandTotal = "Grand Total"
}

// MARK: - GrossFare
struct GrossFare: Codable {
    let name: GrossFareName
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

enum GrossFareName: String, Codable {
    case grossFare = "Gross Fare"
}

// MARK: - NetEffectiveFare
struct NetEffectiveFare: Codable {
    let name: NetEffectiveFareName
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

enum NetEffectiveFareName: String, Codable {
    case netEffectiveFare = "Net Effective Fare"
}

// MARK: - NetFare
struct NetFare: Codable {
    let name: NetFareName
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

enum NetFareName: String, Codable {
    case netFare = "Net Fare"
}

// MARK: - ReschedulingCharges
struct ReschedulingCharges: Codable {
    let details: Rscp

    enum CodingKeys: String, CodingKey {
        case details = "details"
    }
}

// MARK: - Rscp
struct Rscp: Codable {
    let sprfee: SPCFEEClass
    let surfee: SUCFEEClass

    enum CodingKeys: String, CodingKey {
        case sprfee = "SPRFEE"
        case surfee = "SURFEE"
    }
}

// MARK: - Taxes
struct Taxes: Codable {
    let name: TaxesName
    let value: Int
    let details: Details

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case details = "details"
    }
}

// MARK: - Details
struct Details: Codable {
    let yr: Int?
    let ym: Int?
    let k3: Int?
    let ot: Int?
    let mf: Int
    let mfsgst: Double
    let mfcgst: Double
    let detailsIn: Int?

    enum CodingKeys: String, CodingKey {
        case yr = "YR"
        case ym = "YM"
        case k3 = "K3"
        case ot = "OT"
        case mf = "MF"
        case mfsgst = "MFSGST"
        case mfcgst = "MFCGST"
        case detailsIn = "IN"
    }
}

enum TaxesName: String, Codable {
    case taxesAndFees = "Taxes and Fees"
}

enum TaxesSortOrder: String, Codable {
    case inMfMfsgstMfcgst = "IN,MF,MFSGST,MFCGST"
    case inOtMfMfsgstMfcgst = "IN,OT,MF,MFSGST,MFCGST"
    case yrYmInK3OtMfMfsgstMfcgst = "YR,YM,IN,K3,OT,MF,MFSGST,MFCGST"
    case yrYmK3OtMfMfsgstMfcgst = "YR,YM,K3,OT,MF,MFSGST,MFCGST"
}

// MARK: - TotalPayableNow
struct TotalPayableNow: Codable {
    let name: TotalPayableNowName
    let value: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

enum TotalPayableNowName: String, Codable {
    case totalPayableNow = "Total Payable Now"
}

enum FareType: String, Codable {
    case ecoLite = "ECO LITE"
    case economyBasic = "Economy Basic"
    case economySaver = "Economy Saver"
    case regularFare = "Regular Fare"
}

enum FareTypeNameUnion: Codable {
    case enumeration(FareType)
    case fareTypeNameClass(FareTypeNameClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(FareType.self) {
            self = .enumeration(x)
            return
        }
        if let x = try? container.decode(FareTypeNameClass.self) {
            self = .fareTypeNameClass(x)
            return
        }
        throw DecodingError.typeMismatch(FareTypeNameUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for FareTypeNameUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumeration(let x):
            try container.encode(x)
        case .fareTypeNameClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - FareTypeNameClass
struct FareTypeNameClass: Codable {
    let f3ZryrPWdkaaXoHaaaaa: FareType?
    let f3ZryrPWdkatXoHaaaaa: FareType?
    let f3ZryrPWdkAoXoHaaaaa: FareType?
    let f3ZryrPWdkApXoHaaaaa: FareType?
    let f3ZryrPWdka2XoHaaaaa: FareType?
    let f3ZryrPWdka8XoHaaaaa: FareType?
    let f3ZryrPWdkaoXoHaaaaa: FareType?
    let f3ZryrPWdkAsXoHaaaaa: FareType?
    let f3ZryrPWdka7XoHaaaaa: FareType?
    let f3ZryrPWdkakAyoHaaaaa: FareType?
    let f3ZryrPWdkaxAyoHaaaaa: FareType?
    let f3ZryrPWdkAjAyoHaaaaa: FareType?
    let f3ZryrPWdkAxAyoHaaaaa: FareType?
    let f3ZryrPWdkAyAyoHaaaaa: FareType?
    let f3ZryrPWdkaAyoHaaaaa: FareType?
    let f3ZryrPWdkafByoHaaaaa: FareType?
    let f3ZryrPWdkAbByoHaaaaa: FareType?
    let f3ZryrPWdkAhByoHaaaaa: FareType?
    let f3ZryrPWdkauXoHaaaaa: FareType?
    let f3ZryrPWdkavXoHaaaaa: FareType?
    let f3ZryrPWdkaByoHaaaaa: FareType?
    let f3ZryrPWdkaeCyoHaaaaa: FareType?
    let f3ZryrPWdkAdAyoHaaaaa: FareType?
    let f3ZryrPWdkacAyoHaaaaa: FareType?
    let f3ZryrPWdkAwCyoHaaaaa: FareType?
    let f3ZryrPWdka2CyoHaaaaa: FareType?
    let f3ZryrPWdkamDyoHaaaaa: FareType?
    let f3ZryrPWdkanDyoHaaaaa: FareType?
    let f3ZryrPWdkAbXoHaaaaa: FareType?

    enum CodingKeys: String, CodingKey {
        case f3ZryrPWdkaaXoHaaaaa = "F3zryr/pWDKAA+xoHAAAAA=="
        case f3ZryrPWdkatXoHaaaaa = "F3zryr/pWDKAT+xoHAAAAA=="
        case f3ZryrPWdkAoXoHaaaaa = "F3zryr/pWDKAo+xoHAAAAA=="
        case f3ZryrPWdkApXoHaaaaa = "F3zryr/pWDKAp+xoHAAAAA=="
        case f3ZryrPWdka2XoHaaaaa = "F3zryr/pWDKA2+xoHAAAAA=="
        case f3ZryrPWdka8XoHaaaaa = "F3zryr/pWDKA8+xoHAAAAA=="
        case f3ZryrPWdkaoXoHaaaaa = "F3zryr/pWDKAO/xoHAAAAA=="
        case f3ZryrPWdkAsXoHaaaaa = "F3zryr/pWDKAs/xoHAAAAA=="
        case f3ZryrPWdka7XoHaaaaa = "F3zryr/pWDKA7/xoHAAAAA=="
        case f3ZryrPWdkakAyoHaaaaa = "F3zryr/pWDKAKAyoHAAAAA=="
        case f3ZryrPWdkaxAyoHaaaaa = "F3zryr/pWDKAXAyoHAAAAA=="
        case f3ZryrPWdkAjAyoHaaaaa = "F3zryr/pWDKAjAyoHAAAAA=="
        case f3ZryrPWdkAxAyoHaaaaa = "F3zryr/pWDKAxAyoHAAAAA=="
        case f3ZryrPWdkAyAyoHaaaaa = "F3zryr/pWDKAyAyoHAAAAA=="
        case f3ZryrPWdkaAyoHaaaaa = "F3zryr/pWDKA/AyoHAAAAA=="
        case f3ZryrPWdkafByoHaaaaa = "F3zryr/pWDKAFByoHAAAAA=="
        case f3ZryrPWdkAbByoHaaaaa = "F3zryr/pWDKAbByoHAAAAA=="
        case f3ZryrPWdkAhByoHaaaaa = "F3zryr/pWDKAhByoHAAAAA=="
        case f3ZryrPWdkauXoHaaaaa = "F3zryr/pWDKAU/xoHAAAAA=="
        case f3ZryrPWdkavXoHaaaaa = "F3zryr/pWDKAV/xoHAAAAA=="
        case f3ZryrPWdkaByoHaaaaa = "F3zryr/pWDKA+ByoHAAAAA=="
        case f3ZryrPWdkaeCyoHaaaaa = "F3zryr/pWDKAECyoHAAAAA=="
        case f3ZryrPWdkAdAyoHaaaaa = "F3zryr/pWDKAdAyoHAAAAA=="
        case f3ZryrPWdkacAyoHaaaaa = "F3zryr/pWDKACAyoHAAAAA=="
        case f3ZryrPWdkAwCyoHaaaaa = "F3zryr/pWDKAwCyoHAAAAA=="
        case f3ZryrPWdka2CyoHaaaaa = "F3zryr/pWDKA2CyoHAAAAA=="
        case f3ZryrPWdkamDyoHaaaaa = "F3zryr/pWDKAMDyoHAAAAA=="
        case f3ZryrPWdkanDyoHaaaaa = "F3zryr/pWDKANDyoHAAAAA=="
        case f3ZryrPWdkAbXoHaaaaa = "F3zryr/pWDKAb/xoHAAAAA=="
    }
}

// MARK: - HmnePrm
struct HmnePrm: Codable {
    let slo: Int
    let llo: Int
    let cot: Int
    let cop: Int
    let coa: Int

    enum CodingKeys: String, CodingKey {
        case slo = "slo"
        case llo = "llo"
        case cot = "cot"
        case cop = "cop"
        case coa = "coa"
    }
}

// MARK: - HumaneArr
struct HumaneArr: Codable {
    let cc: Int
    let stp: Int
    let co: [[Co]]
    let nonref: Int
    let al: [String: Int]
    let ap: Ap
    let eq: Eqt
    let ovngtLayover: Int?
    let ovngtFlight: Int?

    enum CodingKeys: String, CodingKey {
        case cc = "cc"
        case stp = "stp"
        case co = "co"
        case nonref = "nonref"
        case al = "al"
        case ap = "ap"
        case eq = "eq"
        case ovngtLayover = "ovngt_layover"
        case ovngtFlight = "ovngt_flight"
    }
}

// MARK: - Ap
struct Ap: Codable {
    let bom: String
    let ccu: String
    let bbi: String?
    let hyd: String?
    let blr: String?
    let rpr: String?
    let maa: String?
    let pat: String?
    let del: String?
    let amd: String?
    let ixc: String?
    let vns: String?
    let goi: String?

    enum CodingKeys: String, CodingKey {
        case bom = "BOM"
        case ccu = "CCU"
        case bbi = "BBI"
        case hyd = "HYD"
        case blr = "BLR"
        case rpr = "RPR"
        case maa = "MAA"
        case pat = "PAT"
        case del = "DEL"
        case amd = "AMD"
        case ixc = "IXC"
        case vns = "VNS"
        case goi = "GOI"
    }
}

// MARK: - Co
struct Co: Codable {
    let cop: Int
    let cot: Int
    let coa: Int

    enum CodingKeys: String, CodingKey {
        case cop = "cop"
        case cot = "cot"
        case coa = "coa"
    }
}

// MARK: - HumanePrice
struct HumanePrice: Codable {
    let total: Double
    let breakup: Breakup

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case breakup = "breakup"
    }
}

// MARK: - Breakup
struct Breakup: Codable {
    let orgPrice: Int
    let ft: Double?

    enum CodingKeys: String, CodingKey {
        case orgPrice = "org_price"
        case ft = "ft"
    }
}

// MARK: - Leg
struct Leg: Codable {
    let fcp: Int?
    let allAp: [String]
    let ap: [Kolkata]
    let loap: [String]
    let lott: [Int]
    let lfk: String
    let lid: String
    let tt: String
    let stp: String
    let flights: [LegFlight]
    let dd: String
    let dt: String
    let ad: String
    let at: String
    let al: [Pca]
    let ttl: [TTL]

    enum CodingKeys: String, CodingKey {
        case fcp = "fcp"
        case allAp = "all_ap"
        case ap = "ap"
        case loap = "loap"
        case lott = "lott"
        case lfk = "lfk"
        case lid = "lid"
        case tt = "tt"
        case stp = "stp"
        case flights = "flights"
        case dd = "dd"
        case dt = "dt"
        case ad = "ad"
        case at = "at"
        case al = "al"
        case ttl = "ttl"
    }
}

// MARK: - LegFlight
struct LegFlight: Codable {
    let ffk: String
    let fr: String
    let to: String
    let dd: String
    let dt: String
    let dtm: ATM
    let ad: String
    let at: String
    let atm: ATM
    let ft: Int
    let al: Pca
    let fn: String
    let oc: Pca
    let eq: EqEnum
    let cc: Cc
    let bc: Bc
    let fbn: FareType
    let lo: Int
    let bg: Bg
    let cbg: Cbg
    let halt: Halt
    let isLcc: Int
    let tt: Int
    let ccChg: Int
    let ovgtf: Int
    let llo: Int
    let slo: Int
    let ovgtlo: Int
    let eqCode: String
    let eqQuality: Int
    let haltTime: String?
    let cabinClass: FareType?
    let bgid: JSONNull?
    let cbgid: JSONNull?

    enum CodingKeys: String, CodingKey {
        case ffk = "ffk"
        case fr = "fr"
        case to = "to"
        case dd = "dd"
        case dt = "dt"
        case dtm = "dtm"
        case ad = "ad"
        case at = "at"
        case atm = "atm"
        case ft = "ft"
        case al = "al"
        case fn = "fn"
        case oc = "oc"
        case eq = "eq"
        case cc = "cc"
        case bc = "bc"
        case fbn = "fbn"
        case lo = "lo"
        case bg = "bg"
        case cbg = "cbg"
        case halt = "halt"
        case isLcc = "is_lcc"
        case tt = "tt"
        case ccChg = "cc_chg"
        case ovgtf = "ovgtf"
        case llo = "llo"
        case slo = "slo"
        case ovgtlo = "ovgtlo"
        case eqCode = "eq_code"
        case eqQuality = "eq_quality"
        case haltTime = "halt_time"
        case cabinClass = "cabin_class"
        case bgid = "bgid"
        case cbgid = "cbgid"
    }
}

enum ATM: String, Codable {
    case empty = ""
    case t1 = "T-1"
    case t1B = "T-1B"
    case t2 = "T-2"
    case t3 = "T-3"
}

enum Bc: String, Codable {
    case l = "L"
    case oYl = "O-YL"
    case s = "S"
    case u = "U"
    case x = "X"
}

// MARK: - Bg
struct Bg: Codable {
    let adt: BgAdt

    enum CodingKeys: String, CodingKey {
        case adt = "ADT"
    }
}

// MARK: - BgAdt
struct BgAdt: Codable {
    let weight: String
    let pieces: Pieces
    let maxWeight: MaxWeight
    let maxPieces: MaxPieces
    let dimension: DimensionUnion
    let note: String?

    enum CodingKeys: String, CodingKey {
        case weight = "weight"
        case pieces = "pieces"
        case maxWeight = "max_weight"
        case maxPieces = "max_pieces"
        case dimension = "dimension"
        case note = "note"
    }
}

enum DimensionUnion: Codable {
    case anythingArray([JSONAny])
    case dimensionDimension(DimensionDimension)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(DimensionDimension.self) {
            self = .dimensionDimension(x)
            return
        }
        throw DecodingError.typeMismatch(DimensionUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DimensionUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .dimensionDimension(let x):
            try container.encode(x)
        }
    }
}

// MARK: - DimensionDimension
struct DimensionDimension: Codable {
}

enum MaxPieces: String, Codable {
    case empty = ""
    case the0Pc = "0 pc"
}

enum MaxWeight: String, Codable {
    case empty = ""
    case the15Kg = "15 kg"
}

enum Pieces: String, Codable {
    case empty = ""
    case the1Pc = "1 pc"
}

// MARK: - Cbg
struct Cbg: Codable {
    let adt: CbgAdt?

    enum CodingKeys: String, CodingKey {
        case adt = "ADT"
    }
}

// MARK: - CbgAdt
struct CbgAdt: Codable {
    let pieces: Pieces
    let weight: Weight
    let dimension: ADTDimensionClass
    let note: String
    let maxWeight: String

    enum CodingKeys: String, CodingKey {
        case pieces = "pieces"
        case weight = "weight"
        case dimension = "dimension"
        case note = "note"
        case maxWeight = "max_weight"
    }
}

// MARK: - ADTDimensionClass
struct ADTDimensionClass: Codable {
    let cm: CM
    let dimensionIn: CM

    enum CodingKeys: String, CodingKey {
        case cm = "cm"
        case dimensionIn = "in"
    }
}

// MARK: - CM
struct CM: Codable {
    let width: String
    let height: String
    let depth: String

    enum CodingKeys: String, CodingKey {
        case width = "width"
        case height = "height"
        case depth = "depth"
    }
}

enum Weight: String, Codable {
    case the7Kg = "7 kg"
}

enum Halt: String, Codable {
    case bbi = "BBI"
    case blr = "BLR"
    case del = "DEL"
    case empty = ""
    case jai = "JAI"
    case jrg = "JRG"
    case nag = "NAG"
}

enum TTL: String, Codable {
    case kolkata = "Kolkata"
    case mumbai = "Mumbai"
}

enum Llowt: String, Codable {
    case the0LongLayover = "0 Long Layover"
    case the1LongLayover = "1 Long Layover"
    case the2LongLayovers = "2 Long Layovers"
    case the3LongLayovers = "3 Long Layovers"
}

enum Ovngtt: String, Codable {
    case empty = ""
    case the1OvernightFlight = "1 Overnight Flight"
    case the1OvernightFlight1OvernightLayover = "1 Overnight Flight, 1 Overnight Layover"
    case the1OvernightLayover = "1 Overnight Layover"
}

enum Redt: String, Codable {
    case the0RedEye = "0 Red Eye"
    case the1RedEye = "1 Red Eye"
}

// MARK: - RfdPlcy
struct RfdPlcy: Codable {
    let cp: Cp
    let rscp: Rscp
    let rfd: [String: Int]
    let rsc: [String: Int]

    enum CodingKeys: String, CodingKey {
        case cp = "cp"
        case rscp = "rscp"
        case rfd = "rfd"
        case rsc = "rsc"
    }
}

enum SegmentCabinClass: String, Codable {
    case economy = "economy"
}

enum Slot: String, Codable {
    case the0ShortLayover = "0 Short Layover"
    case the1ShortLayover = "1 Short Layover"
}

// MARK: - VcodeMaster
struct VcodeMaster: Codable {
    let tp: String
    let the6E: String?

    enum CodingKeys: String, CodingKey {
        case tp = "tp"
        case the6E = "6e"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
