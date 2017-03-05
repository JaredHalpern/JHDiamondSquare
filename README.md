# JHDiamondSquare

[![CI Status](http://img.shields.io/travis/JaredHalpern/JHDiamondSquare.svg?style=flat)](https://travis-ci.org/JaredHalpern/JHDiamondSquare)
[![Version](https://img.shields.io/cocoapods/v/JHDiamondSquare.svg?style=flat)](http://cocoapods.org/pods/JHDiamondSquare)
[![License](https://img.shields.io/cocoapods/l/JHDiamondSquare.svg?style=flat)](http://cocoapods.org/pods/JHDiamondSquare)
[![Platform](https://img.shields.io/cocoapods/p/JHDiamondSquare.svg?style=flat)](http://cocoapods.org/pods/JHDiamondSquare)


An iterative Objective-C implementation of the diamond square algorithm. This technique is useful for generating tessellated 2D height maps to be used in modeling a cloudy sky, smokey air, or terrain.

__Implementation details:__

The diamond square algorithm requires a 2D array with square dimensions (2^n + 1) where the four corners of the array are set to some initial identical starting value. It is important that the starting value be identical for all four points to ensure the resulting array wraps correctly. The rest of the points in the array may be set to zero or some other value, but will ultimately be overwritten. The specific implementation provided here accounts for wrapping of the far edges, as pointed out in the below StackOverflow discussion.




__A nice online visualization of the algorithm:__

http://www.paulboxley.com/blog/2011/03/terrain-generation-mark-one


__Inspired by and with guidance from:__

http://www.gameprogrammer.com/fractal.html#diamond

http://stackoverflow.com/questions/2755750/diamond-square-algorithm

http://weeab.eu/terrain-generation-with-the-diamond-square-algorithm/



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

JHDiamondSquare is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JHDiamondSquare"
```

## Author

Jared Halpern, jareeedo@gmail.com

## License

JHDiamondSquare is available under the MIT license. See the LICENSE file for more info.
