import Foundation

struct BitMaskCategory {
    static let player : UInt32 = 0x1 << 0       // 00000000000...001    1
    static let base   : UInt32 = 0x1 << 1       // 00000000000...010    2
    static let wall   : UInt32 = 0x1 << 2       // 00000000000...100    4
}
