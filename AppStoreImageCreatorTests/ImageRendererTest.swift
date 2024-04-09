//
//  ImageRendererTest.swift
//  AppStoreImageCreatorTests
//
//  Created by Olaf Neumann on 30.03.24.
//

import XCTest

import SwiftImageReadWrite
@testable import AppStoreImageCreator

final class ImageRendererTest: XCTestCase {
    private static let context = CIContext()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSimpleBackgroundImage() throws {
        let asi = AppStoreImage(id: UUID(), background: BackgroundColor(color: Color(red: 1)), elements: [])
        let image = asi.render(for: .iPad10_5)
        XCTAssertNotNil(image)
        
    //    try assert(image: image!, isSameAs: "test-1000x1000-red")
    }
    
    /*private func assert(image: CGImage, isSameAs nameOfExpectedImage: String) throws {
        let actualImage = UIImage(cgImage: image)
        let expectedImage = try! loadImage(withName: nameOfExpectedImage)
        
        assertPixels(of: actualImage, areEqualTo: expectedImage)
        
        /*
        let actualPng = try image?.representation.png(scale: 1, excludeGPSData: true)
        let expectedPng = try loadImage(withName: nameOfExpectedImage).representation.png(scale: 1, excludeGPSData: true)
        
        XCTAssertEqual(actualPng, expectedPng)*/
    }
    
    private func assertPixels(of actualImage: UIImage, areEqualTo expectedImage: UIImage) {
        XCTAssertEqual(actualImage.size, expectedImage.size)
        
        let size = actualImage.size
        for x in 0..<Int(size.width) {
            for y in 0..<Int(size.height) {
                let actualPixel = actualImage.getPixelColor(pos: CGPoint(x: x, y: y))
                let expectedPixel = expectedImage.getPixelColor(pos: CGPoint(x: x, y: y))
                XCTAssertEqual(actualPixel, expectedPixel, "at (\(x):\(y))")
            }
        }
    }
    
    private func loadImage(withName name: String) throws -> UIImage {
        let context = ImageRendererTest.context

        //let path = Bundle.allBundles.compactMap { $0.path(forResource: name, ofType: "png") }.first
        //let path = Bundle.main.path(forResource: name, ofType: "png")
        //let data = try Data(contentsOf: URL(fileURLWithPath: path!))
        
        guard let uiImage = UIImage(named: name) else {
            XCTFail("Unable to load image named: \(name)")
            throw TestError.unableToLoadImage(name: name)
        }
        
        return uiImage
        /*
        guard let ciImage = CIImage(image: uiImage) else {
            XCTFail("Unable to convert image to CIImage: \(name)")
            throw TestError.unableToConvertImageToCIImage(name: name)
        }
        
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            XCTFail("Unable to convert image to CGImage: \(name)")
            throw TestError.unableToConvertImageToCGImage(name: name)
        }
        
        return cgImage*/
    }*/
}

enum TestError: LocalizedError {
    case unableToLoadImage(name: String)
    case unableToConvertImageToCIImage(name: String)
    case unableToConvertImageToCGImage(name: String)
}

/*fileprivate extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}*/
