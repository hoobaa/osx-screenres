import Foundation
import CoreGraphics

var displayConfig: CGDisplayConfigRef = nil
let mainDisplayID = CGMainDisplayID()

var displayMode = CGDisplayCopyDisplayMode(mainDisplayID) // .takeRetainedValue()
var width = CGDisplayModeGetWidth(displayMode)
var height = CGDisplayModeGetHeight(displayMode)

print("current size: \(width)x\(height)")

print("available sizes:")
var modes = CGDisplayCopyAllDisplayModes(mainDisplayID, nil) // .takeRetainedValue()
let modesCount = CFArrayGetCount(modes) - 1
for i in 0...modesCount {
    var mode: CGDisplayModeRef = unsafeBitCast(CFArrayGetValueAtIndex(modes, i), CGDisplayModeRef.self)
    var width = CGDisplayModeGetWidth(mode)
    var height = CGDisplayModeGetHeight(mode)
    print("\t\(i) : \(width)x\(height)")
    if ( i == 1 ) {
        var config: CGDisplayConfigRef = nil
        CGConfigureDisplayWithDisplayMode(config, mainDisplayID, mode, nil)
        //CGCompleteDisplayConfiguration(config, kCGConfigureForSession )
        CGCompleteDisplayConfiguration(config.memory, CGConfigureOption.ForSession)
    }
}
